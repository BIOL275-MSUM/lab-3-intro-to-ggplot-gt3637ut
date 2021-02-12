
# load packages -----------------------------------------------------------
install.packages(c("nycflights13", "gapminder", "Lahman"))

library(nycflights13)
library(tidyverse)

library(auk)                          # load the auk package
birds <- ebird_taxonomy %>%           # start with the ebird_taxonomy data
  as_tibble() %>%                     # tibbles print better in the console
  filter(category == "species")       # remove non-species taxa


birds               # print the data in the console
# A tibble: 43 x 2
#species            abundance
#<chr>                  <dbl>
 # 1 Black Vulture             64
#2 Turkey Vulture            23
#3 Harris's Hawk              3
# 4 Red-tailed Hawk           16
 #5 American Kestrel           7
 #6 Gambel's Quail           148
#7 Rock Dove                  7
#8 White-winged Dove        625
#9 Mourning Dove            135
#10 Greater Roadrunner         1
# … with 33 more rows


# answer for question 2
# print a table of passeriformes
#filter(birds, order == "Passeriformes")

# answer for question 1
# print a table without passeriformes
#filter(birds, order != "Passeriformes")


birds


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
  geom_bar(mapping = aes(x = fct_infreq(order)), fill = "#C5351B", filter(birds, order != "Passeriformes"),
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
#End of question 1 

birds


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
  geom_bar(mapping = aes(x = fct_infreq(order)), fill = "#C5351B", filter(birds, order == "Passeriformes"),
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
#End of question 2 

#Question 3
select(birds, species_code, scientific_name,common_name)

#Question 4
filter(birds, order == "Passeriformes")
Passeriformes<-filter(birds, order == "Passeriformes") 
filter(Passeriformes, str_detect(common_name, "Common"))
Y<-arrange(Passeriformes,desc(taxon_order))
select(Y, species_code,scientific_name,common_name)

#Question 5
# Warbler -----------------------------------------------------------------
Warbler <- filter(birds, str_detect(common_name, "Warbler"))

#Question 6
# 2 Columns: Warbler and family  ------------------------------------------
count(Warbler, family)


    









