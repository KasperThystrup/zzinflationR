#' Import count files
#' 
#' Automatically imports count files and converts 0 values to NA,
#' for easier zero-inflation removal.
#' 
#' Note all input files, must contain the same Gene or Transcript ID's. These must likewise be ordered identically.
#'
#' @param count_files Character vector with absolute paths to count files
#' @param skip Integer for defining how many lines to skip from the start of the file
#' @param skip_end Integer for defining how many lines to skip from the end of the file
#'
#' @return
#' A data.frame consisting of ID by rownames and count values by columns.
#' Each column are named after the filename, without their file extensions.
#' 
#' @importFrom tools file_path_sans_ext
#' @importFrom readr read_tsv
#' @importFrom plyr join_all
#' @importFrom tibble column_to_rownames `%>%`
#' @export
importCounts <- function(
  count_files,
  skip = 0,
  skip_end = 5
) {
  counts <- lapply(count_files, function(f) {
    name <- basename(f) %>%
      file_path_sans_ext(x = .)
    
    cols <- c("ID", name)
    
    read_tsv(file = f, col_names = cols, col_types = "cd", na = "0", skip = skip)
  })
  
  counts <- join_all(dfs = counts, by = "ID") %>%
    column_to_rownames("ID")
  
  head(counts, nrow(counts) - skip_end)
}