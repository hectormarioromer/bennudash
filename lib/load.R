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
load.assets <- function(filename = assets_file) {
        # Source: snipe-it custom assets report
        d <- read_csv(filename, 
                col_names = assets_col_names,
                col_types = assets_col_types,
                skip = 1)
        return(d)
}

#' Load category requirements
#'
#' Load category requirements data from specified file
#' @param filename File containing category requirements data
#' @return A tibble
#' @export

source("./lib/config.R")
suppressPackageStartupMessages(library(readr))
load.category_requirements <- function(filename = cat_req_file) {
        # Source: snipe-it custom assets report
        d <- read_csv(filename,
                      col_types = "fffnn")
        return(d)
}

