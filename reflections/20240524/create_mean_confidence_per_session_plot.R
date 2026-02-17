#!/bin/env Rscript
raw_table <- readr::read_csv(
  "20240524.csv"
  )

remove_irrevant_cols <- function(t) {
  t$Tidstämpel <- NULL
  t$`In the course, what should we keep doing?` <- NULL
  t$`In the course, which section(s) scheduled enough time for exercises?` <- NULL
  t$`In the course, what should we improve?` <- NULL
  t$`Are there any other comments on the course?` <- NULL
  names(t) <- stringr::str_extract(names(t), pattern = "\\[.*\\]")
  names(t) <- stringr::str_sub(names(t), start = 2, end = -2)
  t 
}

google_forms_table <- remove_irrevant_cols(t = raw_table)
table_with_rowname <- t(google_forms_table)

# No rownames
table <- tibble::tibble(matrix(nrow = nrow(table_with_rowname), ncol = 5))
table[ , 1] <- rownames(table_with_rowname)
table[ , 2:5] <- table_with_rowname[ , 1:4]
names(table) <- c("session", paste0("learner_", 1:4))
table

tidy_table <- tidyr::pivot_longer(table, cols = 2:5)

confidence_per_topic <- dplyr::summarise(
  dplyr::group_by(tidy_table, session), 
  mean_confidence = mean(value)
)
confidence_per_topic
ggplot2::ggplot(
  data = confidence_per_topic,
  mapping = ggplot2::aes(x = session, y = mean_confidence)
) + ggplot2::geom_col() + 
  ggplot2::scale_y_continuous(limits = c(0, 5)) +
  ggplot2::theme(axis.text.x = ggplot2::element_text(angle = 90, vjust = 0.5, hjust=1))

ggplot2::ggsave("20240524_mean_confidence_per_session.png", height = 7)
