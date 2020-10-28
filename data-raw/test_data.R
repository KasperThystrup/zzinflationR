## code to prepare `test_counts` dataset goes here
fileA <- c(0, 0, 2, 0, 1)
fileB <- c(9, 0, 0, 0, 0)
fileC <- c(2, 0, 1, 5, 6)

rwnms <- paste0(rep("Gene", 5), c("A", "B", "C", "D", "E"))
test_data <- data.frame(
  fileA, fileB, fileC,
  row.names = rwnms
)

dplyr::select(test_data, fileA) %>%
  tibble::rownames_to_column("why?") %>%
  readr::write_tsv(path = "tests/fileA.tsv", col_names = FALSE)

dplyr::select(test_data, fileB) %>%
  tibble::rownames_to_column("why?") %>%
  readr::write_tsv(path = "tests/fileB.tsv", col_names = FALSE)

dplyr::select(test_data, fileC) %>%
  tibble::rownames_to_column("why?") %>%
  readr::write_tsv(path = "tests/fileC.tsv", col_names = FALSE)

usethis::use_data(test_data, overwrite = TRUE, internal = TRUE)
