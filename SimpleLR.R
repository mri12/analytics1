#Linear regression - on sales data
df
fit = lm(Y~X,data=df)
summary(fit)
plot(fit)
predict(fit,newdata=data.frame(X=mean(df$X)))
