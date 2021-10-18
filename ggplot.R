library(tidyverse)

data(mpg)

mpg%>% #data layer
  ggplot()
    mapping=aes( #asthetics layer
      x=displ,
      y=hwy,
      colour=manufactuer)
  )
    )+
  geom_point()
    