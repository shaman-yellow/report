# ==========================================================================
# reprocessing the table in article
# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

tbl_subEval <- data.table::fread("~/outline/mc.test/subjective_evaluation/subEval.csv")
tbl_subEval <- kroup_row(tbl_subEval)
colnames(tbl_subEval) <- gsub("\\.", "-", colnames(tbl_subEval))
flex_subEval <- pretty_flex(
  tbl_subEval, "MCnebula和其他工具的功能比较",
  "以上*表示功能的齐全性或完善性，-表示不存在该功能",
  weight = c(Group = 2, Item = 2), width = 9
)

tbl_evalScript <- match_fun2(readLines("~/utils.tool/R/simulate_and_evaluate.R"))

# as_code_list(tbl_evalScript)
des <- c(
  msp_to_mgf = "用于将.msp格式光谱文件转化为SIRIUS需求的.mgf",
  formula_adduct_mass = "将分子式转化为各种加合离子类型，并计算Exact Mass",
  get_adduct_mass = "计算加合离子的Exact Mass",
  element_extract = "提取字符串分子式中的元素",
  formula_reshape_with_adduct = "字符串分子式转变为各种加合离子",
  collate_as_noise_pool = "提取为噪声峰的库",
  tol_mergeEx = "根据Mass容差合并表格",
  mass_shift = "根据正态分布随机偏移Mass",
  spectrum_add_noise = "在光谱（data.frame）中添加噪声",
  mgf_add_anno.gnps = "将.mgf格式化为GNPS服务器接受的.mgf格式",
  simulate_gnps_quant = "模拟量化数据",
  stat_classify = "统计归类结果",
  stat_identification = "统计鉴定结果",
  visualize_stat = "可视化统计结果",
  visualize_statComplex = "合并可视化三重数据集",
  visualize_comparison = "可视化比较结果",
  visualize_summary = "多个水平上总结并可视化",
  visualize_idRes = "可视化鉴定结果",
  ... = "..."
)
tbl_evalScript <- data.frame(Function = names(des), Description = unname(des))
flex_evalScript <- pretty_flex(
  tbl_evalScript, "评估MCnebula涉及的R函数", NULL,
  weight = c(Description = 2), form_body = F
)

