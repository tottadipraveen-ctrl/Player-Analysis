#install.packages("zoo")
#install.packages("ggplot2")
#install.packages("readxl")
library(readxl)
library(zoo)
library(ggplot2)

file <- read_excel("TilakVarma.xlsx", col_names = TRUE)
colnames(file) <- c("Match_No", "Match",	"Innings", "Runs", "Balls", "Outs",	"Avg",	"SR",	"HS",	"50",	"100",	"4s",	"6s",	"Dot%", "Phase")

file$Total_Runs <- cumsum(file$Runs)
file$Runs_Per_Inn <- file$Total_Runs / file$Match_No

# Plot
ggplot(file, aes(x = Match_No)) +
  geom_line(aes(y = Runs), color = "blue") +
  geom_line(aes(y = Runs_Per_Inn), color = "red", linewidth = 1) +
  scale_y_continuous(
    breaks = seq(0, 125, by = 10)
  ) +
  labs(title = "Runs and Runs Per Inning",
       x = "Match Number",
       y = "Runs") +
  theme_minimal()

file$No_of_Outs <- cumsum(file$Outs)
file$Batting_Avg <- file$Total_Runs / file$No_of_Outs

# Plot Batting avg
ggplot(file, aes(x = Match_No, y = Batting_Avg)) +
  geom_line(color = "blue") +
  labs(title = "Cummulative Batting Average",
       x = "Match Number",
       y = "Batting Average") +
  theme_minimal()


Before <- subset(file, file$Phase == "Before")
After  <- subset(file, file$Phase == "After")

#install.packages("boot")
library(boot)
set.seed(123)

boot.mean <- function(file, indices) {
  sample <- file[indices, ]
  mean(sample$Runs)
}

Before.boot <- boot(Before, boot.mean, R = 10000)
After.boot <- boot(After, boot.mean, R = 10000)

boot.ci(Before.boot, type = "perc")
boot.ci(After.boot, type = "perc")

mean(Before.boot$t)
mean(After.boot$t)

hist(Before.boot$t,
     col="lightblue",
     main="Early Career")

hist(After.boot$t,
     col="lightgreen",
     main="Late Career")

boot.diff_runs <- Before.boot$t - After.boot$t
quantile(boot.diff_runs,c(0.025,0.975))


file$dotballs <- (file$`Dot%`*file$Balls)/100
overalldotperc <- sum(file$dotballs)/sum(file$Balls)*100
overalldotperc

Before$dotballs <- (Before$`Dot%`*Before$Balls)/100
Beforedotperc <- sum(Before$dotballs)/sum(Before$Balls)*100
Beforedotperc

After$dotballs <- (After$`Dot%`*After$Balls)/100
Afterdotperc <- sum(After$dotballs)/sum(After$Balls)*100
Afterdotperc


boot.sr <- function(Before, indices){
  sample <- Before[indices, ]
  total_runs <- sum(sample$Runs)
  total_balls <- sum(sample$Balls)
  overall_sr <- (total_runs / total_balls) * 100
  return(overall_sr)
}

Before.boot_sr <- boot(Before, statistic = boot.sr, R = 10000)
boot.ci(Before.boot_sr, type = "perc")


boot.sr <- function(After, indices){
  sample <- After[indices, ]
  total_runs <- sum(sample$Runs)
  total_balls <- sum(sample$Balls)
  overall_sr <- (total_runs / total_balls) * 100
  return(overall_sr)
}

After.boot_sr <- boot(After, statistic = boot.sr, R = 10000)
boot.ci(After.boot_sr, type = "perc")


hist(Before.boot_sr$t,
     col="lightpink",
     main="Early Career")

hist(After.boot_sr$t,
     col="lightgreen",
     main="Late Career")

mean(Before.boot_sr$t)
mean(After.boot_sr$t)

boot.diff_sr <- Before.boot_sr$t - After.boot_sr$t

quantile(boot.diff_sr,
         c(0.025, 0.975))


boot.avg <- function(Before, indices){
  sample <- Before[indices, ]
  total_runs <- sum(sample$Runs)
  total_outs <- sum(sample$Outs)
  Phase_Batting_Avg <- total_runs/total_outs
  return(Phase_Batting_Avg)
}

Before.boot_avg <- boot(Before, statistic = boot.avg, R = 10000)
boot.ci(Before.boot_avg, type = "perc")

boot.avg <- function(After, indices){
  sample <- After[indices, ]
  total_runs <- sum(sample$Runs)
  total_outs <- sum(sample$Outs)
  Phase_Batting_Avg <- (total_runs / total_outs)
  return(Phase_Batting_Avg)
}

After.boot_avg <- boot(After, statistic = boot.avg, R = 10000)
boot.ci(After.boot_avg, type = "perc")

mean(Before.boot_avg$t)
mean(After.boot_avg$t)

boot.diff_avg <- Before.boot_avg$t - After.boot_avg$t
quantile(boot.diff_avg,c(0.025,0.975))



