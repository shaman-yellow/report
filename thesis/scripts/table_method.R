# ==========================================================================
# method
# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

tblm_data <- c(
  "methods-initialize_mcnebula.R",
  "extraMethods-collate_data.R",
  "methods-filter_formula.R",
  "methods-filter_ppcp.R",
  "methods-filter_structure.R",
  "methods-create_reference.R",
  "methods-create_hierarchy.R",
  "methods-create_features_annotation.R",
  "methods-create_stardust_classes.R",
  "methods-cross_filter_stardust.R",
  "methods-backtrack_stardust.R",
  "methods-create_nebula_index.R",
  "extraMethods-binary_comparison.R"
)
fun1 <- function(x) {
  var <- gsub("^.*-|\\.R$", "", x)
  as_code_list(var)
}

# fun(tblm_data)
des <- c(
  initialize_mcnebula = "初始化分析的方法",
  collate_data = "从SIRIUS项目中获取数据的方法",
  filter_formula = "过滤化学分子式候选项的方法",
  filter_ppcp = "初步过滤化学类后验概率数据集的方法",
  filter_structure = "过滤化学结构式候选项的方法",
  create_reference = "明确唯一化学分子式候选项从而承前启后的方法",
  create_hierarchy = "创建化学类的阶层的方法",
  create_features_annotation = "合并注释并形成注释数据表格的方法",
  create_stardust_classes = "创建'Stardust classes'化学类数据的方法",
  cross_filter_stardust = "过滤'Stardust classes'数据集的方法",
  backtrack_stardust = "回溯'cross_filter_stardust'过滤掉的化学类的方法",
  create_nebula_index = "根据'Stardust classes'创建'Nebula-Index'数据集的方法",
  binary_comparison = "进行统计分析的方法"
)
tblm_data <- data.frame(Method = names(des), Description = unname(des))
flex_method <- pretty_flex(
  tblm_data, "MCnebula主要的数据方法", NULL,
  form_body = F, weight = c(Description = 2)
)

tblm_vis <- c( 
  "methods-create_parent_nebula.R",
  "methods-create_child_nebulae.R",
  "methods-create_parent_layout.R",
  "methods-create_child_layouts.R",
  "methods-activate_nebulae.R",
  "extraMethods-draw_nodes.R",
  "extraMethods-draw_structures.R",
  "methods-annotate_nebula.R",
  "methods-compute_spectral_similarity.R",
  "methods-visualize.R"
)

# fun1(tblm_vis)
des <- c(
  create_parent_nebula = "创建Parent-Nebula初始网络型数据的方法（'igraph'对象）",
  create_child_nebulae = "创建Child-Nebulae初始网络型数据的方法（'igraph'对象的list）",
  create_parent_layout = "创建Parent-Nebula可视化样式的方法",
  create_child_layouts = "创建Child-Nebulae可视化样式的方法（包括网络排布和画板布局）",
  activate_nebulae = "为Parent-Nebula和Child-Nebulae创建用于可视化的'ggset'对象",
  annotate_nebula = "绘制深入注释Child-Nebula的方法",
  draw_nodes = "绘制深入注释的'feature'的Nodes的方法",
  draw_structures = "绘制化学结构式的方法",
  compute_spectral_similarity = "计算光谱相似性的方法（脱胎于'MSnbase::compareSpectra'）",
  visualize = "最终输出绘图的方法（Parent-Nebula或者单个Child-Nebula）",
  visualize_all = "最终输出绘图的方法（整体Child-Nebulae）"
)
tblm_vis <- data.frame(Method = names(des), Description = unname(des))
flex_visMethod <- pretty_flex(
  tblm_vis, "MCnebula主要的可视化方法", NULL,
  form_body = F, weight = c(Description = 2)
)

scripts <- c(
  "extraMethods-report.R",
  "extraMethods-workflow.R",
  "functions-plot_msms_mirrors.R",
  "functions-report.R",
  "project.sirius.v4.R",
  "project.sirius.v5.R",
  "tools-colors.R",
  "tools-default_visualize.R",
  "tools-export.R",
  "tools-methods.R",
  "tools-modify_ggset.R",
  "tools-MSnbase-MODIFIED_compareSpectra.R",
  "tools-report.R",
  "tools-yaml.R",
  "class-VIRTUAL_slots.R",
  "functions-clear.R"
)
tblm_other <- lapply(scripts,
  function(script) {
    txt <- readLines(paste0("~/MCnebula2/R/", script))
    Function <- match_fun2(txt)
    Method <- match_method2(txt)
    as_df.lst(namel(Function, Method))
  })
