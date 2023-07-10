pandoc.docx("/mnt/data/wizard/Documents/article/MCnebula2/mcnebula3.md")
pandoc.docx("/mnt/data/wizard/Documents/article/MCnebula2/legend3.md")

path <- "/mnt/data/wizard/Documents/article/MCnebula2/"
lst <- pandoc.docx(paste0(path, "mcnebula3.1.md"))
pandoc.docx(paste0(path, "legend3.1.md"))

names(cite_extract(lst[[1]]))
# [1] "data_stream"  "serum_tracer" "serum_logFC"  "ac_node"      "hps"          "mech"        
fig.from_to <- list(
  c("data_stream.pdf", "data_stream.pdf"),
  c("serum/tracer_child_nebula.pdf", "serum_tracer.pdf"),
  c("serum/logFC_child_nebula.pdf", "serum_logFC.pdf"),
  c("serum/fig.ac_node.pdf", "ac_node.pdf"),
  c("serum/hps.pdf", "hps.pdf"),
  c("figure_mech.pdf", "mech.pdf")
)
fts_copy(fig.from_to, cite_extract(lst[[1]]), path)

names(cite_extract(lst[[2]]))
#  [1] "mcnebula_classify" "gnps_classify"     "compare_accuracy"  "serum_parent"     
#  [5] "serum_child"       "lpc_ba"            "pathway"           "herbal_tracer"    
#  [9] "msms"              "eic"               "complex"          
sfig.from_to <- list(
  c("evaluation/gather_classified_accuracy.pdf", "mcnebula_classify.pdf"),
  c("evaluation/gather_classified_accuracy_Molnet.pdf", "gnps_classify.pdf"),
  c("evaluation/compare_accuracy.pdf", "compare_accuracy.pdf"),
  c("serum/parent_nebula.png", "serum_parent.png"),
  c("serum/child_nebula.pdf", "serum_child.pdf"),
  c("serum/fig.lpc_ba.pdf", "lpc_ba.pdf"),
  c("serum/pathway.pdf", "pathway.pdf"),
  c("herbal/tracer_child_nebula.pdf", "herbal_tracer.pdf"),
  c("herbal/msms_tops_identified.pdf", "msms.pdf"),
  c("herbal/eic_tops_identified.pdf", "eic.pdf"),
  c("herbal/complex.pdf", "complex.pdf")
)
fts_copy(sfig.from_to, cite_extract(lst[[2]]), path, "sfig")

names(cite_extract(lst[[3]]))
# [1] "serum_compounds"  "serum_otops"      "herbal_compounds"
stab.from_to <- list(
  c("serum/compounds_format.tsv", "serum_compounds.tsv"),
  c("serum/oTop50_compounds_format.tsv", "serum_otops.tsv"),
  c("herbal/compounds_format.tsv", "herbal_compounds.tsv")
)
fts_copy(stab.from_to, cite_extract(lst[[3]]), path, "stab")


