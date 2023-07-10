# ==========================================================================
# version 3.3
# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

path <- "/mnt/data/wizard/Documents/article/MCnebula2/"

lst <- pandoc.docx(paste0(path, "mcnebula3.3.md"), deal_with = F)

# ==========================================================================
# version 3.4
# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

path <- "/mnt/data/wizard/Documents/article/MCnebula2/"

lst <- pandoc.docx(paste0(path, "mcnebula3.4_decRef.md"), deal_with = F)
pandoc.docx(paste0(path, "./figure_captions.md"))

## convert figure as tiff
fig <- list.files("fts", "^fig*")

tiffs <- lapply(
  paste0("fts/", fig), 
  function(file) {
    dpi <- if (grepl("mech", file)) 300 else 150
    pdftools::pdf_convert(file, format = "tiff", dpi = dpi)
  }
)

dir.create("fts/tiff")
lapply(tiffs,
  function(tiff) {
    file.rename(tiff, paste0("fts/tiff/", gsub("_1.tiff", ".tiff", tiff)))
  })


## for gather pdf
path <- "/mnt/data/wizard/Documents/article/MCnebula2/"
rmarkdown::render(paste0(path, "legend_pdf.Rmd"))

rmarkdown::render(paste0(path, "legend_pdf.Rmd"), output_file = paste0(path, "legend_pdf.tex"))
