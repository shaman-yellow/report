
formula <- latest(filter_formula(test1, dplyr::filter, .features_id == !!the_id))
formula <- select(formula, rank = rank.formula,
                  molecularFormula = mol.formula, adduct)

structure <- latest(filter_structure(test1, dplyr::filter, .features_id == !!the_id))

structure <- structure %>% 
  dplyr::mutate(molecularFormula = stringr::str_extract(.candidates_id, "^.*(?=_)")) %>% 
  merge(rename(select(formula, molecularFormula, rank), form.rank = 2),
        by = "molecularFormula", all.x = T) %>%
  dplyr::mutate(.candidates_id = paste0(form.rank, "_", .candidates_id)) %>%
  dplyr::filter(molecularFormula %in% head(formula, n = 5)[[ "molecularFormula" ]]) %>%
  dplyr::select(rank.structure, .candidates_id, inchikey2d) %>% 
  dplyr::rename(rank = 1, info = 2) %>% 
  data.frame() %>%
  split(., f = ~ info) %>% 
  lapply(dplyr::arrange, rank) %>% 
  lapply(head, n = 3) %>%
  data.table::rbindlist()

tbl <- table(structure[[ "info" ]])
keep <- names(tbl[ tbl ==3 ])

structure %>% 
  dplyr::filter(info %in% keep) %>% 
  dplyr::group_by(info) %>% 
  gt() %>% 
  gtsave("test.tex")


