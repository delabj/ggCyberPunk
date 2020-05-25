#' Draw Glowing Point Legend
draw_key_glowing_point <- function(
  data,
  params,
  size=1
  ) {
  if (is.null(data$shape)) {
    data$shape <- 19
  }
  else if (is.character(data$shape)) {
    data$shape <- translate_shape_string(data$shape)
  }

  coords <- data

  # What should be the alpha of an individual step?
  glow_layers <- coords$glow_layers[1]


  # Ensure lwd = 0 so that no outer stroke is included.
  create_glow_grob <- function(step) {

    fraction   <- fractions[step]
    this_alpha <- ind_alpha[step]


    print(coords$size)
    grid::pointsGrob(
      x = 0.5,
      y = 0.5,
      pch = coords$shape,
      gp = grid::gpar(
        col = alpha(coords$colour, this_alpha),
        fill = alpha(coords$fill  , this_alpha),
        fontsize = (coords$size + coords$blur_size * fraction) * .pt +
          coords$stroke * .stroke / 2+1,
        lwd = 0
      )
    )
  }

  # Gaussian-ish sequence of blurring steps
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


  # Create a sequence of glow steps as grobs and package as a grobTree
  glow_grobs <- lapply(seq_along(fractions), create_glow_grob)
  glow_grobs <- do.call(grid::grobTree, glow_grobs)

  print(size)


  grid::grobTree(
    glow_grobs,
    grid::pointsGrob(
      x = 0.5, y = 0.5,
      pch = data$shape,
      gp = grid::gpar(
        col      = alpha(data$colour %||% "black", data$alpha),
        fill     = alpha(data$fill   %||% "black", data$alpha),
        fontsize = (data$size %||% 1.5) * .pt + (data$stroke %||% 0.5) * .stroke / 2+1,
        lwd      = (data$stroke %||% 0.5) * .stroke / 2
      )
    )
  )
}
