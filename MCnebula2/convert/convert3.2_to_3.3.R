
# from "./mcnebula20230225.docx" to "lu_test.md"
omd <- revise_pan2md.vanco("./lu_test.md")
key <- extract_ref_pan2md.vanco(omd)

oref <- extract_ref("./mcnebula3.2.md")

md <- omd
for (i in 1:length(key)) {
  md <- gsub(names(key)[i], comb_ref(key[[i]], oref), md, fixed = T)
}

ref_line <- grep("\\*\\*Reference", md)
md <- md[1:(ref_line - 1)]

writeLines(md, "tmp.md")

