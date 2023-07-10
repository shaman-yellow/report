
custom_render("./index.Rmd")
custom_render("./acknowledgements.Rmd")
custom_render("./review.Rmd")
custom_render("./myArt.Rmd")
# use wps to update fields

body <- officer::read_docx("./_temp_index.docx")
body <- officer::body_add_break(body)
body <- officer::body_add_docx(body, "./_temp_acknowledgements.docx")
body <- officer::body_add_break(body)
body <- officer::body_add_docx(body, "./_temp_review.docx")
print(body, target = "thesis.docx")
# use onlyoffice to merge the .xml in docx, and update fields


## For blind review
body <- officer::read_docx("./_temp_index.docx")
body <- officer::body_add_break(body)
body <- officer::body_add_docx(body, "./_temp_review.docx")
print(body, target = "thesis_blind.docx")
# use only office to convert this as pdf

## merge pdf
qpdf::pdf_combine(c("./cover_blind.pdf", "./thesis_blind.pdf"), "blind.pdf")

