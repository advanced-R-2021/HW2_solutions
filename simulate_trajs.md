# `simulate_trajs`

Simulate infectious disease trajectories


## Description

Simulate infectious disease trajectories


## Usage

```r
simulate_trajs(n_simu, ntot, n_days, n0, n_days_inf, prob_infect)
```


## Arguments

Argument      |Description
------------- |----------------
`n_simu`     |     integer, number of simulated trajectories
`ntot`     |     integer,  total number of individuals
`n_days`     |     integer, number of days in trajectory
`n0`     |     integer,  number infected on day 1
`n_days_inf`     |     integer, for someone infected on day t, we assume that they are infectious on day (t, t+n_days_inf)
`prob_infect`     |     numeric in (0,1), probability that a susceptible individual gets infected is n_infectious/ntot*prob_infect


## Value

list of simulated trajectories


