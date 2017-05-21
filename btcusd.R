library(zoo)
library(lattice)

load("btcusd.RData")
x$ror <- c(NA, exp(diff(log(x$Close)))) - 1
x$vol <- rollapply(x$ror, 30, sd, na.rm=TRUE, fill=0, partial=TRUE, align="right")

## chart of daily returns
pdf("btcror.pdf")
xyplot(ror ~ Date, data=x, type="l", col="grey",
         main="BTC/USD", ylab="Daily Returns")
dev.off()

## chart of rolling 30-day vol
pdf("btcvol.pdf")
xyplot(vol ~ Date, data=x, type="l", col="grey",
         main="BTC/USD", ylab="Rolling 30-day Volatility")
dev.off()

