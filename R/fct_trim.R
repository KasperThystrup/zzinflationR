#' Trim count table
#' Remove columns which contains 0-counts amounting up to the set threshold in percentages.
#'
#' @param data data.frame as provided by {importCounts}
#' @param threshold numeric Upper threshold in percent for how many zero counts are allowed in a sample (between 1 and 100).
#' @param silent logical to ignore system warnings.
#'
#' @return
#' @export
#'
#' @examples
trimCounts <- function(
  data,
  threshold,
  silent = FALSE
) {
  
  if (silent){
    oldw <- getOption("warn")
    
    # Suppress warnings 
    options(warn = -1)
    
    # Reset global warning settings
    on.exit(options(warn = oldw))
  }
  
  if (threshold > 100) {
    stop("Threshold goes from 1% to 100%")
  } else if (threshold < 1) {
    warning("Threshold numeric, converting to percentages")
    threshold = threshold * 100
  }
  
  # Remove columns with zero inflation (Denotes as NA)
  data[, colMeans(is.na(data)) * 100 < threshold]
}