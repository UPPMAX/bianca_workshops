#!/bin/env Rscript

t <- readr::read_csv("survey.csv")
t$Timestamp <- NULL
t$`Any other feedback?` <- NULL
# tail(names(t))
questions <- stringr::str_remove(
  stringr::str_remove(
    names(t), 
    "Give you confidence levels of the following statements \\["),
  "\\]"
)
#new_names <- c(
#  paste0("q0", seq(1, 9)),
#  paste0("q", seq(10, 16))
#)
new_names <- questions
names(t) <- new_names

t$i <- seq(1, nrow(t))

t_tidy <- tidyr::pivot_longer(t, cols = starts_with("I", ignore.case = FALSE))
names(t_tidy)
# No idea why 'starts_with("I", ignore.case = FALSE)' does not work today
#t_tidy$`Any other feedback?` <- NULL

names(t_tidy) <- c("i", "question", "answer")

# Remove NAs
t_tidy <- t_tidy[!is.na(t_tidy$answer), ]


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

ggplot2::ggsave(filename = "confidences_per_question.png", width = 6, height = 7)

names(t_tidy)

average_confidences <- dplyr::group_by(t_tidy, question) |> dplyr::summarise(mean = mean(answer))
  
readr::write_csv(average_confidences, file = "average_confidences.csv")

ggplot2::ggplot(average_confidences, ggplot2::aes(y = question, x = mean)) +
  ggplot2::geom_bar(stat = "identity") 

ggplot2::ggsave(filename = "average_confidences_per_question.png", width = 6, height = 7)

t_sessions_taught <- c(
  "I can log in to the Bianca remote desktop using the website",
  "I can log in to the Bianca console environment using SSH",
  # "I can log in to Bianca via Rackham",        
  "I can navigate to the wharf folder using a graphical file manager",
  "I can manage my files and folders using a graphical file manager", 
  "I can navigate to the wharf folder using a terminal",
  "I can manage my files and folders using a terminal",
  "I can create a minimal executable bash script",              
  "I can use modules",                   
  "I can transfer files to/from Bianca using FileZilla",
  "I can start an interactive session",             
  "I can submit jobs to the scheduler",                              
  "I understand the legal aspects of sensitive data"
)

testthat::expect_true(all(t_sessions_taught %in% unique(t_tidy$question)))

confidences_on_taught_sessions <- t_tidy |> dplyr::filter(question %in% t_sessions_taught)

confidences_on_taught_sessions <- confidences_on_taught_sessions$answer
confidences_on_taught_sessions <- confidences_on_taught_sessions[!is.na(confidences_on_taught_sessions)]

success_score <- mean(confidences_on_taught_sessions) / 5.0
readr::write_lines(x = success_score, "success_score.txt")

