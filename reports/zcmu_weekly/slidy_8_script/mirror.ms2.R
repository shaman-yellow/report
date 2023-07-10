
library(dplyr)
library(grid)
library(gt)
library(MCnebula2)
devtools::load_all("~/utils.tool")
wdpath <- "~/operation/sirius.test"
test <- initialize_mcnebula(mcnebula(), , wdpath)

test1 <- filter_structure(test)
test1 <- create_reference(test1)
test1 <- filter_formula(test1, by_reference = T)
test1 <- create_stardust_classes(test1)
test1 <- create_features_annotation(test1)
ids <- features_annotation(test1)$.features_id
test1 <- draw_structures(test1, .features_id = ids)

# plot_msms_mirrors(test1, ids)

# stack_ms2(ids)
# rsvg::rsvg_png("mcnebula_results/mirror.ms2.svg", "mcnebula_results/all_ms2.png")
# stack_ms2("2095")
# rsvg::rsvg_png("mcnebula_results/mirror.ms2.svg", "mcnebula_results/2095_ms2.png")

