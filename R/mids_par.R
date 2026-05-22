#'@title Sets `mids` parameters
#'
#'@description `mids_par` sets all required parameters to run `mids`, including
#'  core model folders, country code and year.
#'
#'@details `mids_par` creates an object of class `mids_par`, which bundles all
#'  required `mids` parameters set by the user: model and database folder, three
#'  digit country code, country name and continent.#'
#'  [countrycode::countrycode()] is used to determine the full country name,
#'  three digit country code and continent on the basis of the alpha-3 country
#'  code. This information is required to extract country specific information
#'  from several datasets.
#'
#'@param model_path character. Folder where the model files are stored. Note
#'  that R uses forward slash or double backslash to separate folder names.
#'@param db_path character. Folder where the input database is stored.
#'@param db_path2 character. Optional second folder where the input database is
#'  stored, for instance when household survey needs to be stored on a secured
#'  location.
#'@param multi_country_run logical. Whether the model is run for multiple
#'  countries in a region for which survey information and constraint data is
#'  available in single files. If TRUE, MIDS is looped over multiple countries
#'  in a region. In this case the `iso3c` parameter must be a vector of country
#'  codes, and the `region` parameter must be specified to determine which
#'  countries to loop over. If FALSE, the model is run for a single country, and
#'  the `iso3c` parameter must be a single country code. The default is FALSE.
#'@param iso3c character. Vector with one or more (see `multi_country_run`)
#'  three letter ISO 3166-1 alpha-3 country codes, also referred to as iso3c. A
#'  list of country codes can be found in
#'  [Wikipedia](https://en.wikipedia.org/wiki/ISO_3166-1_alpha-3).
#'@param multi_country_region character. Region or continent in which the
#'  country is located required to loop the model over regional datasets (see
#'  `multi_country_run`). The default is FALSE.
#'@param adm_level numeric. Administrative unit level at which the model is run.
#'  This needs to correspond with the information in the shapefile of the
#'  administrative units, which is needed as input.
#'@param micro_year numeric. Year for which the micro data (household survey) is
#'  available.
#'@param start_year numeric. Start year of the simulation period.
#'@param end_year numeric. End year of the simulation period.
#'
#'@return mids_par object
#'
#'@examples
#'\dontrun{
#'mids_par(model_path = "C:/temp/mids_eth", db_path = "C:/temp/mids_db",
#'multi_country_run = TRUE, iso3c = "ETH", multi_country_region = "Africa",
#'adm_level = 2, micro_year = 2018, proj_year = 2021, start_year = 2018, end_year = 2050)
#'}
#'@export
mids_par <- function(model_path = NULL,
                     db_path = NULL,
                     db_path2 = NULL,
                     iso3c = NULL,
                     multi_country_run = FALSE,
                     multi_country_region = NULL,
                     adm_level = NULL,
                     micro_year = NULL,
                     start_year = NULL,
                     end_year = NULL) {

  if (is.null(model_path)) stop("model_path is not defined", call. = FALSE)
  if (is.null(db_path)) stop("db_path is not defined", call. = FALSE)
  if (is.null(db_path2)) stop("db_path2 is not defined", call. = FALSE)

  if (is.null(iso3c)) stop("iso3c not defined", call. = FALSE)

  iso3c <- toupper(iso3c)

  if (any(is.na(iso3c))) {
    stop("iso3c contains NA", call. = FALSE)
  }

  if (!all(grepl("^[A-Z]{3}$", iso3c))) {
    stop("All iso3c must be three-letter codes", call. = FALSE)
  }

  if (!multi_country_run && length(iso3c) > 1) {
    stop("Provide a single iso3c when multi_country_run = FALSE", call. = FALSE)
  }

  if (multi_country_run && is.null(multi_country_region)) {
    stop("multi_country_region is not defined", call. = FALSE)
  }

  if (is.null(adm_level) || !is.numeric(adm_level)) {
    stop("adm_level must be numeric", call. = FALSE)
  }

  if (is.null(start_year) || !is.numeric(start_year)) {
    stop("start_year must be numeric", call. = FALSE)
  }

  if (start_year < 2000 || start_year > 2030) {
    message("start_year seems to have an unrealistic value")
  }

  if (is.null(micro_year) || !is.numeric(micro_year)) {
    stop("micro_year must be numeric", call. = FALSE)
  }

  if (is.null(end_year) || !is.numeric(end_year)) {
    stop("end_year must be numeric", call. = FALSE)
  }

  param <- list(
    iso3c = iso3c,
    country = countrycode::countrycode(iso3c, "iso3c", "country.name"),
    iso3n = countrycode::countrycode(iso3c, "iso3c", "iso3n"),
    continent = countrycode::countrycode(iso3c, "iso3c", "continent"),
    multi_country_run = multi_country_run,
    multi_country_region = multi_country_region,
    adm_level = adm_level,
    micro_year = micro_year,
    start_year = start_year,
    end_year = end_year,
    model_path = model_path,
    db_path = db_path,
    db_path2 = db_path2
  )

  class(param) <- "mids_par"

  return(param)
}
