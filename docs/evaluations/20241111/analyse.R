#!/bin/env Rscript
prevaluation_file <- "../../prevaluations/20241111/results.csv"
evaluation_file <- "results.csv"
alpha_value <- 0.05

testthat::expect_true(file.exists(prevaluation_file))
testthat::expect_true(file.exists(evaluation_file))

t_pre_raw <- readr::read_csv(prevaluation_file, show_col_types = FALSE)
t_post_raw <- readr::read_csv(evaluation_file, show_col_types = FALSE)

missing_learning_objectives_pre <- t_pre_raw[, 14]
other_feedback_post <- t_post_raw[, 14]

t_pre_raw[, 14] <- NULL
t_post_raw[, 14] <- NULL
t_pre_raw$Timestamp <- NULL
t_post_raw$Timestamp <- NULL
testthat::expect_true(all(names(t_pre_raw) == names(t_post_raw)))

#' Shorten the names of the columns
shorten_col_names <- function(t) {
  questions <- stringr::str_remove(
    stringr::str_remove(
      names(t), 
      "Give you confidence levels of the following statements below: \\["),
    "\\]"
  )
  
  names(t) <- questions
  t
}

#' Convert the table to tidy format
#' Add a columns 'i' for the index of an individual
tidy_table <- function(t = t_pre) {
  t$i <- seq(1, nrow(t))
  t_tidy <- tidyr::pivot_longer(t, cols = starts_with("I", ignore.case = FALSE))
  names(t_tidy) <- c("i", "question", "answer")
  t_tidy
}

t_pre_untidy <- shorten_col_names(t_pre_raw)
t_post_untidy <- shorten_col_names(t_post_raw)
testthat::expect_true(all(names(t_pre_untidy) == names(t_post_untidy)))

t_pre <- tidy_table(t_pre_untidy)
t_post <- tidy_table(t_post_untidy)
t_pre$when <- "pre"
t_post$when <- "post"
t <- dplyr::bind_rows(t_pre, t_post)
t$when <- as.factor(t$when)

plot_histrogram <- function(t_tidy) {

  n_individuals <- length(unique(t_tidy$i))
  n_ratings <- length(t_tidy$answer[!is.na(t_tidy$answer)])
  mean_confidence <- mean(t_tidy$answer[!is.na(t_tidy$answer)])
  
  ggplot2::ggplot(t_tidy, ggplot2::aes(x = answer)) +
    ggplot2::geom_density() + 
    ggplot2::labs(
      title = "All confidences",
      caption = paste0(
        "#individuals: ", n_individuals, ". ",
        "#ratings: ", n_ratings, ". ",
        "Mean confidence: ", round(mean_confidence, digits = 2)
      )
    )
  
}

plot_histrogram(t_pre)
plot_histrogram(t_post)


mean_pre <- mean(t[t$when == "pre", ]$answer)
mean_post <- mean(t[t$when == "post", ]$answer)
ks_test <- ks.test(t[t$when == "pre", ]$answer, t[t$when == "post", ]$answer)
ks_test_p_value <- ks_test$p.value
ks_test_is_different <- ks_test$p.value < alpha_value

ggplot2::ggplot(t, ggplot2::aes(x = answer, fill = when)) +
  ggplot2::geom_density(alpha = 0.5) + 
  ggplot2::geom_vline(xintercept = mean_pre, color = "skyblue", lty = "dashed") + 
  ggplot2::geom_vline(xintercept = mean_post, color = "salmon", lty = "dashed") + 
  ggplot2::labs(
    title = "All confidences",
    caption = paste0(
      "Mean pre: ", format(mean_pre, digits = 2), ", ",
      "Mean post: ", format(mean_post, digits = 2), "\n",
      "p value from KS test: ", format(ks_test_p_value, digits = 2), ", ",
      "alpha value: ", alpha_value, ", ",
      "different: ", ks_test_is_different
    )
  )

ggplot2::ggsave(filename = "all_confidences.png", width = 6, height = 2)

ggplot2::ggplot(t, ggplot2::aes(x = answer, fill = when)) +
  ggplot2::geom_density(alpha = 0.5) + 
  ggplot2::facet_grid(rows = "question", scales = "free_y") +
  ggplot2::theme(
    strip.text.y = ggplot2::element_text(angle = 0),
    legend.position = "none"
  ) +
  ggplot2::labs(
    title = "Confidences per question"
  )

ggplot2::ggsave(filename = "confidences_per_question.png", width = 6, height = 7)

names(t)

# Get the average
t_averages <- t |> dplyr::group_by(question, when) |> dplyr::summarise(mean = mean(answer))
ggplot2::ggplot(
  t_averages, 
  ggplot2::aes(x = question, y = mean, fill = when)) +
  ggplot2::geom_col(position = "dodge") + 
  ggplot2::theme(
    strip.text.y = ggplot2::element_text(angle = 0),
    legend.position = "none"
  ) +
  ggplot2::labs(
    title = "Confidences per question"
  )

# Per question, has the distribution changed?
t_stats <- tibble::tibble(question = unique(t$question), mean_pre = NA, mean_post = NA, p_value = NA, different = NA)
for (question in unique(t$question)) {
  pre_values <- t[t$question == question & t$when == "pre", ]$answer
  post_values <- t[t$question == question & t$when == "post", ]$answer
  p <- ks.test(pre_values, post_values)
  t_stats[t_stats$question == question, ]$mean_pre <- mean(pre_values)
  t_stats[t_stats$question == question, ]$mean_post <- mean(post_values)
  t_stats[t_stats$question == question, ]$p_value <- p$p.value
  t_stats[t_stats$question == question, ]$different <- p$p.value < alpha_value
}
t_stats

k <- knitr::kable(t_stats)
readr::write_lines(k, "stats.md")
