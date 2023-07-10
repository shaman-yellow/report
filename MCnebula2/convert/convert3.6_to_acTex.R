# ==========================================================================
# insert figures
# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

md <- readLines("./mcnebula3.6_ac.md")

ids <- c("data_stream", "compare_accuracy", "serum_tracer", "ac_node2", "hps", "mech")
figs <- paste0("fts/fig", 1:length(ids), ".", ids, ".pdf")
captions <- read_captions("legend/legend3.2.md")
captions <- captions[ 1:6 ]

md2 <- insert_figs(md, ids, figs, captions) 
md2 <- fix_ch2en(md2)
md2 <- gsub("μ", "$\\mu$", md2)
md2 <- gsub("β", "$\\beta$", md2)
md2 <- insert_tocg(md2, "tocg.pdf")
writeLines(md2, "mcnebula.md")
file.copy("mcnebula.md", "mcnebula3.7_ac.md")

asTex.rmd("mcnebula.md")
# file.copy("./supplementation.pdf", "./tex_mcnebula", T)
# file.copy(list.files("./fts/", "xlsx$", full.names = T), "./tex_mcnebula", T)

# ==========================================================================
# package all pdf of reference
# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

refs <- extract_ref("tex_mcnebula/mcnebula.Rmd")
bibs <- sep_list(readLines("tex_mcnebula/library.bib"))
keys <- getKey.biblst(bibs)
refFiles <- getFilePath.biblst(keys)

dir.create(allRef <- "allRef_pdf")
lapply(1:length(refs),
  function(n) {
    file <- refFiles[[ refs[n] ]]
    if (!is.null(file)) {
      file.copy(file, paste0(allRef, "/ref.", n, "__", get_filename(file)), T)
    }
  })

