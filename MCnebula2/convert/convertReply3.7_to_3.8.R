# ==========================================================================
# reply comments
# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

devtools::load_all('~/utils.tool/R')
library(MCnebula2)

report <- as_report.rough(readLines("./ac_comment_reply.Rmd"))
write_thesisDocx(report, file <- "ac_reply.Rmd", "Reply to reviewers")

rmarkdown::render(file)

# ==========================================================================
# remove inst figure link
# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

md <- rm.instFig(readLines("./mcnebula3.7_ac.md"))
writeLines(md, "./mcnebula3.8_ac.md")

pandoc.docx("./mcnebula3.8_ac.md", hasLink = F)
pandoc.docx("./legend3.4_NoSupp.md")
# pandoc.docx("./method_revise_ref.md", deal_with = F)

file.copy("./mcnebula3.8_ac.docx", "mcnebula.docx", T)
file.copy("./legend3.4_NoSupp.docx", "legend.docx", T)
file.copy("./supplementation.pdf", "fts/supplementation.pdf", T)
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

zip("mcnebula_0415.zip",
  c("./mcnebula.docx", "./legend.docx", "./tocg.pdf",
    "./ac_reply.docx", files, files2))


