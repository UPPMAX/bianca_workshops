#!/bin/env Rscript

read_data <- function() {
  readr::read_csv("responses.csv", show_col_types = FALSE)
}

t <- read_data()

#####################################################
# Other feedback
#####################################################

comments <- t |> 
  dplyr::select(starts_with("An other feedback?"))
names(comments) <- "comment"
comments <- comments |> dplyr::filter(!is.na(comment))
readr::write_lines(comments$comment, "comments.txt")

#####################################################
# Confidences
#####################################################

t <- read_data()

names(t)


# Select confidence questions
t <- t |> dplyr::select(dplyr::starts_with("Give you confidence levels of the following statements below"))

names(t) <- stringr::str_sub(stringr::str_extract(names(t), "\\[.*\\]"), 2, -2)

t <- t |> 
  dplyr::mutate_all(~ replace(., . == "I can absolutely do this!", 5)) |>
  dplyr::mutate_all(~ replace(., . == "I have good confidence I can do this", 4)) |>
  dplyr::mutate_all(~ replace(., . == "I have some confidence I can do this", 3)) |>
  dplyr::mutate_all(~ replace(., . == "I have low confidence I can do this", 2)) |>
  dplyr::mutate_all(~ replace(., . == "I have no confidence I can do this", 1)) |>
  dplyr::mutate_all(~ replace(., . == "I don't know even what this is about ...?", 0)) |>
  dplyr::mutate_all(~ replace(., . == "I did not attend that session", NA)) 
t$i <- seq(1, nrow(t))

t_tidy <- tidyr::pivot_longer(t, cols = starts_with("I", ignore.case = FALSE))
t_tidy <- t_tidy |> dplyr::filter(!is.na(value))
names(t_tidy) <- c("i", "question", "answer")
t_tidy$answer <- as.numeric(t_tidy$answer)

n_individuals <- length(unique(t_tidy$i))
n_ratings <- length(t_tidy$answer[!is.na(t_tidy$answer)])

mean_confidence <- mean(t_tidy$answer[!is.na(t_tidy$answer)])

ggplot2::ggplot(t_tidy, ggplot2::aes(x = answer)) +
  ggplot2::geom_histogram() + 
  ggplot2::labs(
    title = "All confidences",
    caption = paste0(
      "#individuals: ", n_individuals, ". ",
      "#ratings: ", n_ratings, ". ",
      "Mean confidence: ", round(mean_confidence, digits = 2)
    )
  )

ggplot2::ggsave(filename = "all_confidences.png", width = 4, height = 2)

ggplot2::ggplot(t_tidy, ggplot2::aes(x = answer)) +
  ggplot2::geom_histogram() + 
  ggplot2::facet_grid(rows = "question", scales = "free_y") +
  ggplot2::theme(
    strip.text.y = ggplot2::element_text(angle = 0),
    legend.position = "none"
  ) +
  ggplot2::labs(
    title = "Confidences per question"
  )

ggplot2::ggsave(filename = "confidences_per_question.png", width = 7, height = 7)

average_confidences <- dplyr::group_by(t_tidy, question) |> dplyr::summarise(mean = mean(answer))
average_confidences$mean <- round(average_confidences$mean, digits = 2)

# Keep these chronologically
readr::write_csv(average_confidences, file = "average_confidences.csv")

# Sort by value
average_confidences <- average_confidences |> dplyr::arrange(mean)
average_confidences$question <- as.factor(average_confidences$question)
average_confidences$question <- reorder(
  x = average_confidences$question, 
  X = order(average_confidences$mean),
  decreasing = TRUE
)
  

average_average_confidence <- mean(average_confidences$mean)

ggplot2::ggplot(
  average_confidences, 
  ggplot2::aes(y = question, x = mean)
) +
  ggplot2::geom_bar(stat = "identity") +
  ggplot2::scale_x_continuous(
    limits = c(0, 5),
    breaks = seq(0.0, 5.0, by = 0.5)
  ) +
  ggplot2::geom_vline(xintercept = average_average_confidence, lty = "dashed") +
  ggplot2::theme(
    strip.text.y = ggplot2::element_text(angle = 0),
    legend.position = "bottom"
  ) +
  ggplot2::labs(
    title = "Confidences per question",
    caption = paste0(
      " Dashed line denotes the average at ", round(average_average_confidence, digits = 2)
    )
  )

ggplot2::ggsave(filename = "average_confidences_per_question.png", width = 7, height = 7)


t_sessions_taught <- unique(t_tidy$question)

# Cut out sessions if needed

testthat::expect_true(all(t_sessions_taught %in% t_tidy$question))

confidences_on_taught_sessions <- t_tidy |> dplyr::filter(question %in% t_sessions_taught)
success_score <- mean(confidences_on_taught_sessions$answer) / 5.0
readr::write_lines(x = success_score, "success_score.txt")

