count_files <- c(
  "fileA.tsv",
  "fileB.tsv",
  "fileC.tsv"
)

fileA <- c(NA, NA, 2, NA, 1)
fileB <- c(9, NA, NA, NA, NA)
fileC <- c(2, NA, 1, 5, 6)

rwnms <- paste0(rep("Gene", 5), c("A", "B", "C", "D", "E"))
data <- data.frame(
  fileA, fileB, fileC,
  row.names = rwnms
)

trimCounts_data <- data.frame(
  fileA, fileC,
  row.names = rwnms
)

testthat::test_that(desc = "Data import function works", {
  
  testthat::expect_equal(
    importCounts(count_files),
    data
  )
})

testthat::test_that(desc = "Data trimming function works", {
  
  testthat::expect_equal(
    trimCounts(data, threshold = 75),
    trimCounts_data
  )
  
  testthat::expect_equal(
    trimCounts(data, threshold = 0.75, silent = TRUE),
    trimCounts_data
  )
  
  testthat::expect_warning(
    trimCounts(data, threshold = 0.75)
  )
  
  testthat::expect_error(
    trimCounts(data, threshold = 101)
  )
})

testthat::test_that(desc = "Data import and trimming works", {
  
  data <- importCounts(count_files)
  
  testthat::expect_equal(
    trimCounts(data, threshold = 75),
    trimCounts_data
  )
})