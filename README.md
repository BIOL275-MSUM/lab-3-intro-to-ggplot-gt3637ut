Lab 3: Introduction to ggplot
================
Hiba Chaudhry
`4/5/2021`

> This is Lab 3 of Quant Bio.

Welcome to my Lab 3 repository for Quantitative Biology BIOL 275 at
MSUM.

## Lab objectives

The objectives of this lab are:

Use the layered grammar of graphics:

Create a blank graph using the ggplot() function Add geometric objects
to a graph Define an aesthetic mapping for a graph Add labels to a graph
Fix some common styling

Create a graph showing the distribution of a single variable Create a
bar chart for a categorical variable using the geom\_col() and
geom\_bar() functions Arrange the categories in a bar chart by frequency
Create a histogram for a numerical variable using the geom\_histogram()
function Choose and set appropriate histogram bin widths

Set the image width for an R Markdown code chunk

## Repository contents

The repository contains the following scripts:

  - [Lab Report 3](lab-report.md)

<!-- end list -->

``` r
# load packages -----------------------------------------------------------
#install.packages(c("nycflights13", "gapminder", "Lahman"))

library(nycflights13)
library(tidyverse)
```

    ## ── Attaching packages ─────────────────────────────────────── tidyverse 1.3.0 ──

    ## ✓ ggplot2 3.3.2     ✓ purrr   0.3.4
    ## ✓ tibble  3.0.4     ✓ dplyr   1.0.2
    ## ✓ tidyr   1.1.2     ✓ stringr 1.4.0
    ## ✓ readr   1.4.0     ✓ forcats 0.5.0

    ## ── Conflicts ────────────────────────────────────────── tidyverse_conflicts() ──
    ## x dplyr::filter() masks stats::filter()
    ## x dplyr::lag()    masks stats::lag()

``` r
library(auk)                          # load the auk package
```

    ## auk 0.4.2 is designed for EBD files downloaded after 2019-08-15. 
    ## No EBD data directory set, see ?auk_set_ebd_path to set EBD_PATH 
    ## eBird taxonomy version:  2019

``` r
birds <- ebird_taxonomy %>%           # start with the ebird_taxonomy data
  as_tibble() %>%                     # tibbles print better in the console
  filter(category == "species")       # remove non-species taxa
```

\#Q1: Print a table containing only species NOT in the Order
Passeriformes. Include all columns.

``` r
filter(birds, order != "Passeriformes")
```

    ## # A tibble: 4,335 x 9
    ##    species_code scientific_name common_name order family family_common category
    ##    <chr>        <chr>           <chr>       <chr> <chr>  <chr>         <chr>   
    ##  1 ostric2      Struthio camel… Common Ost… Stru… Strut… Ostriches     species 
    ##  2 ostric3      Struthio molyb… Somali Ost… Stru… Strut… Ostriches     species 
    ##  3 grerhe1      Rhea americana  Greater Rh… Rhei… Rheid… Rheas         species 
    ##  4 lesrhe2      Rhea pennata    Lesser Rhea Rhei… Rheid… Rheas         species 
    ##  5 tabtin1      Nothocercus ju… Tawny-brea… Tina… Tinam… Tinamous      species 
    ##  6 higtin1      Nothocercus bo… Highland T… Tina… Tinam… Tinamous      species 
    ##  7 hootin1      Nothocercus ni… Hooded Tin… Tina… Tinam… Tinamous      species 
    ##  8 grytin1      Tinamus tao     Gray Tinam… Tina… Tinam… Tinamous      species 
    ##  9 soltin1      Tinamus solita… Solitary T… Tina… Tinam… Tinamous      species 
    ## 10 blatin1      Tinamus osgoodi Black Tina… Tina… Tinam… Tinamous      species 
    ## # … with 4,325 more rows, and 2 more variables: taxon_order <dbl>,
    ## #   report_as <chr>

\#Q2: Print a table containing only species in the Order Passeriformes.
Include all columns.

``` r
# print a table of passeriformes
#filter(birds, order == "Passeriformes")
```

\#Q3:Print a table containing all species. Only the variables Species
Code, Scientific Name, and Common Name should be in the final table.

``` r
select(birds, species_code, scientific_name,common_name)
```

    ## # A tibble: 10,721 x 3
    ##    species_code scientific_name           common_name           
    ##    <chr>        <chr>                     <chr>                 
    ##  1 ostric2      Struthio camelus          Common Ostrich        
    ##  2 ostric3      Struthio molybdophanes    Somali Ostrich        
    ##  3 grerhe1      Rhea americana            Greater Rhea          
    ##  4 lesrhe2      Rhea pennata              Lesser Rhea           
    ##  5 tabtin1      Nothocercus julius        Tawny-breasted Tinamou
    ##  6 higtin1      Nothocercus bonapartei    Highland Tinamou      
    ##  7 hootin1      Nothocercus nigrocapillus Hooded Tinamou        
    ##  8 grytin1      Tinamus tao               Gray Tinamou          
    ##  9 soltin1      Tinamus solitarius        Solitary Tinamou      
    ## 10 blatin1      Tinamus osgoodi           Black Tinamou         
    ## # … with 10,711 more rows

\#Q4:Print a table with all species in the Order Passeriformes whose
common name starts with the word “Common”. Species should be in reverse
taxonomic order (taxon\_order variable). Only the variables Species
Code, Scientific Name, and Common Name should be in the final table.

