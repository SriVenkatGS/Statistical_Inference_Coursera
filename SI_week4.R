library(ggplot2)
set.seed(12) ## to make this reproducable
count <- 40
lambda <- 0.2
simulation_of_the_mean <- replicate(1000, rexp(n, .2))
mean_of_the_simulation <- apply(simulation_of_the_mean, 2, mean)
qplot(mean_of_the_simulation, geom = "histogram", 
      main = "Mean Simulation", 
      xlab = "Mean observations")