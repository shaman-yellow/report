
class_in <- dplyr::filter(class, .features_id %in% c(2093, 2095, 2097),
                          pp.value <= 0.9)
class_in <- dplyr::mutate(class_in, .features_id = as.character(.features_id))
class_in <- dplyr::bind_rows(class_in,
                             data.frame(class.name = paste0("class", 1:3),
                                        pp.value = 0.5,
                                        .features_id = "Others"
                                        ))

y.arrow <- seq(-0.4, 0.4, length.out = 3)
df <- dplyr::filter(class_in, .features_id != "Others")
check_pal <- c(true = "#91D1C2FF", false = "#E64B35FF")
p1 <- ggplot(df) +
  geom_col(aes(x = class.name, y = pp.value,
               fill = ifelse(pp.value >= 0.5, "true", "false"),
               )) +
  geom_segment(data = dplyr::filter(df, !grepl("[0-9]", class.name), pp.value >= 0.5),
               aes(x = class.name, xend = class.name, y = 1, yend = 1.15),
               color = check_pal[["true"]],
               arrow = arrow(8, unit(0.1, "inches"), "last", "closed")) +
  geom_point(data = dplyr::filter(df, grepl("[0-9]", class.name) | pp.value < 0.5),
             aes(x = class.name, y = 1),
             shape = 4, color = check_pal[["false"]],
             ) +
  geom_text(data = dplyr::filter(df, grepl("[0-9]", class.name)),
            aes(x = class.name, y = -0.05, label = class.name),
            color = "red",
            family = "Times", hjust = 1, size = 2) +
  geom_text(data = dplyr::filter(df, !grepl("[0-9]", class.name)),
            aes(x = class.name, y = -0.05, label = class.name),
            color = "black",
            family = "Times", hjust = 1, size = 2) +
  geom_segment(data = dplyr::filter(class_in, .features_id == "Others"),
               aes(x = 5, xend = 1, y = y.arrow, yend = y.arrow),
               linetype = "dashed",
               arrow = arrow(10, unit(0.15, "inches"), "last", "closed")) +
  geom_hline(aes(yintercept = 0.5),
             linetype = "dashed", color = "red") +
  coord_flip() +
  ylim(c(-1.3,1.3)) +
  labs(x = "classification", y = "posterior probability") +
  scale_fill_manual(values = check_pal) +
  theme_minimal() +
  facet_grid(.features_id ~ ., scales = "free") +
  theme(text = element_text(family = "Times", face = "bold"),
        axis.text = element_blank(),
        legend.position = "none")

library(ggraph)
stardust <- filter(class, pp.value >= 0.5)
stardust <- split(data.frame(stardust), ~ as.character(class.name))

hierarchy <- hierarchy(test1) %>% 
  dplyr::select(hierarchy, class.name)

index <- as.list(hierarchy$hierarchy)
names(index) <- hierarchy$class.name
label_color <- colorRampPalette(c("#C6DBEFFF", "#3182BDFF", "red"))(10)

lst <- mapply(head(stardust, n = 10), names(stardust)[1:10],
    SIMPLIFY = F,
    FUN = function(df, name){
    edges <- data.frame(.features_id1 = df[1, ]$.features_id,
                           .features_id2 = df[1. ]$.features_id)
    graph <- igraph::graph_from_data_frame(edges, directed = T, vertices = df)
    graph <- tidygraph::as_tbl_graph(graph)
    layout_n <- create_layout(graph, layout = "kk")

    ggraph(layout_n) +
      geom_node_point(shape = 21, stroke = 0.2, fill = "#D9D9D9", size = 5) +
      theme_void() +
      ggtitle(stringr::str_wrap(name, width = 30)) +
      theme(text = element_text(family = "Times", face = "bold"),
            plot.title = ggtext::element_textbox(
              size = 10, color = "white",
              fill = label_color[ index[[name]] ],
              box.color = "white",
              halign = 0.5, linetype = 1, r = unit(5, "pt"), width = unit(1, "npc"),
              padding = margin(2, 0, 1, 0), margin = margin(3, 3, 3, 3))
      )
      })

## ring diagrame
text_gp <- gpar(color = "black", cex = 1, fontfamily = "Times", fontface = "bold",
                fontsize = 20)