``` r
filter(birds, order == "Passeriformes")
```

    ## # A tibble: 6,386 x 9
    ##    species_code scientific_name common_name order family family_common category
    ##    <chr>        <chr>           <chr>       <chr> <chr>  <chr>         <chr>   
    ##  1 stiwre1      Traversia lyal… Stephens I… Pass… Acant… New Zealand … species 
    ##  2 riflem1      Acanthisitta c… Rifleman    Pass… Acant… New Zealand … species 
    ##  3 buswre1      Xenicus longip… Bush Wren   Pass… Acant… New Zealand … species 
    ##  4 soiwre1      Xenicus gilviv… South Isla… Pass… Acant… New Zealand … species 
    ##  5 afrbro1      Smithornis cap… African Br… Pass… Calyp… African and … species 
    ##  6 gyhbro1      Smithornis sha… Gray-heade… Pass… Calyp… African and … species 
    ##  7 rusbro1      Smithornis ruf… Rufous-sid… Pass… Calyp… African and … species 
    ##  8 grebro1      Calyptomena vi… Green Broa… Pass… Calyp… African and … species 
    ##  9 hosbro1      Calyptomena ho… Hose's Bro… Pass… Calyp… African and … species 
    ## 10 whibro1      Calyptomena wh… Whitehead'… Pass… Calyp… African and … species 
    ## # … with 6,376 more rows, and 2 more variables: taxon_order <dbl>,
    ## #   report_as <chr>

``` r
Passeriformes<-filter(birds, order == "Passeriformes") 
filter(Passeriformes, str_detect(common_name, "Common"))
```

    ## # A tibble: 32 x 9
    ##    species_code scientific_name common_name order family family_common category
    ##    <chr>        <chr>           <chr>       <chr> <chr>  <chr>         <chr>   
    ##  1 sunasi1      Neodrepanis co… Common Sun… Pass… Phile… Asities       species 
    ##  2 scbant3      Willisornis po… Common Sca… Pass… Thamn… Typical Antb… species 
    ##  3 commin1      Geositta cunic… Common Min… Pass… Furna… Ovenbirds an… species 
    ##  4 cotfly1      Todirostrum ci… Common Tod… Pass… Tyran… Tyrant Flyca… species 
    ##  5 cicada1      Edolisoma tenu… Common Cic… Pass… Campe… Cuckooshrikes species 
    ##  6 comwoo1      Tephrodornis p… Common Woo… Pass… Vangi… Vangas, Helm… species 
    ##  7 comnew1      Newtonia brunn… Common New… Pass… Vangi… Vangas, Helm… species 
    ##  8 comior1      Aegithina tiph… Common Iora Pass… Aegit… Ioras         species 
    ##  9 cstdro1      Dicrurus ludwi… Common Squ… Pass… Dicru… Drongos       species 
    ## 10 gremag1      Cissa chinensis Common Gre… Pass… Corvi… Crows, Jays,… species 
    ## # … with 22 more rows, and 2 more variables: taxon_order <dbl>, report_as <chr>

``` r
Y<-arrange(Passeriformes,desc(taxon_order))
select(Y, species_code, scientific_name, common_name)
```

    ## # A tibble: 6,386 x 3
    ##    species_code scientific_name          common_name              
    ##    <chr>        <chr>                    <chr>                    
    ##  1 bltgro2      Saltator fuliginosus     Black-throated Grosbeak  
    ##  2 slcgro1      Saltator grossus         Slate-colored Grosbeak   
    ##  3 massal1      Saltator cinctus         Masked Saltator          
    ##  4 gobsal1      Saltator aurantiirostris Golden-billed Saltator   
    ##  5 thbsal1      Saltator maxillosus      Thick-billed Saltator    
    ##  6 blcsal1      Saltator nigriceps       Black-cowled Saltator    
    ##  7 grwsal1      Saltator similis         Green-winged Saltator    
    ##  8 leasal1      Saltator albicollis      Lesser Antillean Saltator
    ##  9 strsal1      Saltator striatipectus   Streaked Saltator        
    ## 10 grasal1      Saltator coerulescens    Grayish Saltator         
    ## # … with 6,376 more rows

\#Q5:Print a table containing species with “Warbler” in the common name.
Include all columns.

``` r
# Warbler -----------------------------------------------------------------
Warbler <- filter(birds, str_detect(common_name, "Warbler"))
```

\#Q6:Print a table with two columns: family and n, the number of species
in that family whose name contains “Warbler”

``` r
# 2 Columns: Warbler and family  ------------------------------------------
count(Warbler, family)
```

    ## # A tibble: 15 x 2
    ##    family                                                    n
    ##    <chr>                                                 <int>
    ##  1 Acanthizidae (Thornbills and Allies)                      4
    ##  2 Acrocephalidae (Reed Warblers and Allies)                60
    ##  3 Aegithalidae (Long-tailed Tits)                           2
    ##  4 Bernieridae (Malagasy Warblers)                           2
    ##  5 Cisticolidae (Cisticolas and Allies)                     19
    ##  6 Locustellidae (Grassbirds and Allies)                    38
    ##  7 Macrosphenidae (African Warblers)                         3
    ##  8 Parulidae (New World Warblers)                           83
    ##  9 Peucedramidae (Olive Warbler)                             1
    ## 10 Phaenicophilidae (Hispaniolan Tanagers)                   2
    ## 11 Phylloscopidae (Leaf Warblers)                           73
    ## 12 Scotocercidae (Bush Warblers and Allies)                 22
    ## 13 Sylviidae (Sylviid Warblers, Parrotbills, and Allies)    21
    ## 14 Teretistridae (Cuban Warblers)                            2
    ## 15 Thraupidae (Tanagers and Allies)                          2

sessioninfo::session\_info()