names(tblm_other) <- gsub("^.*-|\\.R$", "", scripts)
tblm_other <- data.table::rbindlist(tblm_other, idcol = T)
tblm_other <- data.frame(dplyr::rename(tblm_other, group = .id))
tblm_other <- dplyr::mutate(
  tblm_other, group = gsub("sirius\\.v[0-9]", "*", group)
)
tblm_other <- dplyr::distinct(tblm_other, group, type, .keep_all = T)

# as_code_list(tblm_other$name)
des <- c(
  rblock = "",
  include_figure = "",
  .workflow_gather = "...",
  workflow = "",
  plot_msms_mirrors = "",
  .validate_sirius.v4 = ".validate_*, .get_*, ...",
  .get_color_set = ".get_color_*, ...",
  .command_parent_edge = ".command_*, ...",
  .get_export_name = ".get_*, ...",
  .rank_by_csi.score = ".rank_*, ...",
  modify_default_child = "modify_*, ...",
  bin_Spectra = "compareSpectra, bin_Spectra, ...",
  mz = "mz, intensity, ...",
  .yaml_default = ".yaml_*, ...",
  dataset = "*_dataset, *_layers, ...",
  clear_dataset = ""
)
tblm_other <- dplyr::mutate(
  tblm_other, .name = !!des, group = form(group),
  name = ifelse(.name == "", paste0(name, ", ..."), .name)
)
tblm_other <- dplyr::select(tblm_other, -.name)

# as_code_list(tblm_other$name)
des <- c(
  "rblock, ..." = "将代码存储为'code_block'对象",
  "include_figure, ..." = "将图片展示在报告文档中",
  "..." = "...",
  "workflow, ..." = "执行或打印MCnebula基本工作流的代码",
  "plot_msms_mirrors, ..." = "绘制MS/MS镜像图",
  ".validate_*, .get_*, ..." = "与对应版本相关的SIRIUS项目的API函数",
  ".get_color_*, ..." = "获取哈希颜色码，主要为包'ggsci'中的配色",
  ".command_*, ..." = "包装好的'ggplot2'的代码和参数，'command'对象，用于默认的可视化",
  ".get_*, ..." = "用于获取正式输出名称的函数",
  ".rank_*, ..." = "用于排序的函数",
  "modify_*, ..." = "用于后修改'ggset'对象的一系列函数，高度定制（规范）Child-Nebulae的可视化",
  "compareSpectra, bin_Spectra, ..." = "剥离于包'MSnbase'的函数或者方法，仅计算光谱相似性（'dotproduct'），速度更快",
  "mz, intensity, ..." = "'lightspectrum'的getter或者setter方法（'lightspectrum'比'MSnbase'的'spectrum'更轻巧）",
  ".yaml_*, ..." = "用于设定报告输出的函数",
  "*_dataset, *_layers, ..." = "虚类带有的方法，用于便捷操作对象",
  "clear_dataset, ..." = "用于清除'mcnebula'对象的不再用到的数据的函数"
)
tblm_other$Description <- unname(des)
flex_otherMF <- pretty_flex(
  rbind(kroup_row(tblm_other, 'group'), rep("...", 4)),
  "MCnebula的其他方法或函数",
  "Name或Group中的*表示省略一系列类似名称的方法或函数",
  weight = c(Description = 2), form_body = F
)

tblm_cusVis <- match_fun2(readLines("~/MCnebula2/R/tools-modify_ggset.R"))

