
library(ggalluvial)

allu. <- latest(filter_structure(test1, dplyr::filter, .features_id == !!the_id)) %>% 
  dplyr::select(1, 2, rank.structure, csi.score) %>% 
  dplyr::mutate(molecularFormula = stringr::str_extract(.candidates_id, "^.*(?=_)")) %>% 
  merge(rename(select(formula, molecularFormula, rank), form.rank = 2),
        by = "molecularFormula", all.x = T) %>% 
  dplyr::filter(form.rank <= 5) %>% 
  dplyr::arrange(desc(csi.score)) %>%
  dplyr::mutate(., molecularFormula = paste0(form.rank, "_", molecularFormula),
                class_set = paste0(molecularFormula, "_ppcp"),
                struc.level = rownames(.),
                struc.level = reorder(struc.level, as.integer(struc.level)))

p <- ggplot(allu., aes(axis1 = molecularFormula,
                       axis2 = struc.level,
                       axis3 = class_set,
                       y = 1)) +
     geom_stratum() +
     geom_alluvium(aes(fill = molecularFormula)) +
     geom_text(stat = "stratum", aes(label = after_stat(stratum))) +
     ggsci::scale_fill_simpsons() +
     theme_minimal() +
     labs(x = "", y = "") +
     theme(text = element_text(family = "Times", face = "bold"),
           axis.text = element_blank(),
           legend.position = "none")

svg("alluvium.svg")
print(p)
dev.off()
system("cairosvg alluvium.svg -d 300 -o alluvium.png")


