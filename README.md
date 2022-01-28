# BC Color Palettes for `R`

See [BC's web style guide](https://www.bc.edu/bc-web/styles/bc-web-style-guide/color.html) for this and other specifications.

## Usage
```R
bc_color_palette <- bc_palette(name, n, type = c("discrete", "continuous"))
```

Param `name` - One of `"main_brand"`, `"primary"`, `"secondary"` or `"news_channel"`. See [Palettes](#palettes) for specifications.

Param `n` - Number of colors to return. If missing, defaults to the length of the entire palette.

Param `type` - Using `"discrete"` will return the number of colors provided by `n`. `bc_palette()` will recycle through the palette if `n` is less than the number of colors in the selected palette. Using `"continuous"` will create a color ramp with the number of colors provided by `n`.

## Examples
```R
library(ggplot2)
library(dplyr)
source("bc_palette.R")

mpg %>%
  group_by(manufacturer) %>%
  summarize(mean_hwy = mean(hwy)) %>%
  ggplot(aes(x = manufacturer, y = mean_hwy, fill = manufacturer)) + 
  theme(legend.position = "none") + 
  coord_flip() +
  geom_col() +
  scale_fill_manual(
    values = bc_palette(
      name   = "primary",
      n      = nlevels(factor(mpg$manufacturer)), 
      type   = "discrete"
    )
  )
```
![Discrete Example](img/discrete.png)

```R
library(ggplot2)
library(dplyr)
source("bc_palette.R")

mpg %>%
  ggplot(aes(x = displ, y = cty, color = hwy)) + 
  geom_point() + 
  scale_colour_gradientn(colors = bc_palette("main_brand", type = "continuous"))
```
![Continuous Example](img/continuous.png)

## Palettes
### Main Branding

Color                                                                                      | Hex       | RGB           
---                                                                                        | ---       | ---            
<span style="background-color: rgb(138,16,11); color: rgb(138,16,11);">--------</span>     | `#8a100b` | `138, 16, 11`  
<span style="background-color: rgb(178,157,108); color: rgb(178,157,108);">--------</span> | `#b29d6c` | `178, 157, 108` 
<span style="background-color: rgb(114,97,88); color: rgb(114,97,88);">--------</span>     | `#726158` | `114, 97, 88`  


### Primary

Color                                                                                      | Hex       | RGB
---                                                                                        | ---       | ---    
<span style="background-color: rgb(86,6,15); color: rgb(86,6,15);">--------</span>         | `#501315` | `86, 6, 15`    
<span style="background-color: rgb(138,16,11); color: rgb(138,16,11);">--------</span>     | `#8a100b` | `138, 16, 11`   
<span style="background-color: rgb(179,0,0); color: rgb(179,0,0);">--------</span>         | `#b30000` | `179, 0, 0`    
<span style="background-color: rgb(85,85,85); color: rgb(85,85,85);">--------</span>       | `#8a6b46` | `85, 85, 85`   
<span style="background-color: rgb(185,155,115); color: rgb(185,155,115);">--------</span> | `#b99b73` | `185, 155, 115` 
<span style="background-color: rgb(220,202,160); color: rgb(220,202,160);">--------</span> | `#dccaa0` | `220, 202, 160`
<span style="background-color: rgb(172,109,55); color: rgb(172,109,55);">--------</span>   | `#ac6d37` | `172, 109, 55` 
<span style="background-color: rgb(215,151,19); color: rgb(215,151,19);">--------</span>   | `#d79713` | `215, 151, 19` 
<span style="background-color: rgb(201,186,153); color: rgb(201,186,153);">--------</span> | `#c9ba99` | `201, 186, 153`


### Secondary

Color                                                                                      | Hex       | RGB    
---                                                                                        | ---       | ---         
<span style="background-color: rgb(138,16,11); color: rgb(138,16,11);">--------</span>     | `#8a100b` | `138, 16, 11`  
<span style="background-color: rgb(178,157,108); color: rgb(178,157,108);">--------</span> | `#b29d6c` | `178, 157, 108`
<span style="background-color: rgb(114,97,88); color: rgb(114,97,88);">--------</span>     | `#726158` | `114, 97, 88`  
<span style="background-color: rgb(183,179,165); color: rgb(183,179,165);">--------</span> | `#b7b3a5` | `183, 179, 165` 
<span style="background-color: rgb(197,207,172); color: rgb(197,207,172);">--------</span> | `#c5cfac` | `197, 207, 172` 
<span style="background-color: rgb(127,167,164); color: rgb(127,167,164);">--------</span> | `#7fa7a4` | `127, 167, 164` 
<span style="background-color: rgb(178,192,185); color: rgb(178,192,185);">--------</span> | `#b2c0b9` | `178, 192, 185` 
<span style="background-color: rgb(121,159,164); color: rgb(121,159,164);">--------</span> | `#799fa4` | `121, 159, 164` 
<span style="background-color: rgb(122,120,124); color: rgb(122,120,124);">--------</span> | `#7a787c` | `122, 120, 124` 
<span style="background-color: rgb(146,155,144); color: rgb(146,155,144);">--------</span> | `#929b90` | `146, 155, 144` 
<span style="background-color: rgb(213,207,181); color: rgb(213,207,181);">--------</span> | `#d5cfb5` | `213, 207, 181`


### News

Color                                                                                      |  Type                   | Hex       | RGB        
---                                                                                        | ---                     | ---       | --- 
<span style="background-color: rgb(98,150,168); color: rgb(98,150,168)">--------</span>    | Blue                    | `#6296a8` | `98, 150, 168`   
<span style="background-color: rgb(194,49,72); color: rgb(194,49,72);">--------</span>     | Athletics               | `#c23148` | `194, 49, 72`  
<span style="background-color: rgb(255,150,115); color: rgb(255,150,115);">--------</span> | Campus Community        | `#ff9673` | `255, 150, 115`   
<span style="background-color: rgb(159,171,120); color: rgb(159,171,120);">--------</span> | Faith & Religion        | `#9fab78` | `159, 171, 120`  
<span style="background-color: rgb(223,173,88); color: rgb(223,173,88);">--------</span>   | Humanities              | `#dfad58` | `223, 173, 88` 
<span style="background-color: rgb(212,133,84); color: rgb(212,133,84);">--------</span>   | Nation, World & Society | `#d48554` | `212, 133, 843` 
<span style="background-color: rgb(8,115,174); color: rgb(8,115,174);">--------</span>     | Science, Tech & Health  | `#0873ae` | `8, 115, 174`  
<span style="background-color: rgb(147,132,121); color: rgb(147,132,121);">--------</span> | BC Events               | `#938479` | `147, 132, 121` 
