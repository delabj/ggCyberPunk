#' Draw glowing points with ggplot2
#'
#' @param glow_size How far should the blur extend from the edge of the drawn point.
#'        Default: 3
#' @param glow_layers Number of repetitions to create blur. A higher value for
#'        \code{blur_steps} will results in a smoother looking blur. Default: 13
#' @param mapping,data,stat,position,...,na.rm,show.legend,inherit.aes See
#' documentation for \code{ggplot2::geom_point()}
#'
#' @import ggplot2
#' @export
#'
#' @examples
#' \dontrun{
#' ggplot(mtcars) +
#' geom_point_blur(aes(mpg, wt), glow_layers = 13) +
#'   theme_cyberpunk()
#' }

geom_fireflies <- function(
  mapping = NULL,
  data = NULL,
  stat = "identity",
  position = "identity",
  ...,
  glow_size = 5,
  glow_layers = 13,
  glow_alpha = 0.03,
  na.rm = FALSE,
  show.legend = NA,
  inherit.aes = TRUE
  ){
  ggplot2::layer(
    data = data,
    mapping = mapping,
    stat = stat,
    geom = GeomGlowingPoint,
    position = position,
    show.legend = show.legend,
    inherit.aes = inherit.aes,
    params = list(
      na.rm = na.rm,
      glow_size = glow_size,
      glow_layers = glow_layers,
      glow_alpha = glow_alpha,
      ...
    )
  )
}

#' GeomPointBlur
#'
#' @rdname ggplot2-ggproto
#' @format NULL
#' @usage NULL
#'
#' @importFrom stats qnorm
#' @importFrom utils head
#' @import grid
#' @export
GeomGlowingPoint <- ggplot2::ggproto(
  "GeomGlowingPoint",
  Geom,
  required_aes = c("x", "y"),
  non_missing_aes = c("size", "shape", "colour"),
  default_aes = ggplot2::aes(
    shape      = 19,
    colour     = "black",
    size       = 1,
    fill       = NA,
    alpha      = NA,
    stroke     = 0.5,
    glow_size  = 5,
    glow_layers = 13,
    glow_alpha = .03
  ),

  draw_panel = function(
    data,
    panel_params,
    coord,
    na.rm =  FALSE
  ){
    if(is.character(data$shape)){
      data$shape <- translate_shape_string(data$shape)
    }
    coords <- coord$transform(data, panel_params)


    glow_layers <- coords$glow_layers[1]

    create_glow_grob <- function(step){
      fraction = fractions[step]
      this_alpha <- ind_alpha[step]

      grid::pointsGrob(
        coords$x,
        coords$y,
        pch = coords$shape,
        gp = grid::gpar(
          col      = alpha(coords$colour, this_alpha),
          fill     = alpha(coords$fill  , this_alpha),
          fontsize = (coords$size + coords$glow_size * fraction) * .pt +
            coords$stroke * .stroke / 2,
          lwd      = 0
        )
      )
    }

    fractions <- qnorm(seq(0.95, 0.5, length.out = glow_layers + 1))
    fractions <- fractions/max(fractions)
    fractions <- head(fractions, -1)

    fractions <- qnorm(seq(0.95, 0.5, length.out = glow_layers + 1))
    fractions <- fractions/max(fractions)
    fractions <- head(fractions, -1)

    # Sequence of individual alphas
    top_alpha <- coords$alpha[1]
    if (is.null(top_alpha) || is.na(top_alpha)) {
      top_alpha <- 1
    }
    cumulative_alpha <- seq(0.1, top_alpha, length.out = glow_layers + 1)
    cumulative_alpha <- head(cumulative_alpha, -1)
    ind_alpha  <- calc_individual_alpha(cumulative_alpha)

    # Create a sequence of blur steps as grobs and package as a grobTree
    glow_grobs <- lapply(seq_along(fractions), create_glow_grob)
    glow_grobs <- do.call(grid::grobTree, glow_grobs)
    # the returned grob is now a grob tree with the blur steps behind the
    # final drawn points.
    ggname(
      "geom_point",
      grid::grobTree(
        glow_grobs,
        grid::pointsGrob(
          coords$x,
          coords$y,
          pch = coords$shape,
          gp = grid::gpar(
            col      = alpha(coords$colour, coords$alpha),
            fill     = alpha(coords$fill, coords$alpha),
            fontsize = coords$size * .pt + coords$stroke * .stroke / 2,
            lwd      = coords$stroke * .stroke / 2
          )
        )
      )
    )
  },

  draw_key = draw_key_point
)


