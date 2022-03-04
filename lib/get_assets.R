source("./lib/config.R")
suppressPackageStartupMessages(library(dplyr))
options(dplyr.summarise.inform = FALSE)

get_assets <- function(cat = default_category, sta = default_status) {
        # Load assets data
        ast <- load_assets()
        req <- load_cat_req()
        
        # Filter assets by category and status
        results <- ast %>% 
                filter(category == cat, status == sta) %>%
                group_by(category, location, status) %>%
                select(category, location, status, condition) %>%
                summarise(total = n(), health = mean(condition))
        
        # Join assets requirements
        results <- results %>% 
                left_join(req, by = c("category", "location", "status")) %>%
                mutate(needed = required - total)
        return(results)
}