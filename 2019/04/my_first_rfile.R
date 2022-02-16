## .Rdata

?"read.table"

file.choose()

cereal <- read.table("cereal/cereal_3.csv",
           sep = ",", header = T)

cereal

cereal[, c(2,3,4)]

cereal2 <- cereal[, 2:4]
cereal2

str(cereal2)

nrow(cereal2)
ncol(cereal2)



cereal_new2 <- read.table("cereal/cereal_2.txt")

head(cereal_new2)

cereal_new2 <- cereal_new2[, -1]



colnames(cereal_new2) <- c("Sodium", "Sugar", "Type")

head(cereal_new2)

rownames(cereal_new2)

mean(cereal_new2[, 1])

mean(cereal_new2$Sodium)

median(cereal_new2$Sugar)

sd(cereal_new2$Sugar)

table(cereal_new2$Type)

mean(cereal_new2$Type)



mean(c(T, T, F))
sum(c(T, T, F))

x <- c(T, T, F)
mean(x)
sum(x)

