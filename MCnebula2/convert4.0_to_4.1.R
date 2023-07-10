# ==========================================================================
# convert ref
# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

devtools::load_all('~/utils.tool/R')
library(MCnebula2)

omd <- revise_pan2md.vanco("./mcnebula_cutRef.md")
key <- extract_ref_pan2md.vanco(omd)

oref <- extract_ref("./mcnebula4.0_ac.md")

md <- omd
for (i in 1:length(key)) {
  md <- gsub(names(key)[i], comb_ref(key[[i]], oref), md, fixed = T)
}

writeLines(md, "tmp.md")
## cp tmp.md mcnebula4.1_ac.md


# ==========================================================================
# remove inst figure link
# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

## delete the doi
keys <- extract_ref("./mcnebula4.1_ac.md")
lst <- read_bib("../library.bib")
lst <- lst[names(lst) %in% keys]
lst <- lapply(lst,
  function(ch) {
    pos <- grepl("^\\s*doi =", ch)
    ch[ !pos ]
  })
writeLines(unlist(lst), "cut.bib")
n <- pandoc.docx("./mcnebula4.1_ac.md", deal_with = F, script = "pandoc_cutbib.sh")

n <- pandoc.docx("./legend3.4_NoSupp.md")
rmarkdown::render("./legend/legend_pdf.Rmd")
# pandoc.docx("./method_revise_ref.md", deal_with = F)

file.copy("./mcnebula4.1_ac.docx", "mcnebula.docx", T)
file.copy("./legend3.4_NoSupp.docx", "legend.docx", T)
file.copy("./legend/legend_pdf.pdf", "fts/supplementation.pdf", T)
files <- list.files("fts", "^fig.*pdf$|stab.*xlsx$|supple.*pdf$", full.names = T)

## update fig2
file.copy("~/tmp_backup/R/evaluation/compare_accuracy.pdf", "fts/fig2.compare_accuracy.pdf", T)
file.copy("~/tmp_backup/R/evaluation/compare_accuracy.pdf", "evaluation/compare_accuracy.pdf", T)

## update report
file.copy("~/tmp_backup/R/serum/temp_data/report.pdf", "others/report_serum.pdf", T)
file.copy("~/tmp_backup/R/eucommia/temp_data/report.pdf", "others/report_herbal.pdf", T)
file.copy("~/tmp_backup/R/evaluation/report.pdf", "others/report_evaluation.pdf", T)
file.copy("~/MCnebula2/reference.pdf", "others/reference_MCnebula2.pdf", T)

files2 <- list.files("others", "pdf$", full.names = T)

zip("mcnebula_0420.zip",
  c("./mcnebula.docx", "./legend.docx", "./tocg.pdf",
    # "./ac_reply.docx",
    files, files2))


