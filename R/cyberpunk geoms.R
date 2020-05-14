#' A Cyberpunk styled area chart
#'
#' @description Glowing Lines, lightly colored area plots for a cyberpunk area plot.
#'
#' @usage geom_glowing_area(alpha =  1, size = 1, glow_alpha = 0.03)
#' @param alpha set the alpha level for the base line.
#' @param size set the base line size.
#' @param glow_alpha set the alpha for the glow
#'
#' @details Create a cyberpunk themed chart using ggplot. This plot is a fancy area plot, that uses a glow effect around the upper line.
#' @return A list of ggplot geoms containin geom_area, geom_lines, and geom_point.
#'
#' @examples
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
geom_glowing_area <- function(alpha =  1, size = 1.5, glow_alpha = 0.03, layers = 10){
  geoms <- list(geom_area(alpha = .1, position = "identity"))

  for(i in 1:layers){
    geoms <- c(geoms, geom_line( size = size * (3.33)-(1-(i-1)/layers),  alpha = alpha * glow_alpha ))
  }

  geoms <- c(geoms,
             geom_line(size = size * 1, alpha = alpha),
             geom_point(size = size * 2, alpha = alpha)
             )


}


# Old Version
# geom_glowing_area <- function(alpha =  1, size = 1.5, glow_alpha = 0.03){
#   geoms <- list(geom_area(alpha = .1, position = "identity"),
#                 geom_line(size = size * 3.33,  alpha = alpha * glow_alpha),
#                 geom_line(size = size * 3.27,  alpha = alpha * glow_alpha),
#                 geom_line(size = size * 3.20,  alpha = alpha * glow_alpha),
#                 geom_line(size = size * 3.13,  alpha = alpha * glow_alpha),
#                 geom_line(size = size * 3.07,  alpha = alpha * glow_alpha),
#                 geom_line(size = size * 3.00,  alpha = alpha * glow_alpha),
#                 geom_line(size = size * 2.93,  alpha = alpha * glow_alpha),
#                 geom_line(size = size * 2.87,  alpha = alpha * glow_alpha),
#                 geom_line(size = size * 2.80,  alpha = alpha * glow_alpha),
#                 geom_line(size = size * 2.73,  alpha = alpha * glow_alpha),
#                 geom_point(size = size * 2, alpha = alpha),
#                 geom_line(size = size * 1, alpha = alpha))
# }




#' Sci-Fi themed line plots
#'
#' @description Glowing Lines, lightly colored area plots for a cyberpunk/Laser sword themed line plot
#'
#' @usage geom_glowing_line <- function(alpha =  1, size = 1)
#' @param alpha set the alpha level for the base line.
#' @param size set the base line size.
#' @param glow_alpha set the alpha for the glow
#'
#' @details Create a cyberpunk themed chart using ggplot. This plot is a fancy line plot, that uses a glow effect around the line.
#' @return A list of ggplot geoms containing, geom_lines, and geom_point. geom_linesaber does not return a geom_point
#'
#' @examples
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
geom_glowing_line <- function(alpha =  1, size = 1.5, glow_alpha = 0.03, layers = 10){

  geoms <- list()

  for(i in 1:layers){
    geoms <- c(geoms, geom_line( size = size * (3.33)-(1-(i-1)/layers),  alpha = alpha * glow_alpha ))
  }

  geoms <- c(geoms,
             geom_line(size = size * 1, alpha = alpha),
             geom_point(size = size * 2, alpha = alpha)
  )

}

geom_linesaber <- function(alpha =  1, size = 1.25, glow_alpha = 0.03, layers = 10){

  geoms <- list(geom_line(size = size * 5.0,  alpha = alpha * glow_alpha, color = "White"))

  for(i in 1:layers){
    geoms <- c(geoms, geom_line( size = size * (5)-(1-(i-1)/layers),  alpha = alpha * glow_alpha ))
  }

  geoms <- c(geoms,
             geom_line(size = size * 1, alpha = alpha, color = "white")
  )


}



geom_glowing_point <- function(alpha =  1, size = 1, glow_alpha = 0.03, layers = 13){
  geoms <- list()

  for(i in 1:layers){
    geoms <- c(geoms, geom_point( size = size + (5)*(1-(i-1)/layers),  alpha = alpha * glow_alpha ))
  }

  geoms <- c(geoms,
             geom_point(size = size, alpha = alpha*glow_alpha*10)
  )

  return(geoms)

}


geom_glowing_boxplot <- function(alpha =  1, size = 1.5, glow_alpha = 0.003, layers = 10){

  geoms <- list()

  for(i in 1:layers){
    geoms <- c(geoms, geom_boxplot( size = size * (3.33)-(1-(i-1)/layers),  alpha = alpha * glow_alpha ))
  }

  geoms <- c(geoms,
             geom_boxplot(size = size * 1, alpha = alpha)
             )
}
