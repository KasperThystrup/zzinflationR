#' Import count files
#' 
#' Automatically imports count files and converts 0 values to NA,
#' for easier zero-inflation removal.
#' 
#' Note all input files, must contain the same Gene or Transcript ID's. These must likewise be ordered identically.
#'
#' @param count_files Character vector with absolute paths to count files
#' @param skip Integer for defining how many lines to skip in the count files
#'
#' @return
#' A data.frame consisting of ID by rownames and count values by columns.
#' Each column are named after the filename, without their file extensions.
#' @export
#'
#' @examples
importCounts <- function(
  count_files,
  skip = 0
) {
  counts <- lapply(count_files, function(f) {
    name <- basename(f) %>%
      tools::file_path_sans_ext(x = .)
    
    cols <- c("ID", name)
    
    readr::read_tsv(file = f, col_names = cols, col_types = "cd", na = "0", skip = skip)
  })
  
  plyr::join_all(dfs = counts, by = "ID") %>%
    tibble::column_to_rownames("ID")
}