library(car)
library(lmtest)

t38 <- read.table("t38.txt",header = T)
cons <- ts(t38$CONS, start = 1953, frequency = 4)
inc <- ts(t38$INC, start = 1953, frequency = 4)
inflat <- ts(t38$INFLAT, start = 1953, frequency = 4)
model1 <- lm(cons~inc+inflat)
summary(model1)
#pienet p-arvot, selittävyys 94% - ei hyvä
vif(model1) # pienet
hist(model1$residuals,xlab="Residuaali",ylab="Frekvenssi",main=" ")
#normaali-j
acf(model1$residuals,main="")
qqnorm(model1$residuals,pch=16)
plot(model1$residuals,type="p",ylab="Residuaali",xlab="Vuosi",pch=16,xaxt="n")
#aika hajallaan
pred1 <- ts(predict(model1),start=1953)
plot(cons,col="red",xlab="Aika",ylab="")
lines(pred1,col="blue")
#ompa huono
legend("topleft", legend=c("LQ1CPC", "Sovite"), col=c("red","blue"),lty=c(1,1),cex=1.8)
plot(cooks.distance(model1),ylab="Cookin Etäisyys",xlab="Indeksi", pch=16)
plot(model1$residuals,model1$fitted.values)
bgtest(model1,order = 10)
#korrelaatiota, ei hyvä
#paska malli - en ostais

dcons <- diff(cons)
dinc <- diff(inc)
dinflat <- diff(inflat)
modelD <- lm(dcons~dinc+dinflat)
summary(modelD)
#selittävyysaste 58%, huono homma
vif(modelD) # pienet
hist(modelD$residuals,xlab="Residuaali",ylab="Frekvenssi",main=" ")
#normaali-j
acf(modelD$residuals,main="")
qqnorm(modelD$residuals,pch=16)
plot(modelD$residuals,type="p",ylab="Residuaali",xlab="Vuosi",pch=16,xaxt="n")
#vähemmän hajallaan
pred2 <- ts(predict(modelD),start=1954)
plot(dcons,col="red",xlab="Aika",ylab="")
lines(pred2,col="blue")
#ompa huono
legend("topleft", legend=c("LQ1CPC", "Sovite"), col=c("red","blue"),lty=c(1,1),cex=1.8)
plot(cooks.distance(modelD),ylab="Cookin Etäisyys",xlab="Indeksi", pch=16)
plot(modelD$residuals,modelD$fitted.values)
bgtest(modelD,order = 10)
#korrelaatiota, ei hyvä
#paska malli - en ostais
model3 <- lm(cons[-1]~dcons+inc[-1]+dinc+inflat[-1]+dinflat)
summary(model3)
#selittävyysaste 95%, hyvä homma
vif(model3) # pienet
hist(model3$residuals,xlab="Residuaali",ylab="Frekvenssi",main=" ")
#ei ihan normaali-j
acf(model3$residuals,main="")
qqnorm(model3$residuals,pch=16)
plot(model3$residuals,type="p",ylab="Residuaali",xlab="Vuosi",pch=16,xaxt="n")
#vähemmän hajallaan
pred3 <- ts(predict(model3))
plot(dcons,col="red",xlab="Aika",ylab="")
lines(pred3,col="blue")
#ompa huono
legend("topleft", legend=c("LQ1CPC", "Sovite"), col=c("red","blue"),lty=c(1,1),cex=1.8)
plot(cooks.distance(model3),ylab="Cookin Etäisyys",xlab="Indeksi", pch=16)
plot(model3$residuals,model3$fitted.values)
bgtest(model3,order = 10)
#pieni p-arvo

