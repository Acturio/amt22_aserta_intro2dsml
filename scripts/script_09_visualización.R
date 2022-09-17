
pacman::p_load(
 dplyr,
 ggplot2,
 reshape2,
 DataExplorer,
 stringr,
 plotly
)


data("diamonds")
glimpse(diamonds)

for (j in 1:10) {
 diamonds[sample(35940, sample(20001, 16457)),j] <- NA
}

plot_intro(diamonds)
plot_missing(diamonds)

#### Gráficos univariados ####

diamonds %>% 
  ggplot( aes( x = price)) + 
  geom_histogram(color= "purple", fill= "pink", bins = 30) +
  scale_x_continuous(labels = scales::dollar_format()) +
  scale_y_continuous(labels = scales::comma_format()) +
  ggtitle("Distribución de precio")

diamonds %>% 
  ggplot( aes( x = price)) + 
  geom_histogram(
   aes(y = ..density..), 
   color= "Blue", fill= "White", bins = 30) +
  stat_density(geom = "line", colour = "black", size = 1) +
  scale_x_continuous(labels = scales::label_dollar()) +
  scale_y_continuous(labels = scales::comma_format()) +
  ggtitle("Distribución de precio")


diamonds %>% 
  ggplot( aes( x = price)) + 
  geom_boxplot(color= "Blue", fill= "lightblue") +
  scale_x_continuous(labels = scales::dollar_format()) +
  scale_y_continuous(labels = scales::comma_format()) +
  ggtitle("Distribución de precio")

diamonds %>% 
  ggplot( aes( x = carat)) + 
  geom_boxplot(binwidth = .3, color= "purple", fill= "pink", alpha= 0.3) +
  scale_x_continuous(labels = scales::comma_format()) +
  ggtitle("Distribución de peso de los diamantes") +
  theme_bw() +
  coord_flip()

diamonds %>% 
  ggplot( aes( x = carat)) + 
  geom_histogram(binwidth = .03, color= "purple", fill= "pink", alpha= 0.3) +
  scale_y_continuous(labels = scales::comma_format()) +
  ggtitle("Distribución de peso de los diamantes") +
  theme_bw()


#### Variables nominales / categóricas

diamonds %>% 
  ggplot( aes( x = cut)) + 
  geom_bar( color= "darkblue", fill= "cyan", alpha= 0.7) +
  scale_y_continuous(labels = scales::comma_format()) +
  ggtitle("Distribución de calidad de corte") +
  theme_dark()


df_pie <- diamonds %>%
  group_by(cut) %>% 
  summarise(freq = n(), .groups='drop')


df_pie %>% 
  ggplot( aes( x = "", y=freq,  fill = factor(cut)))  +
  geom_bar(width = 1, stat = "identity")  +
  coord_polar(theta = "y", start=0)

ggplot(data = diamonds) +
  geom_bar( mapping = aes(x = cut, fill = cut), show.legend = T, width = 1) +
  theme(aspect.ratio = 1) +
  labs(x= NULL, y = NULL) +
  coord_polar() +
  theme_classic()


diamonds %>% 
  ggplot( aes( y = clarity)) + 
  geom_bar( color= "darkblue", fill= "black", alpha= 0.7) +
  geom_text(aes(label = scales::comma(..count..)), stat = "count", 
            vjust = 1, hjust = 1.1,colour = "white") +
  scale_x_continuous(labels = scales::comma_format()) +
  ggtitle("Distribución claridad") +
  theme_get()

diamonds %>% 
  ggplot( aes( y = clarity)) + 
  geom_bar( color= "darkblue", fill= "black", alpha= 0.7) +
  geom_text(aes(label = scales::percent(..count../sum(..count..) ) ), 
            stat = "count", vjust = -0.25, colour = "darkblue") +
  scale_x_continuous(labels = scales::comma_format()) +
  ggtitle("Distribución claridad") +
  coord_flip()


#### Análisis multivariado ####

diamonds %>% 
  ggplot(aes(y= price, x = cut, color = cut))  + 
  geom_jitter(size = 1.2, alpha = 0.5)

diamonds %>% 
  ggplot(aes(y = price, x = cut, color = cut))  + 
  geom_boxplot(size=1.2, alpha= 0.5)

diamonds %>% 
  ggplot(aes(x= price ,fill=cut))  + 
  geom_histogram(position = 'identity', alpha = 0.5)

diamonds %>% 
  ggplot(aes(x = price, fill = cut))  + 
  geom_histogram(position = 'identity', alpha = 0.5) +
  facet_wrap(~ cut, ncol = 1)

diamonds %>% 
  ggplot( aes(x = carat , y = price)) +
  geom_point(aes(col = clarity) ) +
  geom_smooth()

diamonds %>% 
  ggplot( aes(x = carat, y = price)) +
  geom_point(aes(col = clarity) ) +
  facet_wrap(~ clarity) +
  geom_smooth()

diamonds %>% 
  ggplot( aes(x = carat ,y=price)) +
  geom_point(aes(col = clarity) ) +
  geom_smooth(aes(color=clarity))

diamonds %>% 
  ggplot( aes(x = carat ,y=price)) +
  geom_point(aes(col = clarity), alpha = 0.15 ) +
  facet_wrap(~clarity)+
  geom_smooth(method = "lm")


#### Visualización interactiva ####

fun_mean <- function(x){
  
  mean <- data.frame(
    y = mean(x),
    label = mean(x, na.rm = T)
    )
  
  return(mean)
  }

means <- diamonds %>% 
  group_by(clarity) %>% 
  summarise(price = round(mean(price), 1))

plot <- diamonds %>% 
  ggplot(aes(x = clarity, y = price)) +
  geom_boxplot(aes(fill = clarity)) +
  stat_summary(
    fun = mean, 
    geom = "point", 
    colour = "darkred", 
    shape = 18,
    size = 2
    ) +
  geom_text(
    data = means, 
    aes(label = str_c("$", price), y = price + 600)
    ) +
  ggtitle("Precio vs Claridad de diamantes") +
  xlab("Claridad") +
  ylab("Precio")

plotly::ggplotly(plot)





























