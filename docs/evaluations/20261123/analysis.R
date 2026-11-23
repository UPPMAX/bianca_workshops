#!/bin/env Rscript

get_raw_data <- function() {
  readr::read_csv("evaluation_results.csv", show_col_types = FALSE)
}
testthat::expect_no_error(get_raw_data())

get_confidences_wide <- function() {
  t <- get_raw_data() |> dplyr::select(starts_with("Give you"))
  names(t) <- stringr::str_remove(names(t), "Give you confidence levels of the following statements below:\n \\[")
  names(t) <- stringr::str_remove(names(t), "\\]")
  t
}
testthat::expect_no_error(get_confidences_wide())

get_confidences <- function() {
  t <- get_confidences_wide() |>
    tidyr::pivot_longer(
      cols = starts_with("I"),
      names_to = "learning_outcome",
      values_to = "confidence"
    )
  t$learning_outcome <- as.factor(t$learning_outcome)
  t
}
testthat::expect_no_error(get_confidences())

get_achievements_wide <- function() {
  t <- get_raw_data() |> dplyr::select(starts_with("Have you"))
  names(t) <- stringr::str_remove(names(t), "Have you achieved the following: \\[")
  names(t) <- stringr::str_remove(names(t), "\\]")
  t
}
testthat::expect_no_error(get_achievements_wide())

get_achievements <- function() {
  t <- get_achievements_wide() |>
    tidyr::pivot_longer(
      cols = starts_with("I"),
      names_to = "learning_outcome",
      values_to = "achieved"
    )
  t$learning_outcome <- as.factor(t$learning_outcome)
  t$achieved <- as.factor(t$achieved)
  t
}
testthat::expect_no_error(get_achievements())
