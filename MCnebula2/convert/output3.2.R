
path <- "/mnt/data/wizard/Documents/article/MCnebula2/"
lst <- pandoc.docx(paste0(path, "mcnebula3.2.md"))
pandoc.docx(paste0(path, "legend3.2.md"))

names(cite_extract(lst[[1]]))
# [1] "data_stream"      "compare_accuracy" "serum_tracer" "ac_node2" "hps"             
# [6] "mech"            
fig.from_to <- list(
  c("data_stream.pdf", "data_stream.pdf"),
  c("evaluation/compare_accuracy.pdf", "compare_accuracy.pdf"),
  c("serum/tracer_child_nebula.pdf", "serum_tracer.pdf"),
  c("serum/fig.ac_node2.pdf", "ac_node2.pdf"),
  c("serum/hps.pdf", "hps.pdf"),
  c("figure_mech.pdf", "mech.pdf")
)
fts_copy(fig.from_to, cite_extract(lst[[1]]), path)

names(cite_extract(lst[[3]]))
# [1] "serum_parent"  "serum_child"   "serum_logFC"   "lpc_ba"        "pathway"
# "herbal_tracer"
# [7] "msms"          "eic"           "complex"      
sfig.from_to <- list(
  c("serum/parent_nebula.png", "serum_parent.png"),
  c("serum/child_nebula.pdf", "serum_child.pdf"),
  c("serum/logFC_child_nebula.pdf", "serum_logFC.pdf"),
  c("serum/fig.lpc_ba.pdf", "lpc_ba.pdf"),
  c("serum/pathway.pdf", "pathway.pdf"),
  c("herbal/tracer_child_nebula.pdf", "herbal_tracer.pdf"),
  c("herbal/msms_tops_identified.pdf", "msms.pdf"),
  c("herbal/eic_tops_identified.pdf", "eic.pdf"),
  c("herbal/complex.pdf", "complex.pdf")
)
fts_copy(sfig.from_to, cite_extract(lst[[3]]), path, "sfig")

names(cite_extract(lst[[2]]))
# [1] "subEval"          "serum_compounds"  "serum_otops"      "herbal_compounds"
stab.from_to <- list(
  c("evaluation/subEval.csv", "subEval.csv"),
  c("serum/compounds_format.tsv", "serum_compounds.tsv"),
  c("serum/oTop50_compounds_format.tsv", "serum_otops.tsv"),
  c("herbal/compounds_format.tsv", "herbal_compounds.tsv")
)
fts_copy(stab.from_to, cite_extract(lst[[2]]), path, "stab")

tabs <- list.files(paste0(path, "/fts"), "stab.*sv", full.names = T)
caption <- c(
  "Table 1: Functional evaluation of popular public tools of analysis of LC-MS/MS",
  "Table 2: Identified compounds of serum dataset with MCnebula workflow",
  "Table 3: Original top metabolites of serum dataset re-analysis with MCnebula",
  "Table 4: Identified compounds of herbal dataset with MCnebula workflow"
)
names(caption) <- tabs
lapply(tabs,
  function(tab) {
    df <- data.table::fread(tab)
    cols <- colnames(df)
    colnames(df) <- gsub("Class", "ClassiFire_Class", cols)
    file <- gsub(".sv$", "xlsx", tab)
    wb <- xl_table(df, title = caption[[ tab ]])
    xl_save(wb, file)
    writeLines(tab)
  })

lapply(tabs, file.remove)

# ==========================================================================
# test
# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -


