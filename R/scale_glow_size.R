#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
#' Scale glow size
#'
#' @param guide default: 'legend'.
#' @param name,breaks,labels,limits,range,trans,values,... see \code{?ggplot2::scale_size()}
#'
#' @rdname scale_glow_size
#'
#' @import ggplot2
#' @import scales
#' @export
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
scale_glow_size_continuous <- function(name = waiver(), breaks = waiver(), labels = waiver(),
                                       limits = NULL, range = c(3, 9),
                                       trans = "identity", guide = 'legend') {
  ggplot2::continuous_scale(
    aesthetics = "glow_size",
    scale_name = "glow_size",
    palette    = scales::rescale_pal(range), name = name,
    breaks = breaks, labels = labels, limits = limits, trans = trans,
    guide = guide)
}


#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
#' @rdname scale_glow_size
#' @export
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
scale_glow_size <- scale_glow_size_continuous


#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
#' @rdname scale_glow_size
#' @export
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
scale_glow_size_discrete <- function(..., range = c(4, 9), guide='legend') {
  force(range)

  ggplot2::discrete_scale(
    aesthetics = "glow_size",
    scale_name = "glow_size_d",
    palette    = function(n) {
      seq(range[1], range[2], length.out = n)
    },
    guide = guide,
    ...
  )
}



#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
#' @rdname scale_glow_size
#'
#' @export
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
scale_glow_size_manual <- function(..., values) {
  manual_scale('glow_size', values, ...)
}
