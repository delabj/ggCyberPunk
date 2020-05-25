calc_cumulative_alpha <- function(individual_alpha) {
  1 - cumprod(1 - individual_alpha)
}

calc_individual_alpha <- function(cumulative_alpha) {
  N <- length(cumulative_alpha)
  individual_alpha    <- numeric(N)
  individual_alpha[1] <- cumulative_alpha[1]
  for (i in seq(N-1)) {
    individual_alpha[i+1] <- 1 - (1 - cumulative_alpha[i+1])/(1 - cumulative_alpha[i])
  }
  individual_alpha
}
