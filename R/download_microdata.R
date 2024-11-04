#' Download Microdata
#' @description Checks the most recent available microdata uploaded to our
#'  GitHub repository.
#' @param dir The directory where the microdata will be downloaded.
#' @param overwrite Logical. If TRUE, the function will overwrite the file if it
#'  already exists. If FALSE, the function will stop and return an error if the
#'  file already exists.
#' @return A tibble with the available microdata by country and year.
#' @export
download_microdata <- function(dir = tempdir(), overwrite = TRUE) {
  # Use the commented vectors directly
  browser_download_url <- c(
    "https://github.com/pachadotdev/redatam-microdata/releases/download/2.0.2/ARGENTINA1991.rds",
    "https://github.com/pachadotdev/redatam-microdata/releases/download/2.0.2/ARGENTINA2001.rds",
    "https://github.com/pachadotdev/redatam-microdata/releases/download/2.0.2/ARGENTINA2010.rds",
    "https://github.com/pachadotdev/redatam-microdata/releases/download/2.0.2/BOLIVIA2001.rds",
    "https://github.com/pachadotdev/redatam-microdata/releases/download/2.0.2/BOLIVIA2012.rds",
    "https://github.com/pachadotdev/redatam-microdata/releases/download/2.0.2/CHILE2017.rds",
    "https://github.com/pachadotdev/redatam-microdata/releases/download/2.0.2/ECUADOR2010.rds",
    "https://github.com/pachadotdev/redatam-microdata/releases/download/2.0.2/ELSALVADOR2007.rds",
    "https://github.com/pachadotdev/redatam-microdata/releases/download/2.0.2/GUATEMALA2018.rds",
    "https://github.com/pachadotdev/redatam-microdata/releases/download/2.0.2/MEXICO2000.rds",
    "https://github.com/pachadotdev/redatam-microdata/releases/download/2.0.2/MEXICO2010.rds",
    "https://github.com/pachadotdev/redatam-microdata/releases/download/2.0.2/MYANMAR2014.rds",
    "https://github.com/pachadotdev/redatam-microdata/releases/download/2.0.2/PERU2007.rds",
    "https://github.com/pachadotdev/redatam-microdata/releases/download/2.0.2/PERU2017.rds",
    "https://github.com/pachadotdev/redatam-microdata/releases/download/2.0.2/REPUBLICADOMINICANA2002.rds"
  )

  if (interactive()) {
    message("Select the microdata to download (0 to download all, ESC to cancel):")
    selection <- utils::menu(browser_download_url)
  } else {
    message("Use R in an interactive session to select the microdata to download.")
    return(FALSE)
  }

  if (selection != 0) {
    filename <- basename(browser_download_url[selection])
    out_path <- normalizePath(file.path(dir, filename), mustWork = FALSE)

    utils::download.file(browser_download_url[selection], destfile = out_path)
    return(out_path)
  } else {
    out_paths <- c()

    for (i in seq_along(browser_download_url)) {
      filename <- basename(browser_download_url[i])
      out_path <- normalizePath(file.path(dir, filename), mustWork = FALSE)

      utils::download.file(browser_download_url[i], destfile = out_path)
      out_paths <- c(out_paths, out_path)
    }

    return(out_paths)
  }
}

# download_microdata_ <- function(dir = tempdir(), overwrite = TRUE) {
#   releases <- httr::GET(
#     "https://api.github.com/repos/pachadotdev/redatam-microdata/releases"
#   )
#   httr::stop_for_status(releases, "checking latest release")

#   releases <- httr::content(releases)

#   release_obj <- releases[1]

#   if (!length(release_obj)) {
#     stop("No available release.")
#   }

#   assets <- release_obj[[1]]$assets

#   browser_download_url <- sapply(assets, function(x) x$browser_download_url)

