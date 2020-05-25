
# For compatibility with ggplot2 - and avoiding dplyr/magrittr import

'%||%' <- function(x, y) {
  if (is.null(x)) {
    y
  } else {
    x
  }
}


# For compatibility with ggplot2
new_data_frame <- function(x) {data.frame(x, stringsAsFactors = FALSE)}


# For compatibility with ggplot2
ggname <- function(prefix, grob) {
  grob$name <- grid::grobName(grob, prefix)
  grob
}



# For compatibility with ggplot2
manual_scale <- function(aesthetic, values = NULL, breaks = waiver(), ...) {
  # check for missing `values` parameter, in lieu of providing
  # a default to all the different scale_*_manual() functions
  force(values)

  # order values according to breaks
  if (is.vector(values) && is.null(names(values)) && !inherits(breaks, "waiver") &&
      !is.null(breaks)) {
    if (length(breaks) != length(values)) {
      stop(paste("
        Differing number of values and breaks in manual scale.",
                 length(values), "values provided compared to",
                 length(breaks), "breaks.
      "))
    }
    names(values) <- breaks
  }

  pal <- function(n) {
    if (n > length(values)) {
      stop(paste("Insufficient values in manual scale.", n,
                 "needed but only",
                 length(values),
                 "provided."))
    }
    values
  }
  ggplot2::discrete_scale(aesthetic, "manual", pal, breaks = breaks, ...)
}
