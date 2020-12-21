#' A Cyberpunk styled area chart
#'
#' @description Glowing Lines, lightly colored area plots for a cyberpunk area plot.
#'
#' @usage geom_glowing_area(alpha =  1, size = 1, glow_alpha = 0.03, layers = 10, glow_size = .65)
#' @param alpha set the alpha level for the base line.
#' @param size set the base line size.
#' @param glow_alpha alpha level for the glow effect
#' @param layers number of glowing layers to draw,
#' @param glow_size size of the glow
#'
#' @details Create a cyberpunk themed chart using ggplot. This plot is a fancy area plot, that uses a glow effect around the upper line.
#' @return A list of ggplot geoms containin geom_area, geom_lines, and geom_point.
#'
#' @examples
#' \dontrun{
#' library(ggplot2)
#' library(tidyverse)
#'
#' df = data.frame(A=c(1,4,4,6,7,5,1),
#'                B=c(4,3,5,7,5,6,7),
#'                I=c(1,2,3,4,5,6,7)) %>%
#' pivot_longer(cols = c(A,B),names_to = "group", values_to = "count")
#'
#'
#' df %>%
#'    ggplot(aes(x=I, y = count, color = group, fill= group))+
#'      geom_glowing_area()+
#'      theme_cyberpunk()+
#'      scale_fill_manual(values = c("#08F7FE", "#FE53BB"))+
#'      scale_color_manual(values = c("#08F7FE", "#FE53BB"))
#'}
#' @export

geom_glowing_area <- function(
  alpha =  1,
  size = 1.5,
  glow_alpha = 0.05,
  layers = 10,
  glow_size = .65){
  geoms <- list(ggplot2::geom_area(alpha = .1, position = "identity"))


  for(i in (layers+1):1){
    geoms <- c(
      geoms ,
      ggplot2::geom_line(size = size + (glow_size*i), alpha = alpha*glow_alpha)
    )

  }

  geoms <- c(geoms,
             ggplot2::geom_line(size = size * 1, alpha = alpha),
             ggplot2::geom_point(size = size * 2, alpha = alpha)
             )


}




#' Sci-Fi themed line plots
#'
#' @description Glowing Lines, lightly colored area plots for a cyberpunk/Laser sword themed line plot
#'
#' @usage geom_glowing_line <- function(alpha =  1, size = 1,layers = 10, glow_size = .65)
#' @param alpha set the alpha level for the base line.
#' @param size set the base line size.
#' @param glow_alpha alpha level for the glow effect
#' @param layers number of glowing layers to draw,
#' @param glow_size size of the glow
#'
#' @details Create a cyberpunk themed chart using ggplot. This plot is a fancy line plot, that uses a glow effect around the line.
#' @return A list of ggplot geoms containing, geom_lines, and geom_point.
#' geom_linesaber does not return a geom_point
#'
#' @examples
#' \dontrun{
#' library(ggplot2)
#' library(tidyverse)
#'
#' df = data.frame(A=c(1,4,4,6,7,5,1),
#'                B=c(4,3,5,7,5,6,7),
#'                I=c(1,2,3,4,5,6,7)) %>%
#' pivot_longer(cols = c(A,B),names_to = "group", values_to = "count")
#'
#'
#' df %>%
#'    ggplot(aes(x=I, y = count, color = group, fill= group))+
#'      geom_glowing_area()+
#'      theme_dark()+
#'      scale_fill_manual(values = c("#08F7FE", "#FE53BB"))+
#'      scale_color_manual(values = c("#08F7FE", "#FE53BB"))
#'}
#'
#' @rdname geom_glowing_line
#' @export
geom_glowing_line <- function(alpha =  1, size = 1.5, glow_alpha = 0.05, layers = 10, glow_size = 0.65){

  geoms <- list()


  for(i in (layers+1):1){
    geoms <- c(
      geoms ,
      ggplot2::geom_line(size = size + (glow_size*i), alpha = alpha*glow_alpha)
    )

  }

  geoms <- c(geoms,
             ggplot2::geom_line(size = size * 1, alpha = alpha),
             ggplot2::geom_point(size = size * 2, alpha = alpha)
  )

}


#' Lightsaber themed line plots
#'
#' @description Glowing Lines, lightly colored area plots for a cyberpunk/Laser sword themed line plot
#'
#' @usage geom_glowing_line <- function(alpha =  1, size = 1,layers = 10, glow_size = .65)
#' @param alpha set the alpha level for the base line.
#' @param size set the base line size.
#' @param glow_alpha alpha level for the glow effect
#' @param layers number of glowing layers to draw,
#' @param glow_size size of the glow
#'
#' @details Create a cyberpunk themed chart using ggplot. This plot is a fancy line plot, that uses a glow effect around the line.
#' @return A list of ggplot geoms containing, geom_lines, and geom_point.
#' geom_linesaber does not return a geom_point
#'
#' @examples
#' \dontrun{
#' library(ggplot2)
#' library(tidyverse)
#'
#' df = data.frame(A=c(1,4,4,6,7,5,1),
#'                B=c(4,3,5,7,5,6,7),
#'                I=c(1,2,3,4,5,6,7)) %>%
#' pivot_longer(cols = c(A,B),names_to = "group", values_to = "count")
#'
#'
#' df %>%
#'    ggplot(aes(x=I, y = count, color = group, fill= group))+
#'      geom_glowing_area()+
#'      theme_dark()+
#'      scale_fill_manual(values = c("#08F7FE", "#FE53BB"))+
#'      scale_color_manual(values = c("#08F7FE", "#FE53BB"))
#'}
#'
#' @rdname geom_line_saber
#' @export
geom_linesaber <- function(alpha =  1, size = 1.25, glow_alpha = 0.05, layers = 10, glow_size = .65, inner_color = "white"){

  geoms <- list(ggplot2::geom_line(size = size * 5.0,  alpha = alpha * glow_alpha, color = inner_color))


  for(i in (layers+1):1){
    geoms <- c(
      geoms ,
      ggplot2::geom_line(size = size + (glow_size*i), alpha = alpha*glow_alpha)
    )

  }

  geoms <- c(geoms,
             ggplot2::geom_line(size = size * 1, alpha = alpha, color = inner_color)
  )


}
