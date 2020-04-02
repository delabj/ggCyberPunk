#' Import Fonts for Use in Plots and Charts
#'
#' @description
#'
#' A function to load the Poppins font for ease of use.
#'
#'
#' @usage
#' import_aldrich()
#'
#'
#'

import_aldrich <- function() {

  rc_font_dir <- system.file("fonts", "Aldrich", package="ggCyberPunk")

  suppressWarnings(suppressMessages(extrafont::font_import(rc_font_dir, prompt=FALSE)))

  message(
    sprintf(
      "You will likely need to install these fonts on your system as well.\n\nYou can find them in [%s]",
      rc_font_dir)
  )

}
