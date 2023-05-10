library(lattice)
library(corrplot)
library(visreg)
library(factoextra)

data <- data.frame(rk_data[2:9],
                      row.names = rk_data$province)


# descriptive statistics ------------------------------------------------------


summary(data)
sd(data$expenses)
sd(data$income)
sd(data$people)
sd(data$cinema)
sd(data$unemp_rate)
sd(data$social_benefits)
sd(data$library)
sd(data$events)


# Shapiro - Wilk test ------------------------------------------------------


densityplot(data$expenses,
            plot.points=FALSE)
shapiro.test(data$expenses)

densityplot(data$cinema,
            plot.points=FALSE)
shapiro.test(data$cinema)

densityplot(data$people,
            plot.points=FALSE)
shapiro.test(data$people)

densityplot(data$income,
            plot.points=FALSE)
shapiro.test(data$income)

densityplot(data$social_benefits,
            plot.points=FALSE)
shapiro.test(data$social_benefits)

densityplot(data$library,
            plot.points=FALSE)
shapiro.test(data$library)

densityplot(data$events,
            plot.points=FALSE)
shapiro.test(data$events)

densityplot(data$unemp_rate,
            plot.points=FALSE)
shapiro.test(data$unemp_rate)


# Correlation -----------------------------------------------------


pairs(data,
      main = "Scatter Graph")

corelation <- cor(data)

palette <- colorRampPalette(c('purple','pink', 'navy'))


corrplot.mixed(korelacja,
               mar = c(1,1,1,1),
               lower="number",
               upper="square",
               tl.col="black",
               lower.col = palette(10),
               upper.col = palette(10),
               tl.cex=0.8,
               main="Correlation Matrix")



# Econometrics models ----------------------------------------------------


model <- lm(data=data,
             expenses~cinema+people+income+social_benefits+events+unemp_rate)
summary(model)


model2 <- lm(data=data,
             expenses~cinema+income+social_benefits+events+unemp_rate)
summary(model2)

model3 <- lm(data=data,
             expenses~cinema+social_benefits+events+unemp_rate)
summary(model3)

model4 <- lm(data=data,
             expenses~social_benefits+events+unemp_rate)
summary(model4)

plot(model2$fitted.values,
     model2$residuals,
     xlab="theoretical value",
     ylab="residual")

densityplot(model2$residuals,
            plot.points=FALSE,
            xlab="residual")

shapiro.test(model2$residuals)


# Cluster Analysis ---------------------------------------------------------


#standarization
standaryzowane <- scale(data)


#distance matrix
distance <- dist(standaryzowane)
distance

# Wisualization of distance matrix 
fviz_dist(distance,
          gradient = list(low='navy', mid='purple', high='pink'))




# Clustering - Ward method
result <- hclust(distance,
                method = 'ward.D2')

# Dendrogram
fviz_dend(result, k=4, cex=0.5,
          horiz = TRUE,
          lwd=0.9,
          palette = rainbow(4))



