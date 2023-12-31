
shift <- rnorm(10, 2, 1)
all_range <- list(1:30, 31:60, 61:100, 101:140)
lst <- mapply(shift, 1:length(shift), SIMPLIFY = F, FUN = function(shift, id){
    peak <- mapply(all_range, SIMPLIFY = F,
        FUN = function(range){
                peak <- dnorm(range, median(range) + shift, rnorm(1, 5, 1.2)) *
                              rnorm(1, 0.7, 0.15)
        })
    feature <- mapply(1:length(all_range), lengths(all_range),
        FUN = function(seq, rep){
                rep(paste0("peak", seq), rep)
        })
    tibble::tibble(x = unlist(all_range), y = unlist(peak),
                   sample = paste0("sample", id),
                   peak = unlist(feature)
                   )
    })
data <- data.table::rbindlist(lst)
data <- dplyr::mutate(data,
                      is = ifelse(y >= 0.003, T, F),
                      peak = ifelse(is, peak, "non-feature"))
palette <- c(ggsci::pal_npg()(length(all_range)), "transparent")
names(palette) <- c(paste0("peak", 1:length(all_range)), "non-feature")
p <- ggplot(data, aes(x = x, y = y)) +
  geom_area(aes(fill = peak)) +
  geom_line() +
  geom_vline(xintercept = vapply(all_range, median, 1), linetype = "dashed") +
  geom_hline(yintercept = 0.003, linetype = "dashed") +
  facet_grid(sample ~ .) +
  scale_fill_manual(values = palette) +
  labs(x = "retention time", y = "intensity") +
  theme_minimal() +
  theme(text = element_text(family = "Times"),
        axis.text.y = element_blank())

svg("align.svg")
print(p)
dev.off()
system("cairosvg align.svg -d 300 -o align.png")

all_time <- vapply(all_range, median, 1)
anpi <- 0.05
len <- 5
ms1_set <- lapply(all_time, function(n){
    ms1 <- c(rnorm(3, 3, 2), rnorm(3, 8, 3), rnorm(3, 3, 2))
    ms1 <- ms1[ ms1 > 0 ]
    ms1 <- data.frame(x = 1:length(ms1), xend = 1:length(ms1),
                      y = 0, yend = ms1)
    ms1 <- dplyr::mutate(ms1,
                  x = x * len, xend = xend * len,
                  y = sinpi(anpi) * x + y, yend = sinpi(anpi) * xend + yend,
                  x = cospi(anpi) * x + n, xend = x)
    ms1 <- dplyr::bind_rows(ms1,
                            c(x = n, xend = max(ms1$xend),
                              y = 0, yend = max(ms1$y)))
    dplyr::mutate(ms1, time = n)
    })
ms1_set <- data.table::rbindlist(ms1_set)
p <- ggplot(dplyr::filter(data, sample == "sample1"), aes(x = x, y = y * 50)) +
  geom_segment(data = ms1_set,
               aes(x = x, xend = xend, y = y, yend = yend),
               color = "grey30", size = 0.8) +
  geom_area(aes(fill = peak)) +
  geom_line() +
  labs(x = "retention time", y = "intensity") +
  scale_fill_manual(values = palette) +
  theme_minimal() +
  theme(text = element_text(family = "Times"),
        axis.text.y = element_blank())

svg("lc_ms.svg", width = 5, height = 2)
print(p)
dev.off()
system("cairosvg lc_ms.svg -d 300 -o lc_ms.png")

sample1 <- dplyr::filter(data, sample == "sample1", peak != "non-feature")
p <- ggplot(sample1, aes(x = x, y = y)) +
  geom_area(aes(fill = peak)) +
  geom_line() +
  labs(x = "retention time", y = "intensity") +
  scale_fill_manual(values = palette) +
  facet_wrap(~ peak, ncol = 1, scales = "free_x") +
  theme_minimal() +
  theme(text = element_text(family = "Times"),
        axis.text.y = element_blank(),
        legend.position = "none")
ms2 <- lapply(unique(sample1[[ "peak" ]]),
    function(peak){
        frag <- c(rnorm(6, 4, 2), rnorm(10, 8, 4), rnorm(5, 3, 1))
        frag <- frag[ frag > 0 ]
        x <- rnorm(length(frag), 10, 3)
        data.frame(x = x, y = frag, peak = peak)
    })
ms2 <- data.table::rbindlist(ms2)
p2 <- ggplot(ms2) +
  geom_segment(aes(x = x, xend = x, y = 0, yend = y),
               color = "black", size = 0.8) +
  facet_wrap(~ peak, ncol = 1) +
  theme_minimal() +
  labs(x = "m/z", y = "intensity") +
  theme(text = element_text(family = "Times"))

svg("ms1ms2.svg", width = 10, height = 5)

grid.newpage()
pushViewport(viewport(layout= grid.layout(1, 10)))
print(p, vp = viewport(layout.pos.row = 1, layout.pos.col = 1))
y <- seq(0.1, 0.9, by = 0.25)
grid::grid.segments(0.1, y, 0.9, y,
             arrow = arrow(angle = 10, type = "closed"),
             gp = grid::gpar(fill = "black"),
             vp = viewport(layout.pos.row = 1, layout.pos.col = 2))
print(p2, vp = viewport(layout.pos.row = 1, layout.pos.col = 3:10))

dev.off()
system("cairosvg ms1ms2.svg -d 300 -o ms1ms2.png")

