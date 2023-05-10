# Econometric Model and Clustering

#                                 Spending on culture and recreation in Poland 


The aim of the project is to examine what affects the amount of spending on culture and recreation. 
Data were downloaded from the Central Statistical Office website. Data is for 2021. 

## Variables:
* events - number of cultural events per 1000 people
* cinema - number of people per 1 cinema seat
* people - average number of people in a household
* income - household income per capita
* library - number of public libraries per 1000 people
* unemp_rate - unemployment rate
* expenses - cultural expenses per person (PLN)

## Descriptive statistics
The average expenditure on recreation and culture of one person in Poland is 73.98 PLN. The average number of people per one seat in the cinema is 148. The average monthly disposable income per person in Poland is PLN 2001 PLN. In 75% of provinces income per capita does not exceed 2096 PLN. 
Based on the Shapiro-Wilk test, the library variable was rejected - does not follow the normal distribution.

## Correlation Matrix 
![Screenshot](https://github.com/WiktoriaG12/econometric-model-and-clustering/blob/main/images/correlation_matrix.png)

The greatest correlation is between the cinema variable and the events variable (-0.84).

## Econometric Model
The best results were obtained for the model:
expenses =  108.73 + 0.17*cinema + 0.01*income - 112.74*social_benefits + 93.50*events - 1.86*unemp_rate

R-squared = 0,7  
70% of the variability observed in the target variable is explained by the regression model.

## Density Plot
![Screenshot](https://github.com/WiktoriaG12/econometric-model-and-clustering/blob/main/images/density_plot.png)

The residuals follow the normal distribution. 

# Clustering 

## Distance Matrix
![Screenshot](https://github.com/WiktoriaG12/econometric-model-and-clustering/blob/main/images/distance.png)

The most similar in terms of selected features are Masovian, Lower Silesian and Silesian.

## Cluster Dendrogram 
![Screenshot](https://github.com/WiktoriaG12/econometric-model-and-clustering/blob/main/images/dendrogram.png)
The dendrogram was created using Ward's method. Four classes have been distinguished. 


