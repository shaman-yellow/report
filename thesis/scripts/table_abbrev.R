# ==========================================================================
# for English abbrevation in article
# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

md <- readLines("index.Rmd")
strs <- stringr::str_extract_all(md, "[A-Z]{2,}")
strs <- unique(unlist(strs))

as_code_list(strs)


