
library(Gmisc)
options(connectGrobArrow = arrow(angle = 10, ends = "last",
                                 length = unit(0.15, "inches"), type = "closed"),
        connectGrob = gpar(fill = "black"),
        boxGrobTxt = gpar(color = "black", cex = 1, fontfamily = "Times", fontface = "bold"),
        boxGrob = gpar(fill = "lightyellow")
        )
texts <- c(
    pool = "Candidates collection",
    filter = "Filter candidates",
    refer = "Create reference",
    class = "Filter classification",
    gather = "Gather for an overview",
    vis = "Visualization"
)
vert <- mapply(texts, seq(0.9, 0.1, length.out = length(texts)),
    SIMPLIFY = F,
    FUN = function(text, y){
      boxGrob(text, x = 0.5, y = y)
    }
)

arrows <- lapply(1:(length(vert) - 1),
    function(n){
      connectGrob(vert[[ n ]], vert[[ n + 1 ]], type = "vert")
    })

svg("main_flow.svg")
vert
arrows
dev.off()
system("cairosvg main_flow.svg -d 300 -o main_flow.png")
## ---------------------------------------------------------------------- 


