library('ggplot2')
library(tidyverse)
library(viridis)

SamaresEq_disp <- read_csv(file = "data/SamaresEq_disp.csv")

SamaresEq_disp %>% 
  filter(NomSite %in% c('Grenou_1', 'StBauzille')) %>% 
  filter(Arbre < 10) %>% 
  filter( Surface < 1) %>% 
  filter( Surface > 0.45) %>% 
  ggplot() + 
  aes( x = Surface, y = dispersion, col = NomSite) +
  geom_point() +
  geom_smooth() + scale_color_viridis(discrete = TRUE) + 
  theme(,rect = element_rect(fill = "transparent"),
        
        panel.grid.major = element_blank(), 
        panel.grid.minor = element_blank(),
        panel.background = element_rect(fill = "transparent",colour = NA),
        plot.background = element_rect(fill = "transparent",colour = NA),
        legend.position = 'none',
        axis.title  = element_blank( ), 
        axis.text = element_blank(), 
        axis.ticks = element_blank()) -> p

ggsave(filename = 'img/visu.png', p, width = 8, height = 6, bg = "transparent")

sticker(p, package="Visualisation\ et Manipulation", s_width = 1.5, s_height = 1.1,
        s_x = 0.95, p_y = 1.5, s_y = 0.9, h_fill = "#ffffff", 
        h_color = "#440154", p_color = "#440154")
  
