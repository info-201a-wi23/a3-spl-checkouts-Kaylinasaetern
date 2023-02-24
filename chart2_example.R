x_values <- seq(1, 3)
y_values <- seq(1,3)

library(ggplot2)
ggplot() +
  geom_line(aes(x=x_values, y = y_values))

checkout_df <- read.csv("Downloads/2022-2023-All-Checkouts-SPL-Data.csv")

#Chart 2
ggplot(checkout_df) +
  geom_col(mapping=aes(x = CheckoutYear , y = MaterialType, color = Checkouts)) +
  scale_color_distiller(palette = "PuRd")+  
  labs(title = "Most material type checked out over time", x = "Year", y= "Material Type") +
  scale_alpha_continuous(20,23)

# I included this chart and the data from it in order to see which material type was checked of the most. A pattern that I noticed was that books and ebooks were checked out the most compared to other material types such as audio books or videos.