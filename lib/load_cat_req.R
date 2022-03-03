#' Load category requirements
#'
#' Load category requirements data from specified file
#' @param filename File containing category requirements data
#' @return A tibble
#' @export

source("./lib/config.R")
suppressPackageStartupMessages(library(readr))
load_cat_req <- function(filename = cat_req_file) {
        # Source: snipe-it custom assets report
        d <- read_csv(filename,
                col_types = "ffnn")
        
        return(d)
}