p.ring <- ggplot(data.frame(x = 1, y = c(0.1, 0.9), group = c("true", "false"))) +
  geom_col(aes(x = x, y = y, fill = group)) +
  annotate("segment", x = 1.7, xend = 1.7, y = 0.01, yend = 0.08,
           arrow = arrow(angle = 10, type = "closed", length = unit(0.05, "npc"))) +
  annotate("segment", x = 1.6, xend = 1.8, y = 0, yend = 0) +
  annotate("segment", x = 1.6, xend = 1.8, y = 0.1, yend = 0.1) +
  scale_fill_manual(values = check_pal) +
  xlim(c(-1, 2)) +
  coord_polar(theta = "y") +
  theme_void() +
  theme(legend.position = "none")

## bar diagrame
p.bar <- ggplot(data.frame(x = 1, y = c(0.1, 0.9), group = c("false", "true"))) +
  geom_col(aes(x = x, y = y, fill = reorder(group, desc(y))), width = 0.5) +
  annotate("segment", x = 1.7, xend = 1.7, y = 0.12, yend = 0.98,
           arrow = arrow(angle = 10, type = "closed", length = unit(0.05, "npc"))) +
  annotate("segment", x = 1.6, xend = 1.8, y = 0.1, yend = 0.1) +
  scale_fill_manual(values = check_pal) +
  xlim(c(0, 2)) +
  theme_void() +
  theme(legend.position = "none")

## rect for sum
rect <- rectGrob(
  x = 0 + seq(0.1, 0.28, by = 0.02),
  y = 0 + seq(0.1, 0.28, by = 0.02),
  just = c("left", "bottom"),
  height = 0.7,
  width = 0.7,
  gp = gpar(fill = "white")
)
rect_vp <- viewport(0.3, 0.3, 0.65, 0.65, just = c("left", "bottom"))

## rect for few
few.rect <- rectGrob(
  x = 0 + seq(0.1, 0.2, by = 0.02),
  y = 0 + seq(0.1, 0.2, by = 0.02),
  just = c("left", "bottom"),
  height = 0.7,
  width = 0.7,
  gp = gpar(fill = "white")
)
few.rect_vp <- viewport(0.17, 0.17, 0.65, 0.65, just = c("left", "bottom"))

## peak simbolized for feature 
p.peak <- ggplot(data.frame(x = 1:20, y = dnorm(1:20, 10, 3)), aes(x = x, y = y)) +
  geom_line() +
  theme_minimal() +
  labs(x = "RT", y = "Intensity") +
  theme(text = element_blank())
p.peak.yellow <- p.peak + 
  geom_area(fill = "lightyellow") 
p.peak.grey <- p.peak +
  geom_area(fill = "#D9D9D9") 

## structure
struc_2095 <- structures_grob(child_nebulae(test1))[[ the_id ]]

## boxplot
set.seed(100)
simu_score <- data.frame(.features_id = 1:50, score = rnorm(50, 0.4, 0.15)) %>% 
  dplyr::mutate(group = ifelse(score >= 0.3, "true", "false"))
p.box <- ggplot(simu_score, aes(x = "structure", y = score)) +
  geom_boxplot() +
  geom_hline(yintercept = 0.3, linetype = "dashed", color = "red") +
  geom_jitter(width = 0.1, aes(color = group)) +
  labs(x = "", y = "score") +
  scale_fill_manual(values = check_pal) +
  theme_minimal() +
  theme(text = element_blank(),
        legend.position = "none")

## ratio bar plot
ratio <- table(simu_score$group) %>% 
  prop.table() %>%
  as.data.frame()
p.ratio <- ggplot(ratio, aes(x = 1, y = Freq, fill = reorder(Var1, desc(Freq)))) +
  ggchicklet::geom_chicklet(radius = unit(0.1, "npc")) +
  geom_hline(yintercept = 0.6, linetype = "dashed", color = "red") +
  scale_fill_manual(values = check_pal) +
  xlim(c(0, 2)) +
  theme_minimal() +
  theme(text = element_blank(),
        legend.position = "none")

## title
title_rect <- roundrectGrob(0.5, 0.4, 0.95, 0.95,
                           gp = gpar(fill = "#BC3C29FF"), r = unit(0.1, "npc"))

## ---------------------------------------------------------------------- 
svg("filter_ppcp.svg", width = 9, height = 8)
source("slidy_8_script/filter_ppcp.R")
dev.off()
system("cairosvg filter_ppcp.svg -d 300 -o filter_ppcp.png")
## ------------------------------------- 

