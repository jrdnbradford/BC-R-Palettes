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

Color                                                            | Hex       | RGB           
---                                                              | ---       | ---            
![#8a100b](https://via.placeholder.com/30/8a100b/000000?text=+)  | `#8a100b` | `138, 16, 11`  
![#b29d6c](https://via.placeholder.com/30/b29d6c/000000?text=+)  | `#b29d6c` | `178, 157, 108` 
![#726158](https://via.placeholder.com/30/726158/000000?text=+)  | `#726158` | `114, 97, 88`  


### Primary

Color                                                            | Hex       | RGB
---                                                              | ---       | ---    
![#501315](https://via.placeholder.com/30/501315/000000?text=+)  | `#501315` | `86, 6, 15`    
![#8a100b](https://via.placeholder.com/30/8a100b/000000?text=+)  | `#8a100b` | `138, 16, 11`   
![#b30000](https://via.placeholder.com/30/b30000/000000?text=+)  | `#b30000` | `179, 0, 0`    
![#8a6b46](https://via.placeholder.com/30/8a6b46/000000?text=+)  | `#8a6b46` | `85, 85, 85`   
![#b99b73](https://via.placeholder.com/30/b99b73/000000?text=+)  | `#b99b73` | `185, 155, 115` 
![#dccaa0](https://via.placeholder.com/30/dccaa0/000000?text=+)  | `#dccaa0` | `220, 202, 160`
![#ac6d37](https://via.placeholder.com/30/ac6d37/000000?text=+)  | `#ac6d37` | `172, 109, 55` 
![#d79713](https://via.placeholder.com/30/d79713/000000?text=+)  | `#d79713` | `215, 151, 19` 
![#c9ba99](https://via.placeholder.com/30/c9ba99/000000?text=+)  | `#c9ba99` | `201, 186, 153`


### Secondary

Color                                                            | Hex       | RGB    
---                                                              | ---       | ---         
![#8a100b](https://via.placeholder.com/30/8a100b/000000?text=+)  | `#8a100b` | `138, 16, 11`  
![#b29d6c](https://via.placeholder.com/30/b29d6c/000000?text=+)  | `#b29d6c` | `178, 157, 108`
![#726158](https://via.placeholder.com/30/726158/000000?text=+)  | `#726158` | `114, 97, 88`  
![#b7b3a5](https://via.placeholder.com/30/b7b3a5/000000?text=+)  | `#b7b3a5` | `183, 179, 165` 
![#c5cfac](https://via.placeholder.com/30/c5cfac/000000?text=+)  | `#c5cfac` | `197, 207, 172` 
![#7fa7a4](https://via.placeholder.com/30/7fa7a4/000000?text=+)  | `#7fa7a4` | `127, 167, 164` 
![#b2c0b9](https://via.placeholder.com/30/b2c0b9/000000?text=+)  | `#b2c0b9` | `178, 192, 185` 
![#799fa4](https://via.placeholder.com/30/799fa4/000000?text=+)  | `#799fa4` | `121, 159, 164` 
![#7a787c](https://via.placeholder.com/30/7a787c/000000?text=+)  | `#7a787c` | `122, 120, 124` 
![#929b90](https://via.placeholder.com/30/929b90/000000?text=+)  | `#929b90` | `146, 155, 144` 
![#d5cfb5](https://via.placeholder.com/30/d5cfb5/000000?text=+)  | `#d5cfb5` | `213, 207, 181`


### News

Color                                                             |  Type                   | Hex       | RGB        
---                                                               | ---                     | ---       | --- 
![#6296a8](https://via.placeholder.com/30/6296a8/000000?text=+)   | Blue                    | `#6296a8` | `98, 150, 168`   
![#c23148](https://via.placeholder.com/30/c23148/000000?text=+)   | Athletics               | `#c23148` | `194, 49, 72`  
![#ff9673](https://via.placeholder.com/30/ff9673/000000?text=+)   | Campus Community        | `#ff9673` | `255, 150, 115`   
![#9fab78](https://via.placeholder.com/30/9fab78/000000?text=+)   | Faith & Religion        | `#9fab78` | `159, 171, 120`  
![#dfad58](https://via.placeholder.com/30/dfad58/000000?text=+)   | Humanities              | `#dfad58` | `223, 173, 88` 
![#d48554](https://via.placeholder.com/30/d48554/000000?text=+)   | Nation, World & Society | `#d48554` | `212, 133, 843` 
![#0873ae](https://via.placeholder.com/30/0873ae/000000?text=+)   | Science, Tech & Health  | `#0873ae` | `8, 115, 174`  
![#938479](https://via.placeholder.com/30/938479/000000?text=+)   | BC Events               | `#938479` | `147, 132, 121` 
