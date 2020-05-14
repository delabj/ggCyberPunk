# # library(ggplot2)
# # library(tidyverse)
# #
# df = data.frame(A=c(1,4,4,6,7,5,1),
#                 B=c(4,3,5,7,5,6,7),
#                # C=c(7,5,7,4,3,2,3),
#                # D=c(0,2,6,2,1,4,5),
#                 I=c(1,2,3,4,5,6,7)) %>%
#   pivot_longer(cols = c(A,B),names_to = "group", values_to = "count")
#
# # df %>%
# #   ggplot(aes(x=I, y = count, color = group, fill= group))+
# #   geom_area(alpha = .1, position = "identity")+
# #   geom_line(size = 5.0, alpha = .03)+
# #   geom_line(size = 4.9, alpha = .03)+
# #   geom_line(size = 4.8, alpha = .03)+
# #   geom_line(size = 4.7, alpha = .03)+
# #   geom_line(size = 4.6, alpha = .03)+
# #   geom_line(size = 4.5, alpha = .03)+
# #   geom_line(size = 4.4, alpha = .03)+
# #   geom_line(size = 4.3, alpha = .03)+
# #   geom_line(size = 4.2, alpha = .03)+
# #   geom_line(size = 4.1, alpha = .03)+
# #   geom_point(size = 4)+
# #   geom_line(size = 1.5)+
# #   scale_fill_manual(values = c("#08F7FE", "#FE53BB"))+
# #   scale_color_manual(values = c("#08F7FE", "#FE53BB"))+
# #   delabj::theme_delabj_dark()
# #
# #
# #
# # geom_area_cyberpunk <- function(alpha =  1, size = 1){
# #   geoms <- list(geom_area(alpha = .1, position = "identity"),
# #                     geom_line(size = size * 5.0,  alpha = alpha * .03),
# #                     geom_line(size = size * 4.9,  alpha = alpha * .03),
# #                     geom_line(size = size * 4.8,  alpha = alpha * .03),
# #                     geom_line(size = size * 4.7,  alpha = alpha * .03),
# #                     geom_line(size = size * 4.6,  alpha = alpha * .03),
# #                     geom_line(size = size * 4.5,  alpha = alpha * .03),
# #                     geom_line(size = size * 4.4,  alpha = alpha * .03),
# #                     geom_line(size = size * 4.3,  alpha = alpha * .03),
# #                     geom_line(size = size * 4.2,  alpha = alpha * .03),
# #                     geom_line(size = size * 4.1,  alpha = alpha * .03),
# #                     geom_point(size = size * 4, alpha = alpha),
# #                     geom_line(size = size * 1.5, alpha = alpha))
# # }
# #
# #
# # GeomCyberPunkArea  <- ggproto("GeomArea", GeomRibbon,
# #                               default_aes = aes(colour = NA, fill = "#08F7FE", size = 0.5, linetype = 1,
# #                                                 alpha = .1),
# #                                           required_aes = c("x", "y"),
# #
# #                                           setup_params = function(data, params) {
# #                                             params$flipped_aes <- has_flipped_aes(data, params, ambiguous = TRUE)
# #                                             params
# #                                           },
# #
# #                                           setup_data = function(data, params) {
# #                                             data$flipped_aes <- params$flipped_aes
# #                                             data <- flip_data(data, params$flipped_aes)
# #                                             data <- transform(data[order(data$PANEL, data$group, data$x), ], ymin = 0, ymax = y)
# #                                             flip_data(data, params$flipped_aes)
# #                                           }
# # )
# #
# # geom_cyberpunk_area <- function (mapping = NULL, data = NULL, stat = "identity",
# #                                  position = "stack", na.rm = FALSE, orientation = NA,
# #                                  show.legend = NA, inherit.aes = TRUE, ..., outline.type = "upper")
# # {
# #   outline.type <- match.arg(outline.type, c("both", "upper",
# #                                             "lower", "full"))
# #   layer(data = data, mapping = mapping, stat = stat, geom = GeomCyberPunkArea,
# #         position = position, show.legend = show.legend, inherit.aes = inherit.aes,
# #         params = list(na.rm = na.rm, orientation = orientation,
# #                       outline.type = outline.type, ...))
# # }
# #
# #
# #
# #
# #
# library(tidyverse)
# library(delabj)
# df %>%
#   ggplot(aes(x=I, y = count, color = group, fill= group))+
#   geom_glowing_point()+
#   ggCyberPunk::theme_cyberpunk()+
#   scale_fill_manual(values = c("#08F7FE", "#FE53BB"))+
#   scale_color_manual(values = c("#08F7FE", "#FE53BB"))
#
#
# df <- data.frame(x = factor(rep(letters[1:5], each = 10)), y = rnorm(50), color=(rep(c("A", "B", "C", "B", "A"), each=10)))
# ggplot(df, aes(x = x, y = y, fill=color))+
#   geom_glowing_boxplot()+
#   ggCyberPunk::theme_cyberpunk()+
#   ggCyberPunk::scale_fill_cyberpunk()
#