#   # browser_download_url <- c(
#   #   "https://github.com/pachadotdev/redatam-microdata/releases/download/2.0.2/ARGENTINA1991.rds",
#   #   "https://github.com/  pachadotdev/redatam-microdata/releases/download/2.0.2/ARGENTINA2001.rds",
#   #   "https://github.com/pachadotdev/redatam-microdata/releases/download/2.0.2/ARGENTINA2010.rds",
#   #   "https://github.com/pachadotdev/redatam-microdata/releases/download/2.0.2/BOLIVIA2001.rds",
#   #   "https://github.com/pachadotdev/redatam-microdata/releases/download/2.0.2/BOLIVIA2012.rds",
#   #   "https://github.com/pachadotdev/redatam-microdata/releases/download/2.0.2/CHILE2017.rds",
#   #   "https://github.com/pachadotdev/redatam-microdata/releases/download/2.0.2/ECUADOR2010.rds",
#   #   "https://github.com/pachadotdev/redatam-microdata/releases/download/2.0.2/ELSALVADOR2007.rds",
#   #   "https://github.com/pachadotdev/redatam-microdata/releases/download/2.0.2/GUATEMALA2018.rds",
#   #   "https://github.com/pachadotdev/redatam-microdata/releases/download/2.0.2/MEXICO2000.rds",
#   #   "https://github.com/pachadotdev/redatam-microdata/releases/download/2.0.2/MEXICO2010.rds",
#   #   "https://github.com/pachadotdev/redatam-microdata/releases/download/2.0.2/MYANMAR2014.rds",
#   #   "https://github.com/pachadotdev/redatam-microdata/releases/download/2.0.2/PERU2007.rds",
#   #   "https://github.com/pachadotdev/redatam-microdata/releases/download/2.0.2/PERU2017.rds",
#   #   "https://github.com/pachadotdev/redatam-microdata/releases/download/2.0.2/REPUBLICADOMINICANA2002.rds"
#   # )

#   url <- sapply(assets, function(x) x$url)

#   # url <- c(
#   #   "https://api.github.com/repos/pachadotdev/redatam-microdata/releases/assets/203676903",
#   #   "https://api.github.com/repos/pachadotdev/redatam-microdata/releases/assets/203775903",
#   #   "https://api.github.com/repos/pachadotdev/redatam-microdata/releases/assets/203862426",
#   #   "https://api.github.com/repos/pachadotdev/redatam-microdata/releases/assets/203862844",
#   #   "https://api.github.com/repos/pachadotdev/redatam-microdata/releases/assets/203862967",
#   #   "https://api.github.com/repos/pachadotdev/redatam-microdata/releases/assets/203863054",
#   #   "https://api.github.com/repos/pachadotdev/redatam-microdata/releases/assets/203863215",
#   #   "https://api.github.com/repos/pachadotdev/redatam-microdata/releases/assets/203863387",
#   #   "https://api.github.com/repos/pachadotdev/redatam-microdata/releases/assets/203776023",
#   #   "https://api.github.com/repos/pachadotdev/redatam-microdata/releases/assets/203863429",
#   #   "https://api.github.com/repos/pachadotdev/redatam-microdata/releases/assets/203863633",
#   #   "https://api.github.com/repos/pachadotdev/redatam-microdata/releases/assets/203776149",
#   #   "https://api.github.com/repos/pachadotdev/redatam-microdata/releases/assets/203863889",
#   #   "https://api.github.com/repos/pachadotdev/redatam-microdata/releases/assets/203776371",
#   #   "https://api.github.com/repos/pachadotdev/redatam-microdata/releases/assets/203863969"
#   # )

#   # ask the use to select a browser_download_url
#   if (interactive()) {
#     message("Select the microdata to download (0 to download all, ESC to cancel):")
#     selection <- utils::menu(browser_download_url)
#   } else {
#     message("Use R in an interactive session to select the microdata to download.")
#     return(FALSE)
#   }

#   if (selection != 0) {
#     filename <- basename(browser_download_url[selection])
#     out_path <- normalizePath(file.path(dir, filename), mustWork = FALSE)

#     response <- httr::GET(
#       url[selection],
#       httr::accept("application/octet-stream"),
#       httr::write_disk(path = out_path, overwrite = overwrite),
#       httr::progress()
#     )

#     httr::stop_for_status(response, "Downloading microdata...")

#     return(out_path)
#   } else {
#     out_paths <- c()

#     for (i in seq_along(browser_download_url)) {
#       filename <- basename(browser_download_url[i])
#       out_path <- normalizePath(file.path(dir, filename), mustWork = FALSE)

#       response <- httr::GET(
#         url[i],
#         httr::accept("application/octet-stream"),
#         httr::write_disk(path = out_path, overwrite = overwrite),
#         httr::progress()
#       )

#       httr::stop_for_status(response, "downloading microdata")

#       out_paths <- c(out_paths, out_path)
#     }

#     return(out_paths)
#   }
# }
