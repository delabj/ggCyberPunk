% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/cyberpunk_geoms.R
\name{geom_linesaber}
\alias{geom_linesaber}
\title{Lightsaber themed line plots}
\usage{
geom_linesaber(
  alpha = 1,
  size = 1.25,
  glow_alpha = 0.05,
  layers = 10,
  glow_size = 0.65,
  inner_color = "white"
)
}
\arguments{
\item{alpha}{set the alpha level for the base line.}

\item{size}{set the base line size.}

\item{glow_alpha}{alpha level for the glow effect}

\item{layers}{number of glowing layers to draw,}

\item{glow_size}{size of the glow}

\item{inner_color}{color of the inner line}
}
\value{
A list of ggplot geoms containing, geom_lines, and geom_point.
geom_linesaber does not return a geom_point
}
\description{
Glowing Lines, lightly colored area plots for a cyberpunk/Laser sword themed line plot
}
\details{
Create a cyberpunk themed chart using ggplot. This plot is a fancy line plot, that uses a glow effect around the line.
}
\examples{
\dontrun{
library(ggplot2)
library(tidyverse)

df = data.frame(A=c(1,4,4,6,7,5,1),
               B=c(4,3,5,7,5,6,7),
               I=c(1,2,3,4,5,6,7)) \%>\%
pivot_longer(cols = c(A,B),names_to = "group", values_to = "count")


df \%>\%
   ggplot(aes(x=I, y = count, color = group, fill= group))+
     geom_linesaber()+
     theme_cyberpunk()+
     scale_fill_manual(values = c("#08F7FE", "#FE53BB"))+
     scale_color_manual(values = c("#08F7FE", "#FE53BB"))
}

}
