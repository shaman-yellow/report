
# from "./mcnebula_scibu_layout.docx" to "layout_test.md"
omd <- revise_pan2md.vanco("./layout_test.md")
key <- extract_ref_pan2md.sci_bull(omd)

oref <- extract_ref("./mcnebula3.3.md")

md <- omd
for (i in 1:length(key)) {
  md <- gsub(names(key)[i], comb_ref(key[[i]], oref), md, fixed = T)
}

ref_line <- grep("Reference", md)
md <- md[1:(ref_line - 1)]

writeLines(md, "tmp.md")

# manual revise via vim
# section heading level
# section Data and code...: add link; level
# section Name: discussion
# section order

# ==========================================================================
# Decrease reference
# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

file <- "./mcnebula3.4_decRef.md"
md <- readLines(file)

oref <- extract_ref("./mcnebula3.4_decRef.md")
length(oref)
