x_values <- seq(1, 3)
y_values <- seq(1,3)
ggplot() +
  geom_line(aes(x=x_values, y = y_values))

library(ggplot2)
library(dplyr)
library(maps)
library(plotly)

# Load data from csv file
checkout_df <- read.csv("Downloads/2022-2023-All-Checkouts-SPL-Data.csv")

#Introduction:Compare the checkouts between the years 2022 and 2023 in the dataset

#How many observations (rows) are in each dataset?
row_checkouts <- nrow(checkout_df)
#How many features (columns) are there in each dataset?
col_checkouts <- ncol(checkout_df)

#What was the most amount of checkouts made in the dataset?
total_checkouts <- checkout_df %>% 
  filter(Checkouts== max(Checkouts, na.rm = FALSE)) %>% 
  pull(Checkouts)
print(total_checkouts)

# 2950

#What title had the most checkout per year?
most_checkouts<- checkout_df %>% 
  group_by(CheckoutYear) %>% 
  filter(Checkouts == max(Checkouts)) %>% 
  filter(Title == max(Title)) %>% 
  pull(Title)
print(most_checkouts)
 # 2022: "The House of Broken Angels" 2023: "Headphones / Seattle Public Library"

#In the dataset, what was the most selected usage class used between physical and digital?
most_usageclass <- checkout_df %>% 
  filter(UsageClass == max(UsageClass)) %>% 
  pull(UsageClass)
print(most_usageclass)
#Physical  


#In the dataset, what was the most selected material type that was checked out?
most_materialtype <- checkout_df %>% 
  filter(MaterialType == max(MaterialType)) %>% 
  pull(MaterialType)
print(most_materialtype)
#VISUAL

#Which Title was the most popular among the checkouts in the dataset?
pop_title <- checkout_df %>% 
  filter(Title == max(Title)) %>% 
  pull(Title)
print(pop_title)
# "龟兔赛跑 / The Tortoise And The Hare" 


#Trend over time
# Comparison of Physical vs. Digtal usage class used.
ggplot(checkout_df) +
  geom_col(mapping=aes(x = CheckoutYear , y = UsageClass, color = Checkouts))+
  scale_color_distiller(palette = "PuBu") +
  labs(title = "Usgage Checkouts Over Time",x = "Year", y = "Usage Class" )+
  scale_alpha_continuous(20, 23)

# I included the chart and the data from it in order to compared the usage classes used between the years 2022 and 2023. Patterns that emerged that I noticed was that physical books were checked out more compared to digital. 

  
#Chart 2 
# Trend over time 
# Comparison of Material Type checked out 
ggplot(checkout_df) +
geom_col(mapping=aes(x = Checkouts , y = MaterialType, color = Checkouts)) +
  scale_color_distiller(palette = "PuRd")+  
  labs(title = "Most material type checked out over time", x = "Amount checked out", y= "Material Type") +
  scale_alpha_continuous(20,23)

# I included this chart and the data from it in order to see which material type was checked of the most. A pattern that I noticed was that books and ebooks were checked out the most compared to other material types such as audio books or videos.
  
#Chart 3
ggplot(data= checkout_df, aes(x = CheckoutYear , y = MaterialType)) +
  geom_point() +
  labs(title = "Material Types available throughout the years",
       x = "Checkout Year",
       y = "Material Types")

# I included this chart and data in order to see what material types were available to check out throughout the years. A pattern that I noticed from this was that in 2023, some items that were not available or that were never checked out. Some of these items include videocass, compfile, and videodisc. 
  

  
  


 

