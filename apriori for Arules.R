# Association rules using Apriori

# Step 1: Let's process the data
install.packages('arules')
library(arules)

#Importing the dataset in R
dataset = read.csv('Market_Basket_Optimisation.csv', header = FALSE)
dataset = read.transactions('Market_Basket_Optimisation.csv', sep = ',', rm.duplicates = TRUE) #Removing duplicate enteries
summary(dataset)
itemFrequencyPlot(dataset, topN = 10)

# Step 2: Let's train Apriori on the dataset
rules = apriori(data = dataset, parameter = list(support = 0.004, confidence = 0.2))

# Step 3: Visualising the results
inspect(sort(rules, by = 'lift')[1:10])
