
reload_bib("~/utils.tool/inst/extdata/library.bib")

browseURL(rmarkdown::render("./slidy_6_year.Rmd"))

route <- as_network(list(
    "Mail:Deparse",
    "Deparse:Tags",
    "Tags:Info, Analysis",
    "Info:Extracting",
    "Extracting:ID, Score, Client, Date..",
    "ID, Score, Client, Date..:Namespace",
    "Analysis:Workflow",
    "Workflow:Job.1, job.2, job...",
    "Job.1, job.2, job...:Summary",
    "Summary:Report",
    "Report:Packaging",
    "Packaging, Namespace:Record",
    "Packaging:Send_mail"
    ))
p <- flowChart(route, 1.1, 1)
wrap(p, 7.5, 7)

route <- as_network(list(
    "Monthly_Tasks:Task.1, Task.2, Task.3, Task...",
    "Task.1, Task.2, Task.3, Task...:Summary",
    "Summary:Titles, Scores, IDs, Dates, Analysis",
    "Titles, Scores, IDs, Dates, Analysis:Information",
    "Information:Tables",
    "Tables:Record_1, Record_2, Record_3, Record_4",
    "Record_1, Record_2, Record_3, Record_4:Send_mail"
    ))
p <- flowChart(route, 1.1, 1)
wrap(p, 7.5, 7)

p <- plot_task_summary()
p$p.alls
