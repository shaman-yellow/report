
class <- latest(filter_ppcp(test, dplyr::filter, .features_id == !!the_id,
                            by_reference = F))

common <- unique(dplyr::filter(class, pp.value >= 0.5 & pp.value < 0.9)[[ "class.name" ]])
common <- common[ !grepl("[0-9]", common) ]

## long data
class <- dplyr::filter(class, class.name %in% common) %>% 
  dplyr::mutate(candidates = stringr::str_extract(.candidates_id, "^.*(?=_)"))

p <- ggplot(class, aes(x = candidates, y = class.name)) +
      geom_tile(aes(fill = pp.value), color = "white", height = 1, width = 1, size = 0.2) +
      theme_minimal() +
      scale_fill_gradient2(low = "#3182BDFF", high = "#A73030FF") +
      labs(x = "candidates", y = "class", fill = "posterior probability") +
      theme(text = element_text(family = "Times", face = "bold", size = 3),
            axis.text = element_text(face = "plain"),
            axis.text.x = element_blank()
      )
## wide data
df <- dplyr::select(class, candidates, class.name, pp.value) %>% 
  tidyr::spread(candidates, pp.value) %>% 
  data.frame()
rownames(df) <- df[[ "class.name" ]]
df <- dplyr::select(df, -class.name)

devtools::load_all("~/utils.tool")
p1 <- add_tree.heatmap(df, p = p)

svg("mcnebula_results/2095_class.svg")
print(p1)
dev.off()
system("cairosvg mcnebula_results/2095_class.svg -d 300 -o mcnebula_results/2095_class.png")


