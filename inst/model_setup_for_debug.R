# ========================================================================================
# Project:  mids
# Subject:  Script to set model parameters
# Author:   Michiel van Dijk
# Contact:  michiel.vandijk@wur.nl
# ========================================================================================

# ========================================================================================
# SETUP ----------------------------------------------------------------------------------
# ========================================================================================

# Load pacman for p_load
if(!require(pacman)) install.packages("pacman")
library(pacman)

library(mids)

# Load required packages
p_load(broom, countrycode, dotwhisker, here, ggspatial, glue, haven, imputeTS, ipumsr,
       janitor, furrr, progressr, terra, texreg, tidyverse, readxl, scales, sf, tictoc,
       laeken, ipfr, naniar)

# R options
options(scipen = 999) # Suppress scientific notation
options(digits = 4)


# ========================================================================================
# SET MODEL PARAMETERS -------------------------------------------------------------------
# ========================================================================================

# Set the folders where the scripts, model and database will be stored.
# Note that R uses forward slashes even in Windows!!

# Creates a model folder structure in model_path. The user can replace the name
# with the country code of the case-study country or choose another new name.
# db_path sets the location of ssid_db.

# Set mids parameters
param <- mids_par(
  model_path = "W:/WECR/brightspace_eurostat/mids_eu/data/processed",
  db_path = "W:/WECR/brightspace_eurostat/mids_eu/data/raw",
  multi_country_run = TRUE,
  multi_country_region = "EU27",
  iso3c = c("NLD", "BEL"),
  micro_year = 2024,
  start_year = 2024,
  end_year = 2050,
  adm_level = 2)

print(param)

# set ssid_db
ssid_db_version <- "v0.0.1"

# set sim_version
#sim_version <- "2026-09-02"

# set magnet_version
#magnet_version <- "2025-03-27"
