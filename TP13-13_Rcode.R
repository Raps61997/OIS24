# Installer les packages nécessaires
# install.packages(c("ggplot2", "viridis", "patchwork"))
# library(ggplot2)
# library(viridis)
# library(patchwork)

# Génération des données synthétiques
set.seed(123)
n <- 100
locations <- paste("Site", 1:n)
microplastic_concentration <- rnorm(n, mean = 50, sd = 20)
water_temperature <- rnorm(n, mean = 15, sd = 5)
ph_values <- rnorm(n, mean = 8, sd = 0.5)

data <- data.frame(
  Location = locations,
  Microplastic_Concentration = microplastic_concentration,
  Water_Temperature = water_temperature,
  pH = ph_values
)

# Création de la heatmap
heatmap_plot <- ggplot(data, aes(x = Water_Temperature, y = pH)) +
  geom_tile(aes(fill = Microplastic_Concentration), color = "white") +
  scale_fill_viridis(option = "C") +
  theme_minimal() +
  labs(
    title = "Heatmap: Concentration de Microplastiques",
    x = "Température de l'Eau (°C)",
    y = "pH",
    fill = "Microplastiques\n(particules/L)"
  )

# Création du nuage de points
scatter_plot <- ggplot(data, aes(x = Water_Temperature, y = Microplastic_Concentration, color = pH)) +
  geom_point(size = 3) +
  scale_color_viridis(option = "C") +
  theme_minimal() +
  labs(
    title = "Nuage de Points: Concentration de Microplastiques",
    x = "Température de l'Eau (°C)",
    y = "Concentration de Microplastiques (particules/L)",
    color = "pH"
  )

# Combinaison des graphiques
combined_plot <- heatmap_plot + scatter_plot + plot_layout(ncol = 1, heights = c(1, 1.5))

# Affichage de la visualisation combinée
print(combined_plot)
