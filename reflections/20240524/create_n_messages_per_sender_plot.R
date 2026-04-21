#!/bin/env Rscript
chat_text_all <- readr::read_lines(
  "meeting_saved_chat.txt"
)
chat_text_between <- stringr::str_subset(chat_text_all, pattern = "From.*To")
chat_text_between <- stringr::str_replace(chat_text_between, pattern = " From ", replacement = ",")
chat_text_between <- stringr::str_replace(chat_text_between, pattern = " To ", replacement = ",")
chat_text_between <- stringr::str_replace(chat_text_between, pattern = ":$", replacement = "")
chat_text_between
readr::write_lines(x = chat_text_between, file = "meeting_saved_chat.csv")

t <- readr::read_csv(
  "meeting_saved_chat.csv",
  col_names = FALSE
)
names(t) <- c("time", "from", "to")
t$from <- stringr::str_replace(t$from, ".*Bilderbeek.*", "R")
t$from <- stringr::str_replace(t$from, ".*Diana.*", "C1")
t$from <- stringr::str_replace(t$from, ".*Lars.*", "C2")
t$from <- stringr::str_replace(t$from, ".*Claremar.*", "C3")
t$from <- stringr::str_replace(t$from, ".*Jonas.*", "C4")
t$from <- stringr::str_replace(t$from, ".*Darian.*", "L1")
t$from <- stringr::str_replace(t$from, ".*Saeedeh.*", "L2")
t$from <- stringr::str_replace(t$from, ".*Sakshi.*", "L3")
t$from <- stringr::str_replace(t$from, ".*Litika.*", "L4")

n_messages_richel <- nrow(t)
print(paste("n_messages_richel:", n_messages_richel))

# Only select general messages
t <- t[t$to == "Everyone", ]

n_messages_richel_to_general <- nrow(t)
print(paste("n_messages_richel_to_general:", n_messages_richel_to_general))
n_messages_richel_in_private <- n_messages_richel- n_messages_richel_to_general
print(paste("n_messages_richel_in_private:", n_messages_richel_in_private))

n_from <- dplyr::tally(dplyr::group_by(t, from))

n_from

ggplot2::ggplot(n_from, mapping = ggplot2::aes(x = from, y = n)) + 
  ggplot2::geom_col() + 
  ggplot2::scale_y_continuous(name = "Number of chat messages sent to everyone") +
  ggplot2::scale_x_discrete(name = "Sender") +
  ggplot2::theme(text = ggplot2::element_text(size = 20)) +
  ggplot2::theme(axis.text.x = ggplot2::element_text(angle = 90, vjust = 0.5, hjust=1)) +
  ggplot2::labs(caption = "Bianca Intermediate, 2024-05-24")

ggplot2::ggsave("20240524_n_messages_per_sender.png", width = 7, height = 7)

