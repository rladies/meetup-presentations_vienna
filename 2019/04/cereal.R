## Reading data in R

## R has its own data format .Rdata

## but it has several functions to read in data in different formats.

file.choose()

?"read.table"

cereal <- read.csv("cereal/cereal_3.csv",
           header = TRUE, sep = ",")



#########################
### Load cereal_2.txt ###
#########################

cereal <- read.table("cereal/cereal_2.txt")


cereal

## Column and rownames names

colnames(cereal)
rownames(cereal)

nrow(cereal)
ncol(cereal)
dim(cereal)
## first entries of the data.frame

head(cereal)

head(cereal[, c(2,3,4)])

## the first column in not needed, eliminate it
cereal <- cereal[, -1]

## or
# cereal <- cereal[, c(2,3,4)]
## 

## Column names would be nice...
colnames(cereal) <- c("Sodium.mg", "Sugar.g", "Type")
head(cereal)

str(cereal)


## further data frames ....
data("ToothGrowth")
ToothGrowth

## select one column
ToothGrowth$len ## it s like a list 

## basic statistics
mean(ToothGrowth$len) ## it s like a list 
median(ToothGrowth$len)

summary(ToothGrowth$len)

summary(ToothGrowth)

## basic plots
plot(ToothGrowth$len)

boxplot(ToothGrowth$len)

boxplot(ToothGrowth$len ~ ToothGrowth$supp)

hist(ToothGrowth$len)

barplot(ToothGrowth$supp)

barplot(table(ToothGrowth$supp))

plot(ToothGrowth$len, ToothGrowth$dose)


install.packages("ggplot2")
library("ggplot2")
ggplot(ToothGrowth) +
  #geom_line(aes(x = random2, y = random1, color=random2)) +
  geom_point(aes(x = len, y = dose, color=supp)) #+
#  geom_hline(aes(yintercept = median(random1)), color="blue4")+
#  geom_vline(aes(xintercept = mean(random2)), color="green4") +
#  geom_abline(aes(intercept=regr$coefficients[1], slope=regr$coefficients[2]))

nbins<- length(unique(data$'Focus_of_the_next_training'))


ggplot(data) +
  #geom_histogram(aes(random2), bins = 3)
  geom_dotplot(aes(data$'Focus_of_the_next_training'), 
               bins = nbins)



