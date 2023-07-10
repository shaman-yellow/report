```{r, echo = F}

fpar(
      ftext("硕 士 毕 业 论 文", fp_text(font.size = 36, font.family = "SimHei")),
      fp_p = fp_par("center", line_spacing = 1.5)
      )

fun1 <- function(x, font = "KaiTi") {
  fpar(
      ftext(x, fp_text(font.size = 16, font.family = font)),
      fp_p = fp_par("left", line_spacing = 1.5)
      )
}

fpar(ftext("论文题目：", fp_text(font.size = 16, font.family = "KaiTi")),
     ftext("MCnebula", fp_text(font.size = 16, font.family = "Times New Roman")),
     ftext("：以关键化学类归类和可视化促进鉴定的非靶向",
        fp_text(font.size = 16, font.family = "KaiTi")),
     ftext("LC-MS/MS", fp_text(font.size = 16, font.family = "Times New Roman")),
     ftext("分析策略", fp_text(font.size = 16, font.family = "KaiTi")),
      fp_p = fp_par("left", line_spacing = 1.5)
      )
fun1("")
fun1("作者姓名：黄礼闯")
fun1("导    师：曹岗")
fun1("指导老师：王璐")
fun1("学科专业：中药学")
fun1("所在学院：药学院")
```

\newpage


