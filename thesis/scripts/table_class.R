# ==========================================================================
# script for generate format table
# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

txt <- readLines("~/MCnebula2/R/class-mcnebula.R")
class <- match_class(txt)

## mcnebula
slots <- c(
  creation_time = "character",
  ion_mode = "character",
  melody = "melody",
  mcn_dataset = "mcn_dataset",
  statistic_set = "statistic_set"
)
inherits <- c("project", "nebula", "export")
mcnebula <- namel(slots, inherits)

## project
slots <- c(
  project_version = "character",
  project_path = "character",
  project_conformation = "project_conformation",
  project_metadata = "project_metadata",
  project_api = "project_api",
  project_dataset = "project_dataset"
)
project <- namel(slots)

# nebula
slots <- c(
  parent_nebula = "parent_nebula",
  child_nebulae = "child_nebulae"
)
nebula <- namel(slots)

# child_nebulae
slots <- c(
  igraph = "list",
  tbl_graph = "list",
  layout_ggraph = "list",
  grid_layout = "ANY",
  viewports = "list",
  panel_viewport = "ANY",
  legend_viewport = "ANY",
  ggset = "list",
  structures_grob = "list",
  nodes_ggset = "list",
  nodes_grob = "list",
  ppcp_data = "list",
  ration_data = "list",
  ggset_annotate = "list"
)
child_nebulae <- namel(slots)

slots <- c(
  igraph = "ANY",
  tbl_graph = "ANY",
  layout_ggraph = "ANY",
  ggset = "ggset"
)
parent_nebula <- namel(slots)

slots <- c(
  export_path = "character",
  export_name = "character"
)
export <- namel(slots)

slots <- c("dataset", "reference", "backtrack")
mcn_dataset <- namel(slots)

# ==========================================================================
# gather
# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

tbl_mcnebula <- tibble::tibble(
  class = c("mcnebula", mcnebula$inherits),
  inherits = character(1),
  slots = character(1),
  description = character(1)
)

tbl_mcnebula <- sapply(tbl_mcnebula$class, simplify = F,
  function(class) {
    obj <- get(class)
    data.frame(inherits_from = class, slots = names(obj$slots))
  })
tbl_mcnebula <- data.table::rbindlist(tbl_mcnebula)

# as_code_list(tbl_mcnebula$slots, rep("", nrow(tbl_mcnebula)))
des <- c(
  creation_time = "由'date()'创建",
  ion_mode = "离子模式，'pos'或者'neg'",
  melody = "存储调色板的类",
  mcn_dataset = "MCnebula的主要数据集",
  statistic_set = "统计数据集",
  project_version = "SIRIUS版本，'sirius.v4'或者'sirius.v5'",
  project_path = "SIRIUS项目的文件路径",
  project_conformation = "项目内文件的隶属信息",
  project_metadata = "项目内文件的存在信息",
  project_api = "文件的读取和格式化函数",
  project_dataset = "读取后存储的数据",
  parent_nebula = "与Parent-Nebula的可视化相关",
  child_nebulae = "与Child-Nebula的可视化相关",
  export_path = "MCnebula的输出路径",
  export_name = "可视化或输出的表格中的标签名"
)
tbl_mcnebula$description <- des

tbl_mcnebula <- kroup_row(tbl_mcnebula, "inherits_from")

flex_mcnebula <- pretty_flex(
  tbl_mcnebula,
  "Class: 'mcnebula'的结构", NULL,
  weight = c(Description = 2), form_body = F
)

tbl_subs <- namel(
  .project_conformation(),
  .project_metadata(),
  .project_api(),
  .project_dataset(),
  .mcn_dataset(),
  .statistic_set(),
  .melody(),
  .parent_nebula(),
  .child_nebulae()
)
tbl_subs <- lapply(tbl_subs, slotNames)
names(tbl_subs) %<>% gsub("\\.|\\(|\\)", "", .)

tbl_subs <- lapply(names(tbl_subs),
  function(name){
    data.frame(Class = name, slots = tbl_subs[[ name ]])
  })
tbl_mex <- data.table::rbindlist(tbl_subs[1:6])

