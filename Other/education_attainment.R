## FLAGS
## b	break in time series	c	confidential	d	definition differs, see metadata
## e	estimated	f	forecast	i	see metadata (phased out)
## n	not significant	p	provisional	r	revised
## s	Eurostat estimate (phased out)	u	low reliability	z	not applicable
flags <- c("b|c|d|e|f|i|n|p|r|s|u|z|\\:")

## Download data from 
## https://ec.europa.eu/eurostat/databrowser/view/edat_lfse_03$DV_598/default/table?lang=de
edat_lfse_03 <- read.delim("edat_lfse_03.tsv", header=T, 
                           stringsAsFactors = F)
head(edat_lfse_03)
str(edat_lfse_03)

edat_lfse_03[edat_lfse_03 == ":"] <- NA

df <- as.data.frame(do.call("rbind", strsplit(edat_lfse_03[, 1], ",")))
summary(df)
# ED0-2 <= secondary ed, ED3-4 non tertiary, #ED5-8 tertiary

for (i in (seq_len(ncol(edat_lfse_03[-1])) + 1)){
  df[, 4 + i] <- as.numeric(gsub(flags, "", edat_lfse_03[, i]))
}
summary(df)
colnames(df) <- c("sex", "age", "unit", "education", "country", paste0("X", 2017:1992))   
head(df)

library(dplyr)
library(ggplot2)
#library(tidyr)
library(scales)

df_f_at <- df[(df$sex == "F" & df$age == "Y15-64" & #df$country == "AT" & 
               df$education == "ED5-8"), -c(1:5)]
df_list <- lapply(1:nrow(df), function(i){
   data.frame(sex = df[i, "sex"],
              country = df[i, "country"],
              age = df[i, "age"],
              education = df[i, "education"],
              year = 2017:1992, perc =  as.numeric(df[i, -c(1:5)])) 
})

df <- as.data.frame(do.call("rbind", df_list))
head(df)


df1 <-df[(df$sex == "F" & df$age == "Y15-64" & df$country %in% c("AT", "RO", "EU27") &
            df$education == "ED5-8"), ]
df2 <-df[(df$sex == "M" & df$age == "Y15-64" & df$country %in%  c("AT", "RO", "EU27")&
            df$education == "ED5-8"), ]

df1$difference <- df1$perc - df2$perc

library(lattice)
xyplot(difference ~ year, data=df1, xlim=c(2006.5,2017.5),
       pch=20,auto.key=list(columns=3),
       groups=factor(country))
abline(h=0)

ggplot(df1, aes(x=year,y=difference,colour=country,group=country)) + geom_line()+geom_smooth()
