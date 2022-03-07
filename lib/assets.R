suppressPackageStartupMessages(library(dplyr))
options(dplyr.summarise.inform = FALSE)

source("./lib/config.R")
source("./lib/load.R")

assets.by_category <- function(cat = default_category, sta = default_status) {
        # Load assets data
        assets <- load.assets()
        req <- load.category_requirements()
        
        # Grabs columns of interest
        results <- assets %>% select(category, location, status, condition)
        # Filter by category, if not ALL
        if (cat != "ALL") {
                # First filter 
                results <- results %>% 
                        filter(category == cat)   
        }
        # Filter by status if not ALL
        if (sta != "ALL") {
                results <- results %>% 
                        filter(status == sta)   
        }
        # Complete the transformations
        results <- results %>% 
                group_by(category, location, status) %>%
                summarise(total = n(), condition = round(mean(condition), 
                                                      digits = 2))
        
        # Join requirements, calculate "needed" column
        results <- results %>% 
                left_join(req, by = c("category", "location", "status")) %>%
                mutate(needed = req_quantity - total, 
                       coverage = round((total/req_quantity)*100, digits = 2),
                       health = round((condition/req_condition)*100, digits = 2))
        return(results)
}

assets.by_location <- function(loc = default_location, sta = default_status) {
        # Load assets data
        assets <- load.assets()
        req <- load.category_requirements()
        
        # Grabs columns of interest
        results <- assets %>% select(location, category, status, condition)
        # Filter by category, if not ALL
        if (loc != "ALL") {
                # First filter 
                results <- results %>% 
                        filter(location == loc)   
        }
        # Filter by status if not ALL
        if (sta != "ALL") {
                results <- results %>% 
                        filter(status == sta)   
        }
        # Complete the transformations
        results <- results %>% 
                group_by( location, category, status) %>%
                summarise(total = n(), condition = round(mean(condition), 
                                                      digits = 2))
        
        # Join requirements, calculate "needed" column
        results <- results %>% 
                left_join(req, by = c("category", "location", "status")) %>%
                mutate(needed = req_quantity - total,
                       coverage = round((total/req_quantity)*100, digits = 2),
                       health = round((condition/req_condition)*100, digits = 2))
        return(results)
}

assets.by_project <- function(pro = default_project, cat = default_category) {
        # Load assets data
        assets <- load.assets()
        req <- load.category_requirements()
        
        # Grabs columns of interest
        results <- assets %>% select(project, category, condition)
        # Filter by category, if not ALL
        if (pro != "ALL") {
                # First filter 
                results <- results %>% 
                        filter(project == pro)   
        }
        # Filter by status if not ALL
        if (cat != "ALL") {
                results <- results %>% 
                        filter(category == cat)   
        }
        # Complete the transformations
        results <- results %>% 
                group_by(project, category) %>%
                summarise(total = n(), health = round(mean(condition), 
                                                      digits = 2))
        return(results)
}