# Building a Prod-Ready, Robust Shiny Application.
# 
# README: each step of the dev files is optional, and you don't have to 
# fill every dev scripts before getting started. 
# 01_start.R should be filled at start. 
# 02_dev.R should be used to keep track of your development during the project.
# 03_deploy.R should be used once you need to deploy your app.
# 
# 
########################################
#### CURRENT FILE: ON START SCRIPT #####
########################################

## Fill the DESCRIPTION ----
## Add meta data about your application
## 
## /!\ Note: if you want to change the name of your app during development, 
## either re-run this function, call golem::set_golem_name(), or don't forget
## to change the name in the app_sys() function in app_config.R /!\
##
first_name <- "Kasper Thystrup"
last_name <- "Karstensen"
golem::fill_desc(
  pkg_name = "zzinflationR",
  pkg_title = "Zero zero-inflation in R",
  pkg_description = paste(
    "A very small project (perhabs future R package one day)",
    "that aims to easily dispose of zero-inflation samples.",
    "Input data are gene (or Transcript) count tables,",
    "generated from RNA sequencing data."
  ),
  author_first_name = first_name,
  author_last_name = last_name,
  author_email = "kathka@gmail.com",
  repo_url = "https://github.com/KasperThystrup/zzinflationR"
)     

## Set {golem} options ----
golem::set_golem_options()

## Create Common Files ----
## See ?usethis for more information
usethis::use_gpl3_license( name = paste(first_name, last_name) )
usethis::use_readme_rmd()
usethis::use_code_of_conduct()
usethis::use_lifecycle_badge( "Experimental" )
usethis::use_news_md()

## Use git ----
usethis::use_git()

## Init Testing Infrastructure ----
## Create a template for tests
golem::use_recommended_tests()

## Use Recommended Packages ----
golem::use_recommended_deps()

## Favicon ----
# If you want to change the favicon (default is golem's one)
golem::use_favicon() # path = "path/to/ico". Can be an online file. 
golem::remove_favicon()

## Add helper functions ----
golem::use_utils_ui()
golem::use_utils_server()

# You're now set! ----

# go to dev/02_dev.R
rstudioapi::navigateToFile( "dev/02_dev.R" )

