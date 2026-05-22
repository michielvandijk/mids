#'@export
print.mids_par <- function(x, ...) {

  cat("multi_country_run: ", x$multi_country_run, "\n")
  cat("country: ", paste(x$country, collapse = ", "), "\n")
  cat("multi_country_region: ", x$multi_country_region, "\n")
  cat("iso3n: ", paste(x$iso3n, collapse = ", "), "\n")
  cat("iso3c: ", paste(x$iso3c, collapse = ", "), "\n")
  cat("continent: ", paste(x$continent, collapse = ", "), "\n")
  cat("adm_level: ", x$adm_level, "\n")
  cat("micro_year: ", x$micro_year, "\n")
  cat("start_year: ", x$start_year, "\n")
  cat("end_year: ", x$end_year, "\n")
  cat("model_path: ", x$model_path, "\n")
  cat("db_path: ", x$db_path, "\n")
  cat("db_path2: ", x$db_path2, "\n")

  invisible(x)
}

