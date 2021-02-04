title:Lab Report 3 birds
author: Hiba Chaudhry 
date: Feb/2/21
output: github_document 


Objectives: 
  
  #Use the layered grammar of graphics

  #Create a graph showing the distribution of a single variable
  
  #Set the image width for an R Markdown code chunk





#The data is consisted of bird species. Each species has family and order. Through this script a bar chart will be made to show the distribution of the order, showing abundace per species.

# load packages -----------------------------------------------------------

library(tidyverse)

# bird_data ---------------------------------------------------------------


library(auk)                          # load the auk package
birds <- ebird_taxonomy %>%           # start with the ebird_taxonomy data
  as_tibble() %>%                     # tibbles print better in the console
  filter(category == "species")       # remove non-species taxa
#To be able to read the data 

ggplot(data = bird_data)

#> 
#> ── Column specification ────────────────────────────────────────────────────────
#> cols(
#>   species = col_character(),
#>   abundance = col_double()
#> )
#This code chuck specifies the variables  

bird_data                  # print the data in the console
#> # A tibble: 43 x 2
#> species         abundance
#> <chr>                 <dbl>
#> 1 Black Vulture             64
#> 2 Turkey Vulture            23
#> 3 Harris's Hawk              3
#> 4 Red-tailed Hawk           16
#> 5 American Kestrel           7
#> 6 Gambel's Quail           148
#> 7 Rock Dove                  7
#> 8 White-winged Dove        625
#> 9 Mourning Dove            135
#> 10 Greater Roadrunner         1
# … with 33 more rows
#This code chuck helps us see some of the values that are presented in our data 

distinct(bird_data, abundance)
# A tibble: 31 x 1
#> abundance
#> <dbl>
#> 1        64
#> 2        23
#> 3         3
#> 4        16
#> 5         7
#> 6       148
#> 7       625
#> 8       135
#> 9         1
#> 0         2
# … with 21 more rows
#To see each value taken by a categorical variable 

count(bird_data, abundance)
# A tibble: 31 x 2
#> abundance     n
#> <dbl> <int>
#>  1         1     5
#> 2         2     4
#> 3         3     2
#> 4         4     1
#> 5         5     1
#> 6         7     2
#> 7        10     1
#> 8        12     1
#> 9        13     1
#> 10        14     1
# … with 21 more rows
#This is a contingency table which shows how many times a value occurs in the data

distinct(birds, order)
count(birds, order)

ggplot(data = birds) +
  geom_bar(mapping = aes(x = order))
#To create our brar graph

ggplot(data = birds) +
  geom_bar(mapping = aes(x = fct_infreq(order)), fill = "#C5351B") +
  labs(x = "Order", y = "Frequency (Number of Bird Species)")
#Naming x and y values 

ggplot(data = birds) +
  geom_bar(mapping = aes(x = fct_infreq(order)), fill = "#C5351B", 
           width = .8) +
  labs(x = "Order", y = "Frequency (Number of Bird Species)") +
  scale_y_continuous(limits = c(0, NA), expand = expansion(mult = 0)) +
  theme_classic(base_size = 7) +
  theme(
    axis.title = element_text(face = "bold"),
    axis.text = element_text(color = "black", size = rel(1)),
    axis.text.x = element_text(angle = 45, hjust = 1),
    axis.ticks.x = element_blank()
  ) 
#To make the graph look more presentable, adding color, fixing the axises, the base size, etc.
#Why did we do this, what are we looking for? 
#Find the number of bird species in the bird data set 
#The contingency table was created to find out the number of orders 
#Bar graph with showed each bird species. Each bird species had a family and an order. The graph showed a distribution of the order. 
#Rose Lakeman reviewed my script at this link: https://github.com/BIOL275-MSUM/lab-3-intro-to-ggplot-gt3637ut/issues/2
#I reviewed Rose Lakeman's script at this link: https://github.com/BIOL275-MSUM/lab-3-intro-to-ggplot-rlakemn517/issues/1

#Session Info  

'''{r}
sessioninfo::session_info()
'''

  
  