# as_code_list(tblm_cusVis)
des <- c(
  modify_default_child = "用于'visualize_all()的函数，相当于'modify_rm_legend' + 'modify_set_labs' + 'modify_unify_scale_limits'。此外，如果使用了'set_nodes_color'方法，并'use_tracer'参数为'True'，'modify_tracer_node'和'modify_color_edge'会自动执行。",
  modify_stat_child = "调整'Child-Nebulae'样式，使其适合以节点颜色映射连续性变量",
  rev.modify_stat_child = "仅用于内部执行的逆转'modify_stat_child'的函数",
  modify_set_labs_and_unify_scale_limits = "相当于'modify_set_labs' + 'modify_unify_scale_limits'",
  modify_annotate_child = "用于细节调整深入注释的Child-Nebula的函数",
  modify_rm_legend = "移除图例的函数",
  modify_tracer_node = "将Child-Nebulae用于追踪模式的函数'",
  modify_color_edge = "调整节点的边缘颜色",
  modify_set_margin = "调整边距",
  modify_unify_scale_limits = "为所有Child-Nebulae统一属性映射的比例尺，使其结果科学规范",
  modify_set_labs_xy = "调整x、y轴的标签，仅用于'plot_msms_mirrors'",
  modify_set_labs = "调整Child-Nebulae图例的标签，使其与设定的'export_name'一致",
  ... = "..."
)
tblm_cusVis <- data.frame(Function = names(des), Description = unname(des))
flex_cusVis <- pretty_flex(
  tblm_cusVis, 'MCnebula辅助科学绘图的函数', NULL,
  weight = c(Description = 2), form_body = F
)

# tblm_devMeta <- lapply(list.files("~/exMCnebula2/R", ".R$"), writeLines)

tblm_devDisc <- c("query_inchikey.R",
  "query_classification.R",
  "query_synonyms.R",
  "query_others.R",
  "pick_annotation.R",
  "output_identification.R",
  "plot_EIC_stack.R")
fun <- function(x) match_fun2(readLines(paste0("~/exMCnebula2/R/", x)))
fun2 <- function(scripts) {
  lst <- lapply(scripts, fun)
  names(lst) <- gsub("\\.R$", "", scripts)
  lst
}
tblm_devDisc <- fun2(tblm_devDisc)
tblm_devDisc <- as_df.lst(tblm_devDisc)
# as_code_list(tblm_devDisc$name)
des <- c(
  query_inchikey = "",
  pubchem_get_inchikey = "",
  query_classification = "",
  classyfire_get_classification = "",
  .get_classification = "1",
  query_synonyms = "",
  pubchem_get_synonyms = "",
  grouping_vec2list = "1",
  extract_rdata_list = "1",
  packing_as_rdata_list = "1",
  query_iupac = "",
  pick_class = "",
  .filter_pick.class = "",
  PickClass = "",
  pick_synonym = "",
  .filter_pick.general = "",
  PickGeneral = "1",
  rename_table = "",
  format_table = "",
  .filter_format = ".*_format",
  .arrange_format = "1",
  .distinct_format = "1",
  .mutate_format = "1",
  .select_format = "1",
  .export_name = "1",
  plot_EIC_stack = "",
  bioc.par = "1"
)
fun3 <- function(df, des) {
  df <- dplyr::mutate(df, Description = !!des)
  df <- dplyr::filter(df, Description != "1")
}
tblm_devDisc <- fun3(tblm_devDisc, des)

# as_code_list(tblm_devDisc$name)
des <- c(
  query_inchikey = "批量多线程模式，通过PubChem API使用InChIKey2D（InChIKey的第一个哈希块）查询所有的InChIKey",
  pubchem_get_inchikey = "同上，查询单个InChIKey",
  query_classification = "批量多线程模式，通过ClassyFire在R的API使用InChIKey查询所有的化学分类系统",
  classyfire_get_classification = "同上，查询单个InChIKey",
  query_synonyms = "批量多线程模式，通过PubChem API使用InChIKey查询所有可得的化合物同义名",
  pubchem_get_synonyms = "同上，查询单个InChIKey",
  query_iupac = "批量多线程模式，通过PubChem API使用InChIKey查询所有可得的化合物IUPAC名",
  pick_class = "从'query_classification'获得的数据选取唯一结果",
  .filter_pick.class = "'pick_class'预设的选取方法",
  PickClass = "与'pick_class'相关",
  pick_synonym = "从'query_synonyms'获取的数据中选取同义名（根据正则匹配的先后顺序）",
  .filter_pick.general = "'query_synonyms'预设的过滤方法",
  rename_table = "'format_table'的变形，仅变换表格的列名称",
  format_table = "根据预设的方法，调用'dplyr::*'系列函数对表格塑形（依次为：filter，arrange，distinct，mutate，select，rename），是用于MCnebula注释数据集输出的快速便捷的方法",
  .filter_format = "'format_table'预设的一系列参数",
  plot_EIC_stack = "用于绘制堆叠的EIC图，与'plot_msms_mirrors'相对应"
)
fun4 <- function(df, des) {
  df$Description <- unname(des)
  df <- dplyr::rename(df, group = type)
  df$group <- form(df$group)
  df
}
tblm_devDisc <- fun4(tblm_devDisc, des)

