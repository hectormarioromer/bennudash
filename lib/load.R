#' Load data
#'
#' Load assets
#' @name load_assets
#' @usage load_assets(filename)
#' @param filename File containing assets data.
#' Default value
#' @return A tibble
#' @export
suppressPackageStartupMessages(library(dplyr))
suppressPackageStartupMessages(library(readr))
suppressPackageStartupMessages(library(tidyjson))
suppressPackageStartupMessages(library(tidyr))

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
        # Source: csv file
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
        # Source: snipe-it asset_maintenances
        d <- read_csv(filename, 
                      col_types = asset_maint_cols,
                      na = c("", "NA", "null"))
        return(d)
}

#' Load asset condition logs
#'
#' Load asset condition logs data from specified file
#' @param filename File containing asset condition logs data
#' @return A tibble
#' @export

load.asset_condition_logs <- function(filename = condition_logs_file) {
        # Source: query over snipeit/action_logs
        d <- read_csv(filename, show_col_types = FALSE)

        l <- d$log_meta %>% spread_values(
                value_old = jstring(`_snipeit_condition_2`, old),
                value_new = jstring(`_snipeit_condition_2`, new)
        )
        d <- d %>% bind_cols(l) %>% 
                mutate(value_type = rep('condition', times = nrow(d))) %>%
                select(asset_tag, created_at, value_type, value_old, value_new)
        
        return(d)
}


#' Load asset status logs
#'
#' Load asset status logs data from specified file
#' @param filename File containing asset status logs data
#' @return A tibble
#' @export

load.asset_status_logs <- function(filename = status_logs_file) {
        # Source: query over snipeit/action_logs
        d <- read_csv(filename, show_col_types = FALSE)
        l <- d$log_meta %>% spread_values(
                value_old = jstring(status_id, old),
                value_new = jstring(status_id, new))
        d <- d %>% bind_cols(l) %>% 
                mutate(value_type = rep('status', times = nrow(d))) %>%
                select(asset_tag, created_at, value_type, value_old, value_new)
        return(d)
}