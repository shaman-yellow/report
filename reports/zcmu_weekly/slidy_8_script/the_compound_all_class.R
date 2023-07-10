
class <- latest(filter_ppcp(test1, pp.threshold = 0))

class <- dplyr::mutate(class, class.name = reorder(class.name, dplyr::desc(pp.value)))

class_2095 <- dplyr::filter(class, .features_id == !!the_id)
class_2095 <- dplyr::arrange(class_2095, class.name)

p <- ggplot(head(class_2095, n = 30)) +
  geom_col(aes(x = reorder(class.name, pp.value), y = pp.value, fill = pp.value)) +
  coord_flip() +
  labs(x = "classification", y = "posterior probability") +
  scale_fill_gradient(low = "#84D7E1FF", high = "#C71000FF") +
  theme_minimal() +
  theme(text = element_text(family = "Times", face = "bold"),
        legend.position = "none")

ggsave(p, filename = "2095_class_bar.svg")
system("cairosvg 2095_class_bar.svg -d 300 -o 2095_class_bar.png")

anno <- data.table::fread("canopus.tsv")
anno <- latest(test1, "project_dataset", ".canopus")

anno <- dplyr::mutate(anno, rel.index = as.character(rel.index))
anno1 <- dplyr::bind_rows(dplyr::slice(anno, 1:15),
                          c(rel.index = "...", class.name = "..."),
                          dplyr::slice(anno, (nrow(anno) - 13):nrow(anno))
                          )
anno1 <- dplyr::mutate(anno1,
                       label = stringr::str_trunc(class.name, 20, side = "right"))

p0 <- ggplot(dplyr::mutate(anno1, class.name = paste0(rel.index, "  ", class.name))) +
  geom_text(aes(x = "class", y = reorder(class.name, length(class.name):1), label = label),
            family = "Times", hjust = 1) +
  theme_void()

svg("2095_class_bar.svg")

library(grid)

grid.newpage()
pushViewport(viewport(layout = grid.layout(1, 100)))
print(p0, vp = viewport(layout.pos.row = 1, layout.pos.col = 1:50))
vp <- viewport(layout.pos.row = 1, layout.pos.col = 27:30)
grid.text("2509 classes", gp = gpar(fontfamily = "Times", fontsize = 14, col = "red"),
          vp = vp, rot = 90)
lapply(list(c(0.6, 0.9), c(0.4, 0.1)),
    function(y){
    grid.segments(0.5, y[1], 0.5, y[2],
        arrow = arrow(angle = 10, type = "closed"),
        gp = gpar(fill = "black"),
        vp = vp)
    })
print(p, vp = viewport(layout.pos.row = 1, layout.pos.col = 35:100))

dev.off()
system("cairosvg 2095_class_bar.svg -d 300 -o 2095_class_bar.png")

class <- dplyr::select(class, .features_id, class.name, pp.value)
class <- lapply(split(data.frame(class), ~.features_id),
    function(df){
      df <- dplyr::mutate(df, class.name = reorder(class.name, dplyr::desc(pp.value)))
      head(dplyr::arrange(df, class.name), n = 30)
    })
class <- data.table::rbindlist(class)

p <- ggplot(class) +
  geom_col(aes(x = reorder(class.name, pp.value), y = pp.value, fill = pp.value)) +
  coord_flip() +
  labs(x = "classification", y = "posterior probability") +
  scale_fill_gradient(low = "#84D7E1FF", high = "#C71000FF") +
  theme_minimal() +
  facet_wrap(~ .features_id, scales = "free") +
  theme(text = element_text(family = "Times", face = "bold"),
        axis.text = element_blank(),
        legend.position = "none")

ggsave("all_class_bar.svg")
system("cairosvg all_class_bar.svg -d 300 -o all_class_bar.png")