flex_devDisc <- pretty_flex(
  kroup_row(tblm_devDisc, 'group'), "拓展MCnebula用于化学发现的函数", NULL,
  weight = c(Description = 2), form_body = F
)

tblm_devMeta <- c(
  "alignment_merge.R",
  "cross_select.R",
  "dot_heatmap.R",
  "pathway_enrichment.R"
)
tblm_devMeta <- fun2(tblm_devMeta)
tblm_devMeta <- as_df.lst(tblm_devMeta)
# as_code_list(tblm_devMeta$name)
des <- c(
  align_merge = "",
  tol_merge = "",
  coln_suffix = "1",
  select_features = "",
  cross_select = "",
  plot_heatmap = "",
  handling_na = "",
  log_trans = "",
  dot_heatmap = "1",
  tile_heatmap = "1",
  add_tree.heatmap = "1",
  add_xgroup.heatmap = "1",
  add_xgroup.tile.heatmap = "1",
  add_ygroup.tile.heatmap = "1",
  init_fella = "",
  load_fella = "",
  enrich_fella = "",
  graph_fella = "",
  plotGraph_fella = "",
  cid.to.kegg = ""
)
tblm_devMeta <- fun3(tblm_devMeta, des)

# as_code_list(tblm_devMeta$name)
des <- c(
  align_merge = "根据得分公式合并包含m/z和RT的两个矩阵：Score = (1 - rt.difference / rt.tolerance) * rt.weight + (1 - mz.defference / mz.tolerance) * mz.weight",
  tol_merge = "容差合并，'align_merge'的基础函数。本函数不使用for循环（因为R的循环速度太慢）而是用'merge'进行合并，这涉及一个'分箱'聚类的过程，聚类两次（向上约分和向下约分），将'箱'大小内的数值给定一个编号，进行两次合并，再根据容差设定滤除不匹配的数据。",
  select_features = "'Features'筛选算法，在'features_annotation'、'nebula_index'数据集和'top_table'数据集中交叉筛选，准则有化学类、Q-value（P-value的矫正）、Log(Fold Change)、Tanimoto similarity等",
  cross_select = "'select_features'的基础函数，'dplyr::*'系列函数的包装",
  plot_heatmap = "结合MCnebula2 R包快速绘制热图的函数",
  handling_na = "为绘制热图前处理矩阵的算法：对于每一个数据子集（'Features'量化矩阵的各个分组），缺失的数值将被填充为平均值；如果这组数据都是缺失的数值，它们将被填充为零",
  log_trans = "为绘制热图前处理矩阵的算法：将宽数据（wide data.frame）转换为长数据（long data.frame）；对数值进行对数转换；如果有一个数值为0，则用数值列的最小值的1/10替换（设定极限值）",
  init_fella = "建立FELLA包用于富集的数据集",
  load_fella = "载入预建立的FELLA包的数据集",
  enrich_fella = "以多组'Features'为单位，使用FELLA包进行通路富集",
  graph_fella = "从富集完毕的数据中获取'pagerank'，'diffusion'，'hypergeom'的富集图的数据",
  plotGraph_fella = "使用ggplot2绘制富集图",
  cid.to.kegg = "使用'MetaboAnalystR'R包将PubChem的CID转化为KEGG的ID用于富集分析"
)
tblm_devMeta <- fun4(tblm_devMeta, des)

flex_devMeta <- pretty_flex(
  kroup_row(tblm_devMeta, 'group'), '拓展MCnebula用于代谢组学分析的函数', NULL,
  weight = c(Description = 2), form_body = F
)

tblm_devOther <- c("grid_draw.R")

