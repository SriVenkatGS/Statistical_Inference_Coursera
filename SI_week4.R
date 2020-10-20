library(ggplot2)
set.seed(12) ## to make this reproducable
count <- 40
lambda <- 0.2
simulation_of_the_mean <- replicate(1000, rexp(count, .2))
mean_of_the_simulation <- apply(simulation_of_the_mean, 2, mean)
qplot(mean_of_the_simulation, geom = "histogram", 
      main = "Mean Simulation", 
      xlab = "Mean observations")
mean2 <- mean(mean_of_the_simulation)
print(mean2)
mean_Theoretical <- 1/0.2
print(mean_Theoretical)
stdDeviation_estimated <- (1/.2)/sqrt(count)
variance_estimated<- stdDeviation_estimated^2
stdDeviation_ofSample <- sd(mean_of_the_simulation)
variance_ofSample <- var(mean_of_the_simulation)

fitting <- seq(min(mean_of_the_simulation), max(mean_of_the_simulation), length=100)
standard_fitting <- dnorm(fitting, mean=mean_Theoretical, sd=stdDeviation_estimated)
hist(mean_of_the_simulation, breaks = count, prob=T, xlab = "means", ylab = "count", main = "Density of the given Means")
lines(fitting, standard_fitting, pch=2, col="chocolate", lty=5)