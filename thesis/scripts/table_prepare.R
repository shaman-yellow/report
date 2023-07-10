# ==========================================================================
# table about Preparation
# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

tbl_prep <- list(
  depends = 'ggplot2',
  imports = c("BiocStyle", "bookdown", "ChemmineOB", "crayon",
    "data.table", "dplyr", "ggimage", "ggraph", "ggsci",
    "ggtext", "grid", "gridExtra", "grImport2", "igraph",
    "knitr", "methods", "pbapply", "rlang", "rmarkdown",
    "rsvg", "stringr", "styler", "svglite", "tibble", "tidyr"),
  suggests = "testthat"
)
tbl_prep <- as_df.lst(tbl_prep)

# as_code_list(tbl_prep$name)
des <- c(
  ggplot2 = "用于可视化的主要R包",
  BiocStyle = "为报告输出样式提供额外选择",
  bookdown = "为输出报告的提供样式的包",
  ChemmineOB = "用于化学结构可视化",
  crayon = "R命令行标准输出的美化",
  data.table = "快速读取数据",
  dplyr = "操纵数据框（data.frame）",
  ggimage = "为子视图（grob）映射到主视图提供便利（用于ggplot2）",
  ggraph = "ggplot2用于网络图的拓展工具",
  ggsci = "提供科研杂志社偏爱的调色板",
  ggtext = "强化ggplot2的文本可视化",
  grid = "用于ggplot2无能为力的复杂做图，例如可视化Child-Nebulae",
  gridExtra = "主要提供'arrangeGrob'函数，调整'grob'",
  grImport2 = "提供'readPicture'和'grobify'函数，将cairosvg矢量图和'grid'包绘图结合在一起",
  igraph = "网络数据格式的基础R包，构建基本数据格式，可以用于输出Cytoscape等软件支持的数据格式",
  knitr = "输出报告依赖的包",
  methods = "提供S4面向对象编程系统",
  pbapply = "可视化运行进度的包",
  rlang = "提供'call'、'name'、'expression'类对象和字符对象转化的工具",
  rmarkdown = "输出报告依赖的包",
  rsvg = "提供'rsvg_svg'函数将svg转化为cairosvg",
  stringr = "提供字符串处理的工具",
  styler = "将'rblock'对象中的代码格式美化",
  svglite = "比'svg'更轻量的svg输出工具",
  tibble = "提供'tibble'数据框形式，更适用于数据量大的表格的透视",
  tidyr = "操纵数据框",
  testthat = "用于测试包"
)
tbl_prep$Description <- des
tbl_prep$type <- toupper(tbl_prep$type)
flex_prep <- pretty_flex(
  rbind(kroup_row(tbl_prep, 'type'), rep('...', 3)),
  "MCnebula涉及的R包及其作用", NULL, form_body = F,
  weight = c(Description = 2)
)

# ==========================================================================
# section 2
# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

tbl_prep2 <- c(
    "aplot", "BiocParallel", "ChemmineOB", "classyfireR",
    "data.table", "dplyr", "FELLA", "ggraph", "ggsci",
    "ggtree", "grImport2", "Hmisc", "igraph", "magrittr",
    "MCnebula2", "pbapply", "pdftools", "png", "rcdk", "RCurl",
    "rlang", "rsvg", "scales", "stringr", "tibble",
    "tidygraph", "tidyr", "XML"
)
tbl_prep2 <- tbl_prep2[ !tbl_prep2 %in%
  c(tbl_prep$name, 'MCnebula2', 'XML', 'tidygraph', 'BiocParallel') ]
tbl_prep2 <- list(IMPORTS = tbl_prep2)
tbl_prep2 <- as_df.lst(tbl_prep2)

# as_code_list(tbl_prep2$name)
des <- c(
  aplot = "用于凭借ggplot绘图",
  classyfireR = "R的Classyfire的API，查询化合物的分类系统",
  FELLA = "用于通路富集的R包",
  ggtree = "用于可视化层次聚类的ggplot2的拓展包",
  Hmisc = "使用 'capitalize' 将句首单词首字母大写",
  magrittr = "使用管道符 '%>%' 和 '%<>%'",
  pdftools = "用于处理.pdf的输出",
  png = "用于读写.png格式的图片",
  rcdk = "用于分子量的计算和同位素模式的模拟",
  RCurl = "用于下载PubChem数据库",
  scales = "用于可视化"
)
tbl_prep2$Description <- des
flex_prep2 <- pretty_flex(
  kroup_row(tbl_prep2, "type"), "测试和拓展MCnebula用到的R包", NULL,
  weight = c(Description = 2), form_body = F
)
