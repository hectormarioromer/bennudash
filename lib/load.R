#' Load data
#'
#' Load assets
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

load.category_requirements <- function(filename = cat_req_file) {
        # Source: snipe-it custom assets report
        d <- read_csv(filename,
                      col_types = "fffnn")
        return(d)
}

#' Load asset maintenances
#'
#' Load asset maintenances data from specified file
#' @param filename File containing asset maintenances data
#' @return A tibble
#' @export

load.asset_maintenances <- function(filename = asset_maint_file) {
        # Source: snipe-it custom assets report
        d <- read_csv(filename, 
                      col_types = asset_maint_cols,
                      na = c("", "NA", "null"))
        return(d)
}

#' Load action logs
#'
#' Load action logs data from specified file
#' @param filename File containing action logs data
#' @return A tibble
#' @export

load.action_logs <- function(filename = action_logs_file) {
        # Source: snipe-it custom assets report
        d <- read_csv(filename)
        return(d)
}