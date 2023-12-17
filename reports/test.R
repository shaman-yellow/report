
devtools::load_all("~/utils.tool")
make_slidy("slidy_14")

# ==========================================================================
# 
# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

omit <- circleGrob(seq(.2, .8, , 3), .5, .07, gp = gpar(fill = "grey20"),
                   vp = viewport(, , u(1.5, line), u(1.5, line)))
weight.chi <- list("..." = 1, tables = 3, plots = 3, params = 3, `...` = 1)
## draw
type <- c("class", "slot", "sub.slot", "function", "custom")
pal <- MCnebula2:::.as_dic(color_set(), type, na.rm = T)
grobs.chi <- lst_grecti(names(weight.chi), pal, "custom", grecti2)
grobs.chi$... <- omit
## signal grid layout
n <- 3
seq <- seq(.2, .8, length.out = n)
grid <- segmentsGrob(c(rep(0, n), seq),
                     c(seq, rep(1, n)),
                     c(rep(1, n), seq),
                     c(seq, rep(0, n)), gp = gpar(lty = "dashed"))
grid <- ggather(clipGrob(height = .8), rectGrob(), grid, vp = viewport(, , .8, .8))
grobs.chi$tables %<>% into(grid)
## signal viewport
n <- 6
seq <- seq(135, 0, length.out = n)
seq2 <- seq(45, 0, length.out = n)
vps <- lapply(1:length(seq),
  function(n, fx = .5, fy = .5, x = .5) {
    ang <- seq[n]
    ang2 <- seq2[n]
    vp <- viewport(cospi(ang / 180) * fx + x, sinpi(ang / 180) * fy + x,
      u(2, line), u(2, line), angle = ang2,
      just = c("centre", "bottom"))
    ggather(rectGrob(gp = gpar(fill = "lightyellow", col = pal[["sub.slot"]])),
      gtext(paste0("n", rev(1:length(seq))[n]),
        gpar(fontface = "plain"), form = F), vp = vp)
  })
vps <- do.call(ggather, c(vps, list(vp = viewport(, .1, .5, .5))))
grobs.chi$params %<>% into(vps)
## signal ggset
ggsets <- frame_col(c(n = 1, x = 1, mn = 1),
                    list(n = gtext("n", list(cex = 2.5), form = F),
                         x = gtext("×", list(cex = 2, font = c(plain = 1))),
                         mn = into(glayer(3), layer5_)))
ggsets <- ggather(ggsets, vp = viewport(, , .7, .7))
grobs.chi$plots %<>% into(ggsets)
## child... gather
chi <- frame_row(weight.chi, grobs.chi)
chi <- ggather(chi, vp = viewport(, , .9, .95))
job <- grecti2("Job")
job <- into(job, chi)
draw(job)

route <- as_network(
  list("Job:step1",
    "step1:step2",
    "step2:step3",
    "step3:step4",
    "step4:..."
    ), "tree"
)
p.route <- as_grob(flowChart(route, 1.1, 1))

job_de <- xf(job = 1, p.route = 1)
draw(job_de)
p.jobde <- wrap(job_de, 5, 4)
p.jobde

# ==========================================================================
# 
# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

outline <- function(name) {
  grecti(name, tfill = "black",
    tgp_args = list(col = "transparent"), borderF = 1.5)
}
block <- function(text) {
  into(grectn("grey92", , list(col = "transparent")),
    gtext(text, list(font = c(plain = 1)), x = .1, hjust = 0))
}
stext <- function(text) {
  gtext(text, x = 0, hjust = 0)
}

txt.h1 <- stext("Table name")
txt.h2 <- stext("Table location")
blk.b1 <- block("Dim: w * h")
blk.b2 <- block("- Col1: ...\n- Col2: ...")
df <- data.frame(Col1 = n(id., 3), Col2 = n(cand., 3))
grob_table <- gridExtra::tableGrob(df, theme = gridExtra::ttheme_default(8))
null <- nullGrob()
tab.cont <- yf(txt.h1 = 1, txt.h2 = 1, null = .1, blk.b1 = 1, null = .2,
  blk.b2 = 2, null = .2, grob_table = 4)
tab.cont <- ggather(tab.cont, vp = viewport(, , .8, .8))
tab <- outline("Table show")
tab <- into(tab, tab.cont)
draw(tab)

fig <- into(grectn(), gtext("Fig.", list(cex = 3)))
txt.h1 <- stext("Table name")
txt.h2 <- stext("Table location")
fig.cont <- yf(null = 1, txt.h1 = 1, txt.h2 = 1, null = .2, fig = 3, null = 1.5)
fig.cont <- ggather(fig.cont, vp = viewport(, , .8, .8))
fig <- outline("Table show")
fig <- into(fig, fig.cont)
draw(fig)

fun <- function(text, name) {
  obj <- lapply(1:3, function(x) stext(paste0("\t", text, " ", x)))
  names(obj) <- paste0(name, 1:3)
  obj
}
ans <- fun("Analysis", "ans")
ts <- fun("Table", "ts")
fs <- fun("Figure", "fs")
txt.t1 <- stext("Contents")
txt.t2 <- stext("Tables")
txt.t3 <- stext("Figures")
wei.lst <- nl(c("txt.t1", names(ans), "txt.t2", names(ts), 'txt.t3', names(fs)),
  1, F, default = 1)
lst.cont <- frame_row(wei.lst, c(ans, ts, fs, namel(txt.t1, txt.t2, txt.t3, null)))
lst.cont <- ggather(lst.cont, vp = viewport(, , .8, .8))
lst <- outline("Table of contents")
lst <- into(lst, lst.cont)
draw(lst)

tmp <- tempfile()
pdf_convert("~/outline/lixiao/cover_page.pdf", filenames = tmp)
cover <- ggather(rasterGrob(png::readPNG(tmp)), vp = viewport(, , .8, .9))
cover <- into(outline("Cover"), cover)

p.rep <- xf(cover = 1, null = .1, lst = 1, null = .1, tab = 1, null = .1, fig = 1)
wrap(p.rep, 9, 5)
