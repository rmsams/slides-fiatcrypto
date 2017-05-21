library(Quandl)

## get the api key here: https://www.quandl.com/account/api
## .. and save it in file quandl.auth.txt
Quandl.auth(readLines("quandl.auth.txt"))
y <- Quandl("BITCOIN/BITSTAMPUSD") ## 2011 to early 2015
z <- Quandl("BITSTAMP/USD")        ## 2014 to present
y <- y[, c("Date","Close")]
z <- z[, c("Date","Last")]
colnames(z)[2] <- "Close"
z <- subset(z, z$Date > max(y$Date)) ## splice the two series
x <- rbind(z, y) 
save(x, file="btcusd.RData", ascii=TRUE)

