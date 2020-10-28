#' @export
toTsv <- function(
  data,
  path,
  colnames = FALSE
) {
  readr::write_tsv(x = data, path = path, col_names = colnames, na = 0)
  TRUE
}