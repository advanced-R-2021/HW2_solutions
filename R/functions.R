
simu_cum_incidence <- function(ntot, n_days,
                               n0, n_days_inf, prob_infect) {
  n_suscept <- rep(ntot, n_days)
  n_infectious <- rep(0, n_days)
  n_new <- rep(0, n_days)
  names(n_suscept) <-
    names(n_infectious) <- names(n_new) <- seq(1, n_days)
  n_new[1] <- n0
  n_infectious[1:n_days_inf] <- n_infectious[1:n_days_inf] + n_new[1]
  for (t in 2:n_days) {
    n_new[t] <- rbinom(n = 1,
                       size = n_suscept[t],
                       prob = n_infectious[t] / ntot * prob_infect)
    n_infectious[t:(t + n_days_inf - 1)] <-
      n_infectious[t:(t + n_days_inf - 1)] + n_new[t]
    n_suscept[t:n_days] <-  n_suscept[t:n_days] - n_new[t]
  }
  cumsum(n_new)
}

#' Simulate infectious disease trajectories
#'
#' @param n_simu integer, number of simulated trajectories
#' @param ntot integer,  total number of individuals
#' @param n_days integer, number of days in trajectory
#' @param n0 integer,  number infected on day 1
#' @param n_days_inf integer, for someone infected on day t,
#' we assume that they are infectious on day (t, t+n_days_inf)
#' @param prob_infect numeric in (0,1), probability that a susceptible individual
#' gets infected is n_infectious/ntot*prob_infect
#'
#' @return list of simulated trajectories
#' @export
simulate_trajs <- function(n_simu,
                           ntot,
                           n_days,
                           n0,
                           n_days_inf,
                           prob_infect) {
  cum_inc <- vector("list", n_simu)
  names(cum_inc) <- paste0("simu_", seq(1, n_simu))
  for (i in 1:n_simu) {
    cum_inc[[i]] <- simu_cum_incidence(
      ntot = ntot,
      n_days = n_days,
      n0 = n0,
      n_days_inf = n_days_inf,
      prob_infect = prob_infect
    )
  }
  cum_inc
}
