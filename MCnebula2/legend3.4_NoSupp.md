# Figure legend

## Figure 1-6

&ensp;&ensp; **Fig. {@fig:data_stream}{nolink=True} | Data stream of MCnebula
workflow.** The MCnebula workflow can be divided into two parts, depending on
the platform on which the data presents. The first is the part beyond R (before
MCnebula2): from the **Samples** to **LC-MS/MS** to obtain the raw data; the
stage of **Convert raw data** is implemented using the popular MSconvert tool
derived from Proteowizard; for **Feature detection**, users can implement it
with any LC-MS processing tool, such as MZmine, XCMS, OpenMS, etc.; then .mgf
or other file format of MS/MS spectra is imported into SIRIUS for computations.
The part inside R, MCnebula2 implements integrating data and creating Nebulae
within 'mcnebula' object (see section of MCnebula2 algorithm in article for
details).

&ensp;&ensp; **Fig. {@fig:compare_accuracy}{nolink=True} | Comparison of
classifying of MCnebula with benchmark method and Evaluation of identification
accuracy of MCnebula**. **a)** Fig. {@fig:compare_accuracy}{nolink=True}a
illustrates the comparison of MCnebula and benchmark method (GNPS) with four
indicators: classified number ($TP + FP$), stability, precision ($TP / (TP +
FP)$) and recall ($TP / (TP + FN)$). The
classified number is calculated as average sum number of classified compounds
of the selected 19 chemical classes.
The stability is calculated as:
$S = 1 - (N_{origin} - N_{x}) / N_{origin}$ ($N_{origin}$ is the average sum number
of origin dataset; $N_{x}$ is the average sum number of medium noise dataset or
high noise dataset).
The precision is estimated by relative false rate; 
The relative false rate is calculated as:
$R = 1 - (1 - F) \times (1 - L)$
($F$ is the absolute false rate; $L$ is relative to the stability, i.e., the average
lost rate in stability assessment ($1 - S$)).
Then, the precision is $1 - R$.
The recall is estimated as: $(1 - R) / (1 - R + L)$.
**b)** Fig.
{@fig:compare_accuracy}{nolink=True}b illustrates a comparison of classified
number (TP + FP) of MCnebula and benchmark method.  When noise is added into original
dataset, some number of classified features are occurred &lt; 50, a cut-off
(number $\geq$ 50) is set to exclude these classes from assessment.  **c)**
Fig. {@fig:compare_accuracy}{nolink=True}b illustrates the identified accuracy
of MCnebula.  A cut-off (Tanimoto similarity $\geq$ 0.5) is set to get chemical
structures of high matching score for evaluation.

&ensp;&ensp; **Fig. {@fig:serum_tracer}{nolink=True} | Tracing top 'features'
in Child-Nebulae of serum metabolomics dataset.** According to the rankings of
'features' by statistic analysis, the top 'features' are marked with
different colors in Child-Nebulae.

&ensp;&ensp; **Fig. {@fig:ac_node2}{nolink=True} | In-depth visualization of
Child-Nebula of 'Acyl carnitines'** **a)**, refer to Fig.
{@fig:serum_tracer}{nolink=True}.  **b)** The log~2~(Fold change) value of HM
versus HS group is shown in Child-Nebulae as gradient color. The nodes with
white color indicate 'features' with missing quantification value (these
'features' were detected in our re-analysis, but not in Wozniak et al.).
**c)** The nodes of top 'features' are marked with color.  The nodes of
'features' are annotated with structures, ring diagram and bar plot of
posterior probability of classes prediction (PPCP). The top candidate of
Chemical structure of 'features' are mapped into nodes. The Ring diagram map
relative summed peak area of per 'feature' detected within each metadata group
(NN: non-hospital, non-infected; HN: hospital, non-infected; HS: hospital,
survival; HM: hospital, mortality).  The nodes without ring diagram indicate
'features' with missing quantification value (these 'features' were detected in
our re-analysis, but not in Wozniak et al.) The Bar plot map PPCP of structural
(sub-structural or dominant structural) classes for the 'feature'. **d)** The
zoom in node of 'feature' 2068 (ID) and its legend.

&ensp;&ensp; **Fig. {@fig:hps}{nolink=True} | Heat maps of 'Acyl carnitines'
(ACs), 'Lysophosphatidylcholines' (LPCs), 'Bile acids, alcohols and
derivatives' (BAs) in serum metabolomics dataset.** Figure
{@fig:hps}{nolink=True}**a**, **c** and **e** show heat maps of level of ACs,
LPCs and BAs. The 'features' are select by either in infection groups versus control groups
or HM versus HS group: Q-value &lt; 0.05, |log~2~(FC)| $\geq$ 0.3.

&ensp;&ensp; **Fig. {@fig:mech}{nolink=True} | Mechanism for filtering chemical
classes of MCnebula2.** This figure illustrates how MCnebula2 filters chemical
classes of prediction from 'features' to form a Nebula-Index to create
Child-Nebulae. The **Inner filter** filter out the chemical classes by Regex
match (also termed regular expression, introduced a pattern of string matches
that can be used to check whether a string contained a certain
substring) of names (names without Arabic numerals) and set threshold for
value of posterior probability. To create **Stardust Classes**, the previous
filtered data is re-grouped according to chemical classes instead of 'features'
ID. The **Cross filter** conduct further filtering of chemical classes via
combining Stardust Classes and 'features' annotation data. The details of
Cross filter was described in MCnebula2 Algorithm section in article.

[citation]: {@fig:data_stream}{nolink=True}

[citation]: {@fig:compare_accuracy}{nolink=True}

[citation]: {@fig:serum_tracer}{nolink=True}

[citation]: {@fig:ac_node2}{nolink=True}

[citation]: {@fig:hps}{nolink=True}

[citation]: {@fig:mech}{nolink=True}

[annotation]: -----------------------------------------

[citation]: S{@s.tab:subEval}{nolink=True}

[citation]: {@s.fig:serum_parent}{nolink=True}

[citation]: {@s.fig:serum_child}{nolink=True})

[citation]: S{@s.fig:serum_logFC}{nolink=True}

[citation]: {@s.fig:lpc_ba}{nolink=True}

[citation]: {@s.fig:pathway}{nolink=True}

[citation]: {@s.tab:serum_compounds}{nolink=True}

[citation]: S{@s.tab:serum_otops}{nolink=True}

[citation]: {@s.fig:herbal_tracer}{nolink=True}

[citation]: {@s.fig:msms}{nolink=True}

[citation]: {@s.fig:eic}{nolink=True}

[citation]: {@s.fig:complex}{nolink=True}

[citation]: {@s.tab:herbal_compounds}{nolink=True}
