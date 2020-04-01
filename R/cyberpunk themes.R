#' Cyberpunk Themes for Sci-Fi Obsessed Teans
#' @description
#' A theme to make beautiful cyer punk themed plots. Based of the theme newRetro in the vapoRwave package
#' @usage theme_cyberpunk( font = "Source Code Pro", main.text.color = "#EE9537",
#' sub.text.color = "#EE9537", base.size = 15, plot.background.color = "#212946",
#' legend.position = "right", panel.border.color = "#494F67", panel.background = "#212946",
#' panel.grid.color = "#EE9537", axis.text.color = "#EE9537", axis.text.size = base.size * 0.6666667,
#' subtitle.size = base.size * 0.8, legend.text = base.size * 0.8, legend.title = base.size * 0.85,
#' axis.title.size = base.size * 0.8, title.size = 15)
#' @param font sets the default font
#' @param main.text.color sets the main text color
#' @param sub.text.color sets the subtext color
#' @param base.size sets the base font size
#' @param plot.background.color sets the background color
#' @param legend.position sets the default legend position
#' @param panel.border.color sets the panel border color
#' @param panel.background sets the background color for the plot
#' @param panel.grid.color sets the grid color for the plot
#' @param axis.text.color sets the axis text color
#' @param axis.text.size sets the axis text size
#' @param subtitle.size sets the  subtitle size
#' @param legend.text sets the title text size
#' @param legend.title sets the legend title size
#' @param axis.title.size sets the axis title size,
#' @param title.size sets the title size
#'
#' @details A theme designed to work with the glowing lines plots to provide a cyber punk feel.
#'
#' @example
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
theme_cyberpunk <- function (
  font = "Source Code Pro",
main.text.color = "#EE9537",
sub.text.color = "#EE9537",
base.size = 15,
plot.background.color = "#212946",
legend.position = "bottom",
panel.border.color = "#494F67",
panel.background = "#212946",
panel.grid.color = "#EE9537",
axis.text.color = "#EE9537",
axis.text.size = base.size * 0.6666667,
subtitle.size = base.size * 0.8,
legend.text = base.size * 0.8,
legend.title = base.size * 0.85,
axis.title.size = base.size * 0.8,
title.size = 15
) {

  th <- ggplot2::theme_minimal ()

  #Text format:
  th$plot.title=ggplot2::element_text(family=font,
                                      size=title.size,
                                      face="bold",
                                      color=main.text.color,
                                      hjust = 0,
                                      margin = ggplot2::margin(9,0,9,0))
  th$plot.title.position = "plot"
  th$plot.subtitle=ggplot2::element_text(family=font,
                                         size=subtitle.size,
                                         face="bold",
                                         color=main.text.color,
                                         hjust = 0,
                                         margin=ggplot2::margin(9,0,9,0))
  #Legend format
  th$legend.position = legend.position
  th$legend.text.align=0
  th$legend.background=ggplot2::element_blank()
  th$legend.key=ggplot2::element_blank()
  th$legend.text=ggplot2::element_text(family=font,
                                       size=legend.text,
                                       color=main.text.color)
  th$legend.title=ggplot2::element_text(family=font,
                                        size=legend.title,
                                        color=main.text.color)

  #Axis format
  th$axis.title.x=ggplot2::element_text(family=font,
                                        size=axis.title.size,
                                        color=main.text.color)
  th$axis.title.y=th$axis.title.x

  th$axis.text=ggplot2::element_text(family=font,
                                     size=axis.text.size,
                                     color=main.text.color)

  th$axis.text.x=ggplot2::element_text(margin=ggplot2::margin(5, b=10))
  th$axis.text.y = ggplot2::element_text(margin=ggplot2::margin(l = 10))
  th$axis.ticks=ggplot2::element_blank()
  th$axis.line=ggplot2::element_blank()

  #Grid lines
  th$panel.grid.minor=ggplot2::element_blank()
  th$panel.grid=ggplot2::element_line(linetype=3, color=panel.grid.color, size=0.2)

  #Blank background
  th$panel.background = ggplot2::element_rect(
    fill=panel.background,
    colour = NA
  )
  th$plot.background = ggplot2::element_rect(
    fill = plot.background.color,
    colour = NA
  )
  th$panel.border = ggplot2::element_rect(
    color = panel.border.color,
    fill = NA,
    linetype = "solid",
    size = 0.75
  )
  th$plot.caption = ggplot2::element_text(color=main.text.color)

  #Strip background (#This sets the panel background for facet-wrapped plots to white, removing the standard grey ggplot background colour and sets the title size of the facet-wrap title to font size 22)
  th$strip.background = ggplot2::element_blank()
  th$strip.text= ggplot2::element_text(colour = main.text.color,
                                       size  = 12,
                                       hjust = 0.5)

  return (th)
}
