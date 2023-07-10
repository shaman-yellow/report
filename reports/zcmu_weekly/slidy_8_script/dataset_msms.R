
svg("mcnebula_results/dataset_msms.svg")
grid.newpage()
grid.rect(
  x = 0.3 + seq(0.1, 0.25, by = 0.02),
  y = 0.4 + seq(0.1, 0.25, by = 0.02),
  height = 0.5,
  width = 0.7,
  gp = gpar(fill = "white")
)
vp <- viewport(x = 0.52, y = 0.57, height = 0.6, width = 0.8)
pushViewport(vp)
test1 <- collate_data(test1, ".f2_msms")
data <- latest(test1, "project_dataset", ".f2_msms")
the_id <- "2095"
data <- dplyr::filter(data, .features_id == !!the_id)
p <- ggplot() +
  geom_segment(data = data,
      aes(x = mz, xend = mz, y = 0, yend = int.),
      color = "black",
      size = 0.8) +
  theme_minimal() +
  labs(x = "m/z", y = "intensity") +
  theme(text = element_text(family = "Times"),
        strip.text = element_text(size = 12),
        panel.grid = element_line(color = "grey85"),
        plot.background = element_rect(fill = "white", size = 0))
print(p, vp = vp)
dev.off()

