### PROBLEM A

## Part 1

# Specifying number of simulations
num_simulations <- 1000
set.seed(1000) #for reproducibility

# Creating a function to calculate the probability
mc_prob_calc <- function(num_simulations = 1000) {
  
  # Generating random samples for x and y for each simulation
  x <- rnorm(num_simulations, mean = 5, sd = sqrt(15))
  y <- runif(num_simulations, min = 1, max = 12)
 
  # Calculating probability that x > y
  probability <- mean(x > y)
  return(probability)
}

# Storing the probability result in the vector
# Please highlight both lines of the code below and run together
result_1 <- paste('Probability that x > y is', mc_prob_calc())
result_1

## Part 2

# Specifying number of simulations
num_simulations <- 5000
set.seed(1000) #for reproducibility

# Creating a function to calculate variation
mc_var_calc <- function(num_simulations = 1000) {
  probabilities <- rep(0, num_simulations)
  
  # Looping through each simulation
  for(i in 1:num_simulations) {
    probabilities[i] <- mc_prob_calc() # calling the probability function from Part 1
  }
  
  # Creating a conditional statement
  if(length(probabilities) < 1) {
    return (0)
  } else {
    var(probabilities) # getting the variation from Monte Carlo simulations
 }
}

# Storing the variation result in the vector
# Please highlight both lines of the code below and run together
result_2 <- paste('Monte Carlo variation from Monte Carlo simulation is', mc_var_calc())
result_2

# Part 3

# Specifying number of simulations
sim_num <- c(1:100)
var <- 0 # creating an empty vector for variation

#Creating a loop to iterate through each simulation
for (i in sim_num) {
  var[i] <- print(mc_var_calc()) #calling the variation function from Part 2 
}

# Changing the plot background colour
par(bg = 'whitesmoke')

# Creating a plot to show how the Monte Carlo variation changes with the number of simulations used to obtain the estimate
plot(x = sim_num, y = var, type = 'l', main = 'Monte Carlo Variation - Monte Carlo Simulation', xlab = 'Number of Simulations', ylab = 'Variation', col = 'mediumslateblue', lwd = 2)

## Discuss the implication of Monte Carlo variation on simulation experiments:

# This Monte Carlo variation introduces the element of uncertainty in the simulation process. Since random samples are used to estimate outcomes, every time one runs the code, it produces slightly different results. 


### Problem B

## Part 1

# Specifying number of simulations
num_sims <- 5000
p_vals <- seq(0, 1, by = 0.01)  # creating a range of p-values
total <- numeric(num_sims) 

# Creating a function to simulate the tournament for a given p
tournament <- function(p) {

  # Creating a loop to iterate through each simulation
  for (i in 1:num_sims) {
    
    # Creating empty variables for wins, losses and games played
    wins <- 0
    losses <- 0
    games_played <- 0
    
    # Creating a while loop
    while (wins < 5 && losses < 3) {
      games_played <- games_played + 1
      
      # Creating a conditional statement
      if (runif(1) < p) {
        wins <- wins + 1
      } else {
        losses <- losses + 1
      }
    }
    
    # Adding games played to total games played
    total[i] <- games_played
  }
  
  return(mean(total))
}

# Performing Monte Carlo simulations for each p-value
expected_total <- sapply(p_vals, tournament)

# Changing the plot background colour)
par(bg = 'cornsilk')

# Creating a plot to show how the expected total number of games played (wins and losses) varies as a function of p
plot(x = p_vals, y = expected_total, type = "l", xlab = "P", ylab = "Total Games", main = "Variation of total games played", col = 'orange1', lwd = 3)


## Part 2

# Specifying number of simulations
num_sims <- 5000
p_vals <- seq(0, 1, by = 0.01)  # creating a range of p-values
total <- numeric(num_sims) 
proportion <- numeric(num_sims)

# Creating a function to simulate the tournament for a given p
tournament <- function(p) {
  
  # Creating a loop to iterate through each simulation
  for (i in 1:num_sims) {
    
    # Creating empty variables for wins, losses and games played
    wins <- 0
    losses <- 0
    games_played <- 0
    
    # Creating a while loop
    while (wins < 5 && losses < 3) {
      games_played <- games_played + 1
      
      # Creating a conditional statement
      if (runif(1) < p) {
        wins <- wins + 1
      } else {
        losses <- losses + 1
      }
    }
    
    # Adding games played to total games played
    total[i] <- games_played
    
    # Calculating the proportion of wins
    proportion[i] <- wins / (wins + losses)
  }
  
  return(list(expected_total = mean(total), proportion = mean(proportion)))
}

# Performing Monte Carlo simulations for each p-value
result <- sapply(p_vals, tournament)

expected_total <- result[1, ]
proportion <- result[2, ]

# Changing the plot background colour
par(bg = 'cornsilk')

# Creating a plot to show how the expected total number of games played (wins and losses) varies as a function of p
plot(x = p_vals, y = expected_total, type = "l", xlab = "P", ylab = "Total Games", main = "Variation of total games played", col = 'orange1', lwd = 3)

## Part 3

#Changing the plot background colour
par(bg = 'snow')

# Creating a plot for observed proportion of wins
plot(x = p_vals, y = proportion, type = "l", xlab = "True probability", ylab = "Proportion of Wins", main = "Variation of proportion", col = "violet", lwd = 3)
abline(a = 0, b = 1, col = "firebrick1", lty = 2)
 


## Comment on what you observe

#As the actual true probability of winning increases, the observed proportion of wins increases too. 

## Does the format of the tournament (5 wins or 3 losses) have any effect?

# Yes, the format of tournament has an effect on observed proportion of wins. It introduces an element of uncertainty in the observed proportion of wins and sets limits due to which the proportion may deviate from p. You can see how the observed proportion is affected by the change of the tournament format below:

# Specifying number of simulations
num_sims <- 5000
p_vals <- seq(0, 1, by = 0.01)  # creating a range of p-values
total <- numeric(num_sims) 
proportion <- numeric(num_sims)

# Creating a function to simulate the tournament for a given p
tournament <- function(p) {
  
  # Creating a loop to iterate through each simulation
  for (i in 1:num_sims) {
    
    # Creating empty variables for wins, losses and games played
    wins <- 0
    losses <- 0
    games_played <- 0
    
    # Creating a while loop
    while (wins < 3 && losses < 3) {
      games_played <- games_played + 1
      
      # Creating a conditional statement
      if (runif(1) < p) {
        wins <- wins + 1
      } else {
        losses <- losses + 1
      }
    }
    
    # Adding games played to total games played
    total[i] <- games_played
    
    # Calculating the proportion of wins
    proportion[i] <- wins / (wins + losses)
  }
  
  return(list(expected_total = mean(total), proportion = mean(proportion)))
}

# Performing Monte Carlo simulations for each p-value
result <- sapply(p_vals, tournament)

expected_total <- result[1, ]
proportion <- result[2, ]

# Changing the plot background colour
par(bg = 'cornsilk')

# Creating a plot to show how the expected total number of games played (wins and losses) varies as a function of p
plot(x = p_vals, y = expected_total, type = "l", xlab = "P", ylab = "Total Games", main = "Variation of total games played", col = 'orange1', lwd = 3)

#Changing the plot background colour
par(bg = 'snow')

# Creating a plot for observed proportion of wins
plot(x = p_vals, y = proportion, type = "l", xlab = "True probability", ylab = "Proportion of Wins", main = "Variation of proportion", col = "violet", lwd = 3)
abline(a = 0, b = 1, col = "firebrick1", lty = 2)