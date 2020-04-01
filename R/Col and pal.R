colors_cyberpunk <- c(
  'cyber1 blue' = "#08F7FE",
  'cyber2 pink' = "#E64E8D",
  'cyber3 yellow' = "#ECCE8E",
  'cyber4 orange' = "#EE9537",
  'cyber5 grey' = "#94D0FF",
  'cyber6 green' = "#05ffa1",
  'saber2 green' = "#32CD32",
  'saber5 crimson' = "#800000",
  'saber3 red' = "#B22222",
  'saber4 purple' = "#8510d8",
  'saber1 blue' = "#49f9fe"

)


get_cyberpunk_colors <- function(...){
  cols <- c(...)

  if(is.null(cols))
    return(colors_cyberpunk)

  return(colors_cyberpunk[cols])
}

palettes_cyberpunk <- list(
  'main' = get_cyberpunk_colors('cyber1 blue', 'cyber2 pink', 'cyber3 yellow','cyber4 orange'),
  'zune' = get_cyberpunk_colors('cybe1 pink', 'cyber4 orange'),
  'cotton candy'= get_cyberpunk_colors('cyber1 blue', 'cyber2 pink'),
  'laser sword' = get_cyberpunk_colors('saber1 blue', 'saber2 green', 'saber3 red','saber4 purple')
)


get_cyberpunk_palettes <- function(palette = "main", reverse = FALSE, ...) {
  pal <- palettes_cyberpunk[[palette]]

  if (reverse) pal <- rev(pal)

  colorRampPalette(pal, ...)
}

scale_color_cyberpunk <- function(palette = 'main', discrete= T, reverse = F, ...){
  pal <- get_cyberpunk_palettes(palette = palette, reverse = reverse)

  if (discrete) {
    discrete_scale("colour", paste0("cyberpunk", palette), palette = pal, ...)
  } else {
    scale_color_gradientn(colours = pal(256), ...)
  }
}


scale_fill_cyberpunk <- function(palette = 'main', discrete= T, reverse = F, ...){
  pal <- get_cyberpunk_palettes(palette = palette, reverse = reverse)

  if (discrete) {
    discrete_scale("fill", paste0("cyberpunk", palette), palette = pal, ...)
  } else {
    scale_color_gradientn(colours = pal(256), ...)
  }
}


scale_color_linesaber <- function(palette = 'laser sword', discrete= T, reverse = T, ...){
  pal <- get_cyberpunk_palettes(palette = palette, reverse = reverse)

  if (discrete) {
    discrete_scale("colour", paste0("cyberpunk", palette), palette = pal, ...)
  } else {
    scale_color_gradientn(colours = pal(256), ...)
  }
}


scale_fill_linesaber <- function(palette = 'laser sword', discrete= T, reverse = T, ...){
  pal <- get_cyberpunk_palettes(palette = palette, reverse = reverse)

  if (discrete) {
    discrete_scale("fill", paste0("cyberpunk", palette), palette = pal, ...)
  } else {
    scale_color_gradientn(colours = pal(256), ...)
  }
}
