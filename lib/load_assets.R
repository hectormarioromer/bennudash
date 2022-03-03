#' Load assets
#'
#' Load assets data from specified file
#' @name load_assets
#' @usage load_assets(filename)
#' @param filename File containing assets data.
#' Default value
#' @return A tibble
#' @export

suppressPackageStartupMessages(library(readr))

source("./lib/config.R")
load_assets <- function(filename = assets_file) {
        # Source: snipe-it custom assets report
        d <- read_csv(filename, 
                col_names = assets_col_names,
                col_types = assets_col_types,
                skip = 1)
        
        return(d)
}