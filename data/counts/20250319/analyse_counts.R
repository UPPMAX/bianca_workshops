#!/bin/env Rscript
t <- readr::read_csv("20250319_counts.csv", show_col_types = FALSE)
t$n <- t$n_cam_on + t$n_cam_off

ggplot2::ggplot(
  t,
  ggplot2::aes(x = time, y = n)
) + ggplot2::geom_line() +
   ggplot2::geom_point() + 
  ggplot2::geom_area(ggplot2::aes(x = time, y = n_cam_on), fill = "#AAA") +
   ggplot2::geom_point() + 
  ggplot2::scale_x_time(
    limits = c(
      readr::parse_time("9:00"), 
      readr::parse_time("16:00")
    )
  ) + ggplot2::scale_y_continuous(limits = c(0, NA)) + 
  ggplot2::labs(
    title = "Number of learners in time",
    caption = "Shaded area: learners with camera turned on"
  )

ggplot2::ggsave("n_learners_in_time.png", width = 7, height = 4)
