#' Named colors for ggCyberPunk
#'
#' @description A set of named colors for use in this package's palettes.
#' @param name name of the color used
#' @usage colors_cyberpunk[name]
#'
#' @return A named character containing a hex color code.
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

#' Extract a list of color codes
#'
#' @description Mostly an internal function, it serves to extract colors from \link[ggCyberPunk]{colors_cyberpunk}
#' @usage get_cyberpunk_colors(c(color1, color2))
#'
#' @return A list of color codes
get_cyberpunk_colors <- function(...){
  cols <- c(...)

  if(is.null(cols))
    return(colors_cyberpunk)

  return(colors_cyberpunk[cols])
}


#' List of Palettes in ggCyberPunk
#'
#' @description A collection of palettes used in ggCyberPunk.
#' @param pal_name name of the palette to use
#' @usage palettes_cyberpunk[pal_name]
#'
#' @return a list of names
#' @details 'main' is the default palette used. It has the neon blue, pink, yellow, and orange
#' 'zune' is a two color palette using the old zune orange and pink
#' 'cotton candy' is a blue and pink two color palette
#' 'laser sword' contains colors best suited for \link[ggCyberPunk]{geom_linesaber} and is based off light saber colors.
palettes_cyberpunk <- list(
  'main' = get_cyberpunk_colors('cyber1 blue', 'cyber2 pink', 'cyber3 yellow','cyber4 orange'),
  'zune' = get_cyberpunk_colors('cyber2 pink', 'cyber4 orange'),
  'cotton candy'= get_cyberpunk_colors('cyber1 blue', 'cyber2 pink'),
  'laser sword' = get_cyberpunk_colors('saber1 blue', 'saber2 green', 'saber3 red','saber4 purple')
)

#' get cyberpunk palletes from list.
get_cyberpunk_palettes <- function(palette = "main", reverse = FALSE, ...) {
  pal <- palettes_cyberpunk[[palette]]

  if (reverse) pal <- rev(pal)

  grDevices::colorRampPalette(pal, ...)
}


#' Color with CyberPunk palettes!
#' @aliases scale_color_linesaber, scale_fill_linesaber, scale_fill_cyberpunk
#' @description use the built in palettes in a ggplot chain.
#' @useage scale_color_cyberpunk(palette = 'main', discrete= T, reverse = F, ...)
#' scale_color_linesaber(palette = 'main', discrete= T, reverse = F, ...)
#' scale_fill_cyberpunk(palette = 'main', discrete= T, reverse = F, ...)
#' scale_fill_linesaber9palette = 'main', discrete= T, reverse = F, ...)
#' @param palette the name of the palette ('main', 'zune', 'cotton candy', 'laser sword')
#' @param discrete Boolean: is the scale discrete or not
#' @param reverse Boolean: should the scale be reversed
#' @rdname scale_color_cyberpunk
#' @export

scale_color_cyberpunk <- function(palette = 'main', discrete= T, reverse = F, ...){
  pal <- get_cyberpunk_palettes(palette = palette, reverse = reverse)

  if (discrete) {
    ggplot2::discrete_scale("colour", paste0("cyberpunk", palette), palette = pal, ...)
  } else {
    scale_color_gradientn(colours = pal(256), ...)
  }
}

#' Scale_fill_cyberpunk
#' @rdname scale_color_cyberpunk
#' @export

scale_fill_cyberpunk <- function(palette = 'main', discrete= T, reverse = F, ...){
  pal <- get_cyberpunk_palettes(palette = palette, reverse = reverse)

  if (discrete) {
    ggplot2::discrete_scale("fill", paste0("cyberpunk", palette), palette = pal, ...)
  } else {
    scale_fill_gradientn(colours = pal(256), ...)
  }
}


scale_color_linesaber <- function(palette = 'laser sword', discrete= T, reverse = T, ...){
  pal <- get_cyberpunk_palettes(palette = palette, reverse = reverse)

  if (discrete) {
    ggplot2::discrete_scale("colour", paste0("cyberpunk", palette), palette = pal, ...)
  } else {
    scale_color_gradientn(colours = pal(256), ...)
  }
}


scale_fill_linesaber <- function(palette = 'laser sword', discrete= T, reverse = T, ...){
  pal <- get_cyberpunk_palettes(palette = palette, reverse = reverse)

  if (discrete) {
    ggplot2::discrete_scale("fill", paste0("cyberpunk", palette), palette = pal, ...)
  } else {
    scale_fill_gradientn(colours = pal(256), ...)
  }
}
