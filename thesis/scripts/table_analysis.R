# ==========================================================================
# for serum dataset and herbal dataset
# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

fun_form <- function(df) {
  df <- dplyr::filter(df, `Q-value` < .05)
  df <- dplyr::mutate(
    df, `Sig. (Q-value)` = ifelse(`Q-value` >= .01, "*",
      ifelse(`Q-value` >= 0.001, "**", "***")),
    `log2(FC)` = round(`log2(FC)`, 1),
    Variation = ifelse(`log2(FC)` >= 0, "↑", "↓"),
    Variation = ifelse(abs(`log2(FC)`) > 1, paste0(Variation, Variation), Variation),
    Synonym = ifelse(nchar(Synonym) > 30, "...", Synonym),
    Class = ifelse(is.na(Class), "-", Class),
    ID = as.character(ID)
  )
  df <- dplyr::select(df, -`P-value`, -`Q-value`, -`log2(FC)`)
  dplyr::rename(df, `ClassyFire Class` = Class, Var. = Variation, TS = `Tanimoto similarity`,
    Sig. = `Sig. (Q-value)`, Err. = `Mass error (ppm)`)
}
analysisFoot <- c(
  "Synonym： 化合物或其立体异构的别名或IUPAC名。'...'表示因其名称过长而被省略。",
  "ID： MCnebula分析中'Features'的唯一ID编号。",
  "Err.： Mass Error (ppm)，前体离子分子量和理论分子量的偏差。",
  "RT： Retention time，保留时间。",
  "Formula： Molecular Formula。",
  "TS： Tanimoto similarity。",
  "InChIKey planar：InChIKey的首个哈希块代码，代表分子骨架。",
  "ClassyFire Class：ClassyFire分类系统中的该化合物的归类，- 表示该化合物在ClassyFire Web中未查询到。",
  "Sig.：Q-value（HM vs HS，P-value的FDR矫正）代表的显著性，*** 表示Q-value < 0.001，** 表示Q-value < 0.01，* 表示Q-value < 0.05。",
  "Var.：Log2(Fold Change)（HM / HS）代表的变化水平，↓↓ 或 ↑↑ 代表|log2(FC)| > 1，↓ 或 ↑ 代表|log2(FC)| > 0.3。"
)
analysisWeight <- c(`InChIKey planar` = 1.2, `ClassyFire Class` = 1.5, Synonym = 1.7,
  Sig. = .5, Var. = .5, TS = .5, Formula = 1.2, Err. = .5, `RT (min)` = .6, ID = .5
)

tbl_serumSum <- data.table::fread(
  "/mnt/data/wizard/Documents/article/MCnebula2/serum/compounds_format.tsv"
)
tbl_serumSum <- fun_form(tbl_serumSum)
flex_serumSum <- pretty_flex(
  tbl_serumSum, "MCnebula工作流程鉴定的血清数据集的化合物（Q-value < 0.05）",
  analysisFoot, weight = analysisWeight, width = 10, form_body = F
)

fun_form2 <- function(df) {
  df <- dplyr::mutate(
    df, ID = as.character(ID),
    Synonym = ifelse(Synonym == "null", "-", Synonym),
    `# Original ID` = as.character(`# Original ID`)
  )
  df <- dplyr::mutate_all(df, function(x) ifelse(is.na(x), "-", x))
  dplyr::rename(df, TS = `Tanimoto similarity`,
    `# MWU_Rank` = `# MW_Rank`,
    Err. = `Mass error (ppm)`)
}
analysisFoot2 <- c(
  "# Original ID: Wozniak等人的研究中'Features'的唯一ID编号。",
  "# EFS Rank 和 # MWU Rank：Wozniak等人的研究中对'Features'排序的两种算法。",
  "# Spectral Library Match：Wozniak等人的研究中以光谱匹配的方式得到的化合物结果。",
  "Synonym： 化合物或其立体异构的别名或IUPAC名。'...'表示因其名称过长而被省略。",
  "ID： MCnebula分析中'Features'的唯一ID编号。",
  "Err.： Mass Error (ppm)，前体离子分子量和理论分子量的偏差。",
  "RT： Retention time，保留时间。",
  "Formula： Molecular Formula。",
  "TS： Tanimoto similarity。",
  "InChIKey planar：InChIKey的首个哈希块代码，代表分子骨架。"
)
analysisWeight2 <- c(
  `# Original ID` = .7, `# EFS_Rank` = .6, `# MWU_Rank` = .6,
  `InChIKey planar` = 1.2, Synonym = 1.7,
  TS = .5, Formula = 1.2, Err. = .5, `RT (min)` = .6, ID = .5
)

tbl_serumOtop <- data.table::fread(
  "/mnt/data/wizard/Documents/article/MCnebula2/serum/oTop50_compounds_format.tsv"
)
tbl_serumOtop <- fun_form2(tbl_serumOtop)
flex_serumOtop <- pretty_flex(
  tbl_serumOtop, "MCnebula重新分析血清数据集Wozniak等人的Top Metabolites",
  analysisFoot2, weight = analysisWeight2, form_body = F, width = 10
)

tbl_herbalSum <- data.table::fread(
  "/mnt/data/wizard/Documents/article/MCnebula2/herbal/compounds_format.tsv"
)
tbl_herbalSum <- fun_form(tbl_herbalSum)
analysisFoot3 <- sub("HM vs HS", "Pro vs Raw", analysisFoot)
flex_herbalSum <- pretty_flex(
  tbl_herbalSum, "MCnebula工作流鉴定的中药数据集的化合物（Q-value < 0.05）", analysisFoot3,
  weight = analysisWeight, form_body = F, width = 10
)
