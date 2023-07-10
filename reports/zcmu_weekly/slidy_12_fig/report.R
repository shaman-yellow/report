pdf <- "./report.pdf"
dir.create("report")
pdftools::pdf_convert(pdf, filenames = paste0("report/report", 1:9, ".png"))
pngs <- list.files("report", full.names = T)
pngs <- sapply(pngs, png::readPNG, simplify = F)

devtools::load_all("~/utils.tool")
pngs <- lapply(pngs, rasterGrob)

grobs <- lapply(split(1:9, rep(1:3, each = 3)),
                function(ns) {
                  pngs <- pngs[ns]
                  names(pngs) <- n(n, 3)
                  frame_col(c(n1 = 1, n2 = 1, n3 = 1), pngs)
                })
names(grobs) <- n(n, 3)
grobs <- frame_row(c(n1 = 1, n2 = 1, n3 = 1), grobs)

pdf("grid_report.pdf", 5, 6)
grid.draw(grobs)
dev.off()

