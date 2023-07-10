# ==========================================================================
# insert figures
# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

md <- readLines("./mcnebula3.5_ac.md")

ids <- c("data_stream", "compare_accuracy", "serum_tracer", "ac_node2", "hps", "mech")
figs <- paste0("fts/fig", 1:length(ids), ".", ids, ".pdf")
captions <- paste0("This is caption", 1:6)

md2 <- insert_figs(md, ids, figs, captions) 
md2 <- fix_ch2en(md2)
md2 <- gsub("μ", "$\\mu$", md2)
md2 <- gsub("β", "$\\beta$", md2)
writeLines(md2, "test.md")

pandoc.docx("test.md", ".pdf", deal_with = F, script = "pandoc_pdf.sh")

asTex.rmd("test.md")
