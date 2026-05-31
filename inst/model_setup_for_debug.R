
# ========================================================================================
# SETUP ----------------------------------------------------------------------------------
# ========================================================================================

# Load pacman for p_load
if(!require(pacman)) install.packages("pacman")
library(pacman)

# Load required packages
p_load(mids, broom, countrycode, dotwhisker, here, ggspatial, glue, haven, imputeTS, ipumsr,
       janitor, furrr, progressr, terra, texreg, tidyverse, readxl, scales, sf, tictoc,
       laeken, ipfr, naniar, scico, ggpubr, ggthemes, patchwork, ggridges)

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

# Path
# Michiel WSER
if(Sys.info()["user"] == "dijk158") {
  proj_path <- "W:/WECR/brightspace_eurostat/mids_eu"
  db_path <- "W:/WECR/brightspace_eurostat/mids_db"
  db_path2 <- "W:/WECR/brightspace_eurostat/raw_data"
}


# We focus on EU27 countries.
eu27_iso3c <- c("AUT", "BEL", "BGR", "HRV", "CYP", "CZE", "DNK",
                "EST", "FIN", "FRA", "DEU", "GRC", "HUN", "IRL",
                "ITA", "LVA", "LTU", "LUX", "MLT", "NLD", "POL",
                "PRT", "ROU", "SVK", "SVN", "ESP", "SWE")

# Set mids parameters
param <- mids_par(
  model_path = file.path(proj_path, "mids"),
  db_path = db_path,
  db_path2 = db_path2,
  multi_country_run = TRUE,
  multi_country_region = "EU27",
  iso3c = eu27_iso3c,
  micro_year = 2021,
  start_year = 2020,
  end_year = 2050,
  adm_level = 2)

print(param)

# set ssid_db
ssid_db_version <- "v0.0.1"

# set sim_version
sim_version <- "2026-09-02"

# set magnet_version
magnet_version <- "2025-03-27"
