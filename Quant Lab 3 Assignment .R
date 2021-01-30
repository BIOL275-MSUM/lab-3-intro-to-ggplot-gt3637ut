
# load packages  ----------------------------------------------------------

library(tidyverse)

firefly_data <- read_csv("https://whitlockschluter.zoology.ubc.ca/wp-content/data/chapter02/chap02q19FireflySpermatophoreMass.csv")
firefly_data
ggplot(data = firefly_data)

ggplot(data = firefly_data) + geom_histogram(mapping = aes(x= spermatophoreMass))

ggplot(data = firefly_data) +
  geom_histogram(mapping = aes(x = spermatophoreMass),
                 fill = "#C5351B" , color = "black") +
  labs(x = "Spermatophore Mass", y = "Count") +
  theme_classic() + 
  theme(
    axis.title = element_text(face = "bold"),
    axis.text = element_text(color = "black", size = rel(1))
  )
rlang::last_error()


  

    
  
  
  
  
  