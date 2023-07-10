# ==========================================================================
# modify styles.xml in word.docx
# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

file <- "templ_zcmu_thesis.docx"
st<- touch_docSt(file)

# xml.b <- xml <- readxml(st)
xml.b <- xml <- readxml("./styles_with_rchunk_with_table.xml")

hxml <- readxml("./officedown_style.xml")

all <- show_allName(xml)
toc <- all[grep("TOC|toc", all)]
heading <- all[grep("heading", all)]
char <- all[grep("Char", all)]
others <- all[ grep("Text|foot|caption", all, ignore.case = T) ]

xml <- xml.b
xml <- repl_xml.font(xml, "asc", "Times New Roman", name = "Normal")
xml <- repl_xml.font(xml, "eastAsiaTheme", "SimSun", name = "Normal", match.arg = F)
xml <- repl_xml.font(xml, "east", "SimSun", name = "Normal", insert_param = T)
xml <- repl_xml.font(xml, "east", "SimSun", name = toc, insert_ttag = .xmlFont, force = T)
xml <- repl_xml.font(xml, "east", "SimHei", name = heading)
xml <- repl_xml.font(xml, "east", "SimSun", name = heading[-(1:3)])
xml <- repl_xml.fontSz(xml, as = 12 * 2, name = all)
xml <- repl_xml.fontSz(xml, as = 10.5 * 2, name = "Normal")
xml <- repl_xml.fontSz(xml, as = 14 * 2, name = heading[1])
xml <- repl_xml.fontSz(xml, as = 10.5 * 2, name = c(others, "Definition"), force = T)
xml <- repl_xml.fontSz(xml, as = 12 * 2, name = toc, force = T)
xml <- repl_xml.fontSz(xml, as = 12 * 2, name = "TOC Heading", force = T)
xml <- repl_xml.fontSz(xml, as = 10.5 * 2, name = char)
xml <- repl_xml.fontSz(xml, as = 10.5 * 2, name = show_allTok(xml), force = T)
xml <- repl_xml.fontSz(xml, as = 10.5 * 2, name = "Compact", force = T)
xml <- repl_xml.fontSzCs(xml)
xml <- repl_xml.fontAlign(xml, as = "center", name = "caption")
xml <- repl_xml.fontSpace(xml, "before", as = "200", name = "caption")
xml <- repl_xml.fontSpace(xml, "after", as = "60", name = "caption")
xml <- repl_xml.fontSpace(xml, "line", as = "250", name = "caption")
xml <- repl_xml.fontSpace(xml, "lineRule", as = "auto", name = "caption")
xml <- repl_xml.fontAlign(xml, as = "center", name = "TOC Heading", force = T)
xml <- repl_xml.fontShd(xml)
xml <- repl_xml.fontShd(xml, name = "Source Code", target = "pPr")
xml <- reset_xml.fontCol(xml, name = "TOC Heading")
xml <- dele_xml.ital(xml, "caption")
xml <- insert_xml.tabs(xml, as = c("left", 0))

update_docSt(st, xml)
pack_docSt(st)
