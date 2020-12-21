#### shamelessly ripped from hrbrthemes

.onAttach <- function(libname, pkgname) {
  pdfFonts <- grDevices::pdfFonts

  windowsFonts <- grDevices::windowsFonts

  if (.Platform$OS.type == "windows")  {
    if (interactive()) packageStartupMessage("Registering Windows fonts with R")
    windowsFonts <- grDevices::windowsFonts

    extrafont::loadfonts("win", quiet = TRUE)
  }

  if (getOption("hrbrthemes.loadfonts", default = FALSE)) {
    if (interactive()) packageStartupMessage("Registering PDF & PostScript fonts with R")
    extrafont::loadfonts("pdf", quiet = TRUE)
    extrafont::loadfonts("postscript", quiet = TRUE)
  }

  fnt <- extrafont::fonttable()
  if (!any(grepl("Aldrich", fnt$FamilyName))) {
    packageStartupMessage("NOTE: Poppins is a required font for this theme to work by default")
    packageStartupMessage("      Please use delabj::import_poppins() to install Poppins.")
  }

}

