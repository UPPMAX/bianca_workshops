#!/bin/env Rscript

# General info
course_name <- "Bianca Intermediate"
course_date <- "2024-05-24"
course_date_str <- stringr::str_replace_all(course_date, "-", "")

n_learners_in_time_wide <- readr::read_csv(
  "20240524_n_learners_in_time.csv"
  )

# Check data
n_measurements <- nrow(n_learners_in_time_wide)
n_total_learners <- sum(n_learners_in_time_wide$n_new)
testthat::expect_true(
  all(
    n_learners_in_time_wide$n_present[2:(n_measurements-1)] ==
      n_learners_in_time_wide$n_present[1:(n_measurements-2)] +
      n_learners_in_time_wide$n_new[2:(n_measurements-1)] -
      n_learners_in_time_wide$n_left[2:(n_measurements-1)]
    
  )
)  

n_learners_in_time <- tidyr::pivot_longer(n_learners_in_time_wide, cols = c(n_present, n_new, n_left))
names(n_learners_in_time) <- c("time", "type", "amount")
n_learners_in_time$type <- as.factor(n_learners_in_time$type)

events <- tibble::tribble(
  ~xmin, ~xmax, ~event,
  "9:00", "10:00", "orange",
  "10:00", "10:15", "blue",
  "10:15", "10:35", "orange",
  "11:00", "11:15", "blue",
  "12:06", "13:00", "blue",
  "14:00", "14:15", "blue",
  "15:00", "15:15", "blue",
  "15:30", "16:00", "orange"
)
events$xmin <- readr::parse_time(events$xmin)
events$xmax <- readr::parse_time(events$xmax)
events$ymax <- n_total_learners
events$ymin <- 0

ggplot2::ggplot(
  data = n_learners_in_time,
  mapping = ggplot2::aes(x = time, y = amount, color = type)
) + ggplot2::geom_line() + 
  ggplot2::geom_point(size = 5) + 
  ggplot2::scale_y_continuous(
    name = "Number of learners"
  ) +
  ggplot2::scale_x_time(
    name = "Time", 
    breaks = seq(
      from = readr::parse_time("9:00"), 
      to = readr::parse_time("16:00"), 
      length.out = 8
    )
  ) +
  ggplot2::theme(text = ggplot2::element_text(size = 20)) +
  ggplot2::theme(axis.text.x = ggplot2::element_text(angle = 90, vjust = 0.5, hjust=1)) +
  ggplot2::labs(
    title = "Number of learners in time",
    caption = paste0(course_name, ", ", course_date, ", blue = break\nnumber of learners: ", n_total_learners)
  ) + ggplot2::geom_rect(
    data = events,
    inherit.aes = FALSE, 
    ggplot2::aes(
      xmin = xmin,
      ymin = ymin,
      xmax = xmax,
      ymax = ymax
    ),
    fill = ggplot2::alpha(events$event, 0.5)
  )

png_filename <- paste0(course_date_str, "_n_learners_in_time.png")
ggplot2::ggsave(png_filename, width = 7, height = 7)


# Percentage present and percentage left in time
n_perc_in_time_wide <- n_learners_in_time_wide
n_perc_in_time_wide$f_present <- n_perc_in_time_wide$n_present / sum(n_perc_in_time_wide$n_new)
n_perc_in_time_wide$f_has_been_present <- (cumsum(n_perc_in_time_wide$n_new) / sum(n_perc_in_time_wide$n_new))
n_perc_in_time_wide$f_has_left <- (cumsum(n_perc_in_time_wide$n_left) / sum(n_perc_in_time_wide$n_new))
n_perc_in_time_wide$n_present <- NULL
n_perc_in_time_wide$n_new <- NULL
n_perc_in_time_wide$n_left <- NULL
n_perc_in_time_wide

n_perc_in_time <- tidyr::pivot_longer(n_perc_in_time_wide, cols = c(f_present, f_has_been_present, f_has_left))
names(n_perc_in_time) <- c("time", "type", "fraction")
n_perc_in_time$type <- as.factor(stringr::str_sub(n_perc_in_time$type, start = 3))

ggplot2::ggplot(
  data = n_perc_in_time,
  mapping = ggplot2::aes(x = time, y = fraction, color = type)
) + ggplot2::geom_line() + 
  ggplot2::geom_point(size = 5) + 
  ggplot2::scale_y_continuous(
    name = "Cumulative percentages of learners in time",
    labels = scales::percent
  ) +
  ggplot2::scale_x_time(
    name = "Time", 
    breaks = seq(
      from = readr::parse_time("9:00"), 
      to = readr::parse_time("16:00"), 
      length.out = 8
    )
  ) +
  ggplot2::theme(text = ggplot2::element_text(size = 20)) +
  ggplot2::theme(axis.text.x = ggplot2::element_text(angle = 90, vjust = 0.5, hjust=1)) +
  ggplot2::labs(
    title = "Cumulative percentages of learners in time",
    caption = paste0(
      course_name, ", ", course_date, ", blue = break",
      "\nnumber of learners: ", n_total_learners
    )
  ) + ggplot2::geom_rect(
    data = events,
    inherit.aes = FALSE, 
    ggplot2::aes(
      xmin = xmin,
      ymin = ymin,
      xmax = xmax,
      ymax = 1.0
    ),
    fill = ggplot2::alpha(events$event, 0.5)
  ) + ggplot2::theme(legend.position = "bottom")

png_filename <- paste0(course_date_str, "_f_cumulative_learners_in_time.png")
ggplot2::ggsave(png_filename, width = 7, height = 7)