# as_code_list(tbl_mex$slots)
des <- c(
  file_name = "文件'subscript'对应的名称",
  file_api = "文件'subscript'的上级从属",
  attribute_name = "属性'subscript'对应的名称",
  metadata = "文件的元数据表格",
  methods_read = "读取的函数",
  methods_format = "格式化的函数",
  methods_match = "提取字符、匹配字符的函数",
  dataset = "从SIRIUS项目中读取的数据集",
  dataset = "经过初步过滤的数据集",
  reference = "用于可视化和后续分析的数据集",
  backtrack = "数据回收站",
  design_matrix = "设计矩阵",
  contrast_matrix = "对比矩阵",
  dataset = "用于统计分析的数据集",
  top_table = "统计分析的排序结果"
)
tbl_mex$Description <- des
tbl_mex <- kroup_row(tbl_mex, "Class")

flex_mex <- pretty_flex(
  tbl_mex, "数据相关Class的结构", NULL,
  weight = c(Description = 2),
  form_body = F
)

tbl_nebula <- data.table::rbindlist(tbl_subs[ 7:9 ])

# as_code_list(tbl_nebula$slots)
des <- c(
  palette_set = "用于追踪'feature'或者用于因子变量可视化的调色板",
  palette_gradient = "用于连续变量的可视化的调色板",
  palette_stat = "用于统计分组的调色板",
  palette_col = "用于化学类的区分的调色板",
  palette_label = "用于化学类阶层的可视化的调色板",
  igraph = "R包'igraph'生成的'igraph'类的对象，网络型数据文件",
  tbl_graph = "R包'tidygraph'生成的'tbl_graph'类的对象，网络型数据文件",
  layout_ggraph = "用于R包'ggraph'可视化的网络型数据文件",
  ggset = "管理'ggplot2'的可视化的函数和参数的类的对象",
  igraph = "'igraph'对象的list",
  tbl_graph = "'tbl_graph'对象的list",
  layout_ggraph = "'layout_ggraph'的list",
  grid_layout = "R包'grid'创建的网格画板样式的对象",
  viewports = "R包'grid'创建的视图（viewport）对象的list",
  panel_viewport = "主画板的视图对象",
  legend_viewport = "图例的视图对象",
  ggset = "'ggset'的list",
  structures_grob = "化学结构可视化的'grob'对象（与'grid'包相关）",
  nodes_ggset = "绘制深度注释节点（网络图中的Nodes）的ggset的list",
  nodes_grob = "Nodes的grob的list",
  ppcp_data = "用于化学类预测的后验概率的可视化的数据集",
  ration_data = "同于统计数据可视化的数据集",
  ggset_annotate = "带有深度注释Nodes的ggset对象的list"
)
tbl_nebula$Description <- des
tbl_nebula <- kroup_row(tbl_nebula, "Class")

flex_nebula <- pretty_flex(
  tbl_nebula, "可视化相关Class的结构", NULL,
  weight = c(Description = 2), form_body = F
)

# ==========================================================================
# other classes
# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

class <- lapply(
  c("~/MCnebula2/R/class-msframe.R",
    "~/MCnebula2/R/class-ggset.R",
    "~/MCnebula2/R/class-command.R",
    "~/MCnebula2/R/class-report.R",
    "~/MCnebula2/R/class-section.R"),
  function(script) match_class(readLines(script))
)
class <- unlist(class, recursive = F)
tbl_others <- lapply(names(class),
  function(name) {
    if (grepl("code_block_", name)) {
      return()
    } else if (grepl("code_block$", name)) {
      return(data.frame(Class = "code_block, code_block_table, code_block_figure",
          slots = class[[ name ]]))
    }
    data.frame(Class = name, slots = class[[ name ]])
  })
tbl_others <- data.table::rbindlist(tbl_others)

# as_code_list(tbl_others$slots)
des <- c(
  entity = "存储数据框（data.frame）",
  subscript = "表明来源的名称",
  layers = "存储ggplot绘图的各个函数和响应的参数的list",
  command_name = "函数的名字",
  command_function = "函数本体",
  command_args = "函数的参数",
  yaml = "控制输出的yaml语言，与Rmarkdown、markdown、pandoc有关",
  layers = "list，存储section，character，code_block等",
  codes = "格式化的代码",
  command_name = "代码块的执行程序，一般是'r'",
  command_function = "将代码输出成文本的函数",
  command_args = "传递到执行程序的参数",
  .Data = "'heading'继承于'character'",
  level = "表明标题层级",
  heading = "类'heading'的对象",
  paragraph = "'character'对象",
  code_block = "'code_block'对象"
)
tbl_others$Description <- des
tbl_others <- kroup_row(tbl_others, "Class")

flex_others <- pretty_flex(
  tbl_others, "MCnebula其他Class的结构", NULL,
  weight = c(Description = 2), form_body = F 
)
