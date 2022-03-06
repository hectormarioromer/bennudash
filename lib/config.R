# Configuration
suppressPackageStartupMessages(library(readr))

# General default values
default_category <- "ALL"
default_status <- "Deployed (deployed)"
default_location <- "ALL"
default_project <- "ALL"

# Default file names
assets_file <- "./data/assets.csv"
cat_req_file <- "./data/category_requirements.csv"

# Assets
assets_col_names <- c("company", "asset_name", "asset_tag", "model",
                "model_no", "category", "manufacturer", "serial",
                "purchased", "cost", "eol", "order_number", "supplier",
                "location", "loc_addr1", "loc_addr2", "loc_city", "loc_state",
                "loc_country", "loc_zip", "def_location","def_loc_addr1",
                "def_loc_addr2", "def_loc_city", "def_loc_state", 
                "def_loc_country", "def_loc_zip", "checked_out", "type", 
                "username", "employee_no","manager", "department", "title",
                "status", "warranty", "warranty_expires", "value", "diff",
                "fully_depreciated", "checked_out_date", 
                "expected_checkin_date", "created_at", "updated_at",
                "last_audit", "next_audit", "notes", "mac_address", "condition",
                "os_version", "comments", "project", "imei1", 
                "imei2", "fidelization_date", "contract_length")

assets_col_types <- cols(
        company = col_factor(),
        asset_name = col_character(),
        asset_tag = col_character(),
        model = col_factor(),
        model_no = col_factor(),
        category = col_factor(),
        manufacturer = col_factor(),
        serial = col_character(),
        purchased = col_datetime(format = ""),
        cost = col_number(),
        eol = col_datetime(format = ""),
        order_number = col_character(),
        supplier = col_factor(),
        location = col_factor(),
        loc_addr1 = col_character(),
        loc_addr2 = col_character(),
        loc_city = col_factor(),
        loc_state = col_factor(),
        loc_country = col_factor(),
        loc_zip = col_factor(),
        def_location = col_factor(),
        def_loc_addr1 = col_character(),
        def_loc_addr2 = col_character(),
        def_loc_city = col_factor(),
        def_loc_state = col_factor(),
        def_loc_country = col_factor(),
        def_loc_zip = col_factor(),
        checked_out = col_factor(),
        type = col_factor(),
        username = col_character(),
        employee_no = col_character(),
        manager = col_character(),
        department = col_character(),
        title = col_character(),
        status = col_factor(),
        warranty = col_double(),
        warranty_expires = col_date(format = ""),
        value = col_number(),
        diff = col_double(),
        fully_depreciated = col_logical(),
        checked_out_date = col_datetime(format = ""),
        expected_checkin_date = col_datetime(format = ""),
        created_at = col_datetime(format = ""),
        updated_at = col_datetime(format = ""),
        last_audit = col_datetime(format = ""),
        next_audit = col_datetime(format = ""),
        notes = col_character(),
        mac_address = col_character(),
        condition = col_double(),
        os_version = col_character(),
        comments = col_character(),
        project = col_character(),
        imei1 = col_character(),
        imei2 = col_character(),
        fidelization_date= col_datetime(format = ""),
        contract_length = col_number()
)
