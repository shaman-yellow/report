
目的：建立适应当前人工智能技术于质谱领域发展的便捷LC-MS/MS分析技术。

方法：结合尖端的SIRIUS系列预测技术、分子网络可视化、统计筛选、R语言面向对象编程等技术，开发用于LC-MS/MS分析的工作流。

结果：名为MCnebula（Multiple-Chemical Nebula）的框架被建立，通过聚焦于关键化学类别和多维度的可视化，以促进质谱数据分析过程。它由三个重要步骤组成。(1）基于丰度的化学类（ABC，abundance-based classes）选择算法；（2）根据关键化学类别对 "Feature"（化合物）进行归类；（3）可视化为多个Child-Nebulae（网络图）并注释以化学分类和结构等。MCnebula可以应用于探索超出参考光谱库限制的未知化合物的分类和结构特征。此外，由于它具有ABC选择和可视化的功能，它对于通路分析和生物标志物的探索是直观和便捷的。MCnebula是以R语言实现的。在R语言包中提供了一系列工具，以促进MCnebula功能的下游分析，包括'Features'筛选（Feature selection）（主要为二元比较的统计分析）、Top 'Features' 的同类追踪、通路富集分析、热图聚类分析、光谱可视化分析、化学信息查询和输出分析报告等。为了说明MCnebula的广泛用途，我们分析了人类血清代谢组学数据集。结果表明，通过追踪潜在生物标志物的于Child-Nebulae，"Acyl carnitines" 被筛选出来，这与此前的报道是一致的。我们还研究了一个植物来源的数据集，即杜仲（E. ulmoides），实现了快速的未知化合物注释和发现。

结论：MCnebula工作流功能广泛，适应于复杂的代谢组学数据分析和植物药数据分析。

主题词：质谱，可视化，化学类，鉴定，MCnebula


Objective: Establishing a convenient LC-MS/MS analysis technique adapted to
the current development of artificial intelligence technology in the field of
mass spectrometry.

Methods Combine cutting-edge predictive technologies of softwares of SIRIUS,
visualization of molecular network, statistical screening, and object-oriented
programming in R language to develop workflows for LC-MS/MS analysis.

Results: We established a framework called MCnebula（Multiple-Chemical
nebula） to facilitate mass spectrometry data analysis process by
focusing on critical chemical classes and visualization in multiple
dimensions. It consisted of three vital steps: (1) abundance-based
classes (ABC) selection algorithm, (2) critical chemical classes to
classify 'features' (compounds), (3) visualization as multiple
Child-Nebulae (network graph) with annotation, chemical classification
and structure. Notably, MCnebula can be applied to explore
classification and structural characteristic of unknown compounds that
beyond the limit of spectral library. What's more, it is intuitive and
convenient for pathway analysis and biomarker discovery due to its
function of ABC selection and visualization. MCnebula was implemented in
the R language. We provided a series of tools in the R packages to
facilitate downstream analysis in a MCnebula-featured way, including
feature selection (statistical analysis of binary comparisons), homology
tracing of top features, pathway enrichment analysis, heat map
clustering analysis, spectral visualization analysis, chemical
information query and output analysis reports, etc. In order to
illustrate the broad utility of MCnebula, we investigated a
human-derived serum dataset for metabolomics analysis. The results
indicated that 'Acyl carnitines' were screened out by tracing structural
classes of biomarkers which was consistent with the reference. We also
investigated a plant-derived dataset of herbal E. ulmoides to achieve
a rapid unknown compound annotation and discovery.

Conclusion: MCnebula workflows are broadly powerful and adaptable to
complex metabolomics data analysis and phytopharmaceutical data analysis.



