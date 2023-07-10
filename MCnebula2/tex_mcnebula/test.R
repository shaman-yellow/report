
res <- 0
while (inherits(res, "try-error") | res == 0) {
  res <- rmarkdown::render("./mcnebula.Rmd")
}

utils::zip("mcnebula_Latex.zip", c(list.files(".", "fig.*pdf|\\.tex|tocg.pdf|\\.bib|\\.csl")))

