
# MCnebula: Let machine accomplish analyzing metabolomics data based on chemical classes and presenting report with visualization.

# Abstract

&ensp;&ensp; Untargeted mass spectrometry is a robust tool for biological
research, but researchers universally time consumed by dataset parsing. We
developed MCnebula workflow, a novel strategy proposed with multidimensional
view of visualization, termed multi-chemical Nebulae, involving in scope of
abundant classes, classification, structures, sub-structural characteristics
and fragmentation similarity. Notably, MCnebula workflow can be applied to
explore classification and structural characteristics of unknown compounds that
beyond the limitation of spectral library. Researchers were able to export the
analysis process into a report, enabling integrated analysis from initial input
to final output.  Many state-of-the-art technologies and popular methods were
incorporated in MCnebula workflow to boost chemical discovery.  We conducted
investigation of human-derived dataset of serum metabolomics by tracing
structural classes of biomarkers so that facilitating metabolic pathway
spotlight.  We also investigated a plant-derived dataset of herbal *E.
ulmoides* to achieve a rapid identification. The core methods of MCnebula
workflow was integrated in R package MCnebula2 and is public available for
custom R pipeline analysis.

# Introduction

&ensp;&ensp; Analyzing untargeted liquid chromatography/tandem mass
spectrometry (LC-MS/MS) dataset is complicated, due to the massive of data
volume, complexity of spectrogram profiles, and structural diversity of
compounds.  In the past decades, a great deal of research were anchored to
address the issues.  Many technical software or web server attempted to provide
a one-stop bulk solution for data analysis [@2020p; @2018az; @2020co; @2016a].
These solution apply or suggest flexible mass spectrogram processing tools or
analogous algorithms [@2012d; @2016e; @2006a; @2010].  To reduce false-positive
and false-negtive results, more algorithms have been implemented for peak
deconvolution, feature selection or statistical filtering [@2017f; @2022;
@2017ao; @2022b; @2017i].  Per feature corresponding to compound within sample
or parallel samples, and it prevalently equipped with fragmentation spectra to
identification.  In this context, researchers have to be confronted with a
barrier: how to identify the compounds accurately?  

&ensp;&ensp; Until today, several strategies were developed for identifying
with fragmentation spectra, including **1)** Spectral library matching.  A
number of public available databases were built to settle that via achieving
re-usability of reference fragmentation spectra, such as MassBank, MassBank of
[North America (MoNA)](https://mona.fiehnlab.ucdavis.edu/), Global Natural
Products Society molecular networking (GNPS) [@2010p; @2016a; @2012ac; @2015ak;
@2020cp].  In counterpart, these fragmentation spectra are available via their
web severs, third-party platform (e.g.,
[CompMass](http://prime.psc.riken.jp/compms/msdial/main.html#MSP>)) or specific
tools (MASST) [@2020cm].  However, comparing with structure database (PubChem
harbours over 100 million records), spectra library is too small in size that
limit the application of mass spectrometry.  To cross this barrier, **2)**
Matching with fragmentation spectra of *in silico* simulation.  *In silico*
tools have been increasingly developed for simulating fragmentation spectra
[@2010c; @2015c; @2016am; @2017aq; @2017ap; @2018ax; @2019bn; @2020; @2020cn].
Some databases such as MoNA collated *in silico* fragmentation spectra for
public available [@2013w; @2015aj].  **3)** *In silico* prediction with
matching learning.  Prevalently, the algorithms make machine train from
reference mass dataset or libraries, then 'learned' how to predict chemical
fingerprints or principles so as to retrieve the correct structure within
structure database [@2012ab; @duhrkop_searching_2015; @2018ay; @2019bo; @2019bk; @2021cy].

&ensp;&ensp; *In silico* methods are developing quickly. Up to now, the
cutting-edge technology, SIRIUS 4 [@duhrkop_sirius_2019], integrated with many
advanced algorithms of artificial intelligence, has been reported accuracy rate
reached 70% while retrieving in structure libraries.  This method help to
identify metabolites beyond the scope of spectra library.  While *in silico*
tools boost chemical identification, it is still lack of an approach that
incorporating and leveraging the state-of-the-art technology into biological
research, i.e.  biomarker discovery in untargeted mass spectral dataset.
Identification and screening of biomarkers manually are time-consuming and the
results are impressed by subjective factors.  In terms of identification,
molecular networking is increasingly popular due to its visualization and data
transparency [@2016a; @2020b].  Thus, we proposed a preliminary idea, could
clustering features for visualization based on chemical classification
contribute to biomarker discovery or metabolic pathway spotlight?

&ensp;&ensp; The history of classification in chemistry dates back to at least
the middle of the last century.  The Chemical Fragmentation Coding system
developed by Derwent World Patent Index (DWPI) in 1963.  Chemical
classification like Gene Ontology (GO) [@2000g], has been proposed, more
systematically, organizing with taxonomy and ontology in recent years [@2016].
ClassyFire is increasingly used for compound annotation either in mass dataset
analysis or not due to its computation available and systematicness [@2019bt;
@2019br; @2019bs; @2019bq; @2020cq; @2021b; @2021da; @2021cz; @2022al].  The
taxonomy and ontology for chemistry is beneficial.  For example, a hierarchical
classification-based method, termed Qemistree, was proposed to address chemical
relationships at a dataset-wide level [@2021b].  Nevertheless, we found that
taxonomy or ontology for chemistry is not a one-off method for pharmacological
or biological researches.  Numerous key metabolites or drugs in classes are
distributed in diverse hierarchies, such as 'Bile acids, alcohols and
derivatives' (subclass) [@2020cr], 'Indoles and derivatives' (class) [@2022am],
'Acyl carnitines' (level 5) [@2020s].  These classes represent a family of
compounds with either similar biological functions or activity, however,
function- or activity-independent scattered on different branches of the
diverse ranks of taxonomy.  It confuse us and which are potential biomarkers?
Indeed, untargeted mass spectra dataset is more like a black box.  For unknown
metabolites, locating the appropriate classes as manifestation from a
complicated list of chemical taxonomy (> 4800 different categories) is
challenging.  Previous study applied such analogous method while in binary
comparison but not yet systematized [@duhrkop_systematic_2021].  

&ensp;&ensp; For above comprehensive consideration, we proposed a classified
analysis workflow, named MCnebula, for untargeted LC-MS/MS dataset analysis.
Currently, the core tool for MCnebula workflow is MCnebula2, a R package
written primarily in S4 system of object-oriented programming.  MCnebula2
leverages the state-of-the-art *in silico* tools, SIRIUS workflow (SIRIUS,
ZODIAC, CSI:fingerID, CANOPUS) [@bocker_sirius_2009; @duhrkop_sirius_2019;
@2015; @duhrkop_searching_2015; @ludwig_database-independent_2020;
@duhrkop_systematic_2021], for compounds formulae prediction, structures
retrieve and classes prediction.  For the first time, MCnebula2 integrates an
abundance-based classes (ABC) selection algorithm for compounds annotation. The
ABC selection algorithm allows researchers to screen chemical classes for
downstream data analysis, including statistical analysis, screening for key
metabolites, pathway enrichment analysis, etc. With the help of MCnebula2, we
can switch from untargeted analysis to targeted analysis which focusing on our
interesting compounds or classes precisely. In addition, we provide a number of
methods featuring MCnebula workflow for downstream custom analysis, involving
pathway enrichment analysis, heat map analysis focused on chemical classes,
querying compounds for synonyms, assembling identification tables, etc.  These
tools are integrated in the 'exMCnebula2' package to provide users with further
options.  With the MCnebula workflow, researchers could also export the
analysis process into a report, enabling integrated analysis from initial input
to final output.  In this article, two datasets were applied to MCnebula in
order to demonstrate the broad utility of our method.  One was a human-derived
serum dataset that correlated with mortality risk profiling of staphylococcus
aureus Bacteremia (SaB) The other was a plant-derived herbal dataset that
related to the processing of herbal medicine.

# Results

## Overview

&ensp;&ensp; MCnebula2 was an R package for the analysis of LC-MS/MS datasets
and was part of the MCnebula workflow.  The MCnebula workflow was dedicated to
analyzing LC-MS/MS datasets from the beginning, i.e. starting from the raw data
obtained from the sample and going through the various stages of analysis to
obtain a complete analysis report (Fig. {@fig:data_stream}{nolink=True}).  The
analysis process followed the general MCnebula analysis templates, from
filtering candidates of chemical formula, structural formulae, chemical
classes, to creating visual Nebulae; it also allowed for custom advanced
analysis, with the help of chemical class focused Nebulae, to perform statistic
analysis, features selection, focus on key metabolites and their structural
characteristics, pathway enrichment, querying compound synonyms, etc.  In a
nutshell, chemical classes focused analysis was the core of MCnebula workflow,
but it was not only focused on chemical classes.

&ensp;&ensp; Currently, the R package MCnebula2 has integrated methods for
implementing general templates for MCnebula workflow, involving: application
programming interface (APIs) for obtaining data from the cutting-edge SIRIUS
software; filtering candidates of chemical formula, structure, classes;
creating Nebulae visualizations; forming analytical reports, etc. In addition,
methods for customizing advanced analyses, such as statistical analysis,
feature selection, pathway enrichment analysis, querying compound synonyms,
assembling identification tables, etc., have been initially integrated into the
'exMCnebula2' package. Custom advanced analysis was known to be a complex
analytical process that requires a priori knowledge and a thorough
understanding of the data.  The 'exMCnebula2' package could not fully undertake
automated analysis, but offered a range of functions that has the
characteristics of MCnebula workflow, providing users with further options.
Next, we would illustrate the MCnebula workflow with demo data.

## Data analysis

&ensp;&ensp; **Serum metabolic analysis.** To illustrate the application of
MCnebula2 in metabolism, we re-analyzed the serum data from Wozniak et al.
[@2020s].  The serum samples were collected from patients with *Staphylococcus
aureus* bacteremia (SaB) or not and healthy volunteers.  Overall, the samples
were divided into **1)** control groups, involving NN (non-hospital,
non-infected) and HN (hospital, non-infected); **2)** infection groups,
involving HS (hospital, survival), HM (hospital, mortality).  

&ensp;&ensp; A total of 7680 'features' were detected using MZmine2 on the
LC-MS/MS dataset.  After predicting the compounds by MS/MS spectra with SIRIUS
software, subsequent analysis was performed using MCnebula2.  Of these, 6501
'features' were annotated with molecular formula and further, 3449 'features'
were annotated with chemical structure formulae.  With the basic workflow of
MCnebula2, Parent-Nebula and Child-Nebulae were obtained (Fig.
S{@s.fig:serum_parent}{nolink=True}, Fig. S{@s.fig:serum_child}{nolink=True}).
By interrogating Child-Nebulae, we have a basic insight into the chemical
classes contained in the serum dataset. To mine more information from
Child-Nebulae: we performed a binary comparison of HS and HM groups, ranking
'features' according to 'Q-value'; the top 50 'features' were set as 'tracers'
to mark them in Child-Nebulae (Fig. {@fig:serum_tracer}{nolink=True}). By
combining the features selection algorithm, the chemical classes exhibited in
Child-Nebulae were reduced. The log_2_(Fold Change) (log_2_(FC)) quantification
for the HM versus HS groups was visualized in Child-Nebulae (Fig.
{@fig:serum_logFC}{nolink=True}).  In Fig. {@fig:serum_logFC}{nolink=True},
the overall level of 'Bile acids, alcohols and derivatives' (BAs) class and
'Acyl carnitines' (ACs) class increased remarkably, while the overall level of
'Lysophosphatidylcholines' (LPCs) class decreased remarkably. Indeed, BAs, ACs
and LPCs were reported associated with liver dysfunction, imbalance of
intestinal microphylactic homeostasis, and mortality risk [@2021db; @2020s;
@2016at]. By deep annotation of Child-Nebula, all three classes of compounds have
similar structural parent nuclei, and their levels in the NN, HN, HS, and HM
groups are similar (Fig. {@fig:ac_node}{nolink=True}, Fig.
S{@s.fig:lpc_ba}{nolink=True}). Subsequently, we performed cluster heat map
analysis and pathway enrichment analysis on the compounds of these three
classes.

&ensp;&ensp; As shown in the clustering heat map (Fig.
{@fig:hps}{nolink=True}), the control group of ACs and BAs were remarkably
separated from the infection group, which implied the infection relevance of
ACs and BAs to SaB. In contrast, LPCs did not show remarkable SaB infection
relevance or mortality relevance, probably owing to the general consistency of
this class of compounds for SaB disease.  We performed pathway enrichment
analysis for these three classes of significant compounds (HS versus HM group,
Q-value &lt; 0.05).  The results of BAs showed that four compounds exhibited
metabolic pathways associated with 'Bile secretion', 'Cholesterol metabolism',
and 'Primary bile acid biosynthesis' etc (Fig.
S{@s.fig:pathway}{nolink=True}b). Among them, βGCS was a class of compounds
with the same parent nucleus.  The results for LPCs suggested that compounds
with similar parent nucleus structure of LPCs implied association with a series
of downstream pathways (Fig. S{@s.fig:pathway}{nolink=True}c).
The significant compounds of ACs were not enriched in the pathway. But, A
fundamental role of ACs in tuning the switch between the glucose and fatty acid
metabolism was reviewed [@2018bi].  Their function implemented via
bi-directional transport of acyl moieties Between cytosol and mitochondria
(Fig. S{@s.fig:pathway}{nolink=True}a).

&ensp;&ensp; In research of Wozniak et al [@2020s], five ACs compounds were
identified. In addition, four top metabolites
(2-Hexadecanoylthio-1-Ethylphosphorylcholine (HEPC); sphingosine-1-phosphate
(S1P); decanoyl-carnitine; L-Thyroxine (T4)) were also identified. In our
reanalysis, all identifications were in line except for HEPC (see 'Data and
code availability' section for the report of serum dataset analysis).  In our
re-analysis, 'HEPC' was identified as
1-pentadecanoyl-sn-glycero-3-phosphocholine (LPC15:0) or its stereoisomers.
Indeed, HEPC and LPC15:0 are quite similar in structure, but distinct in
element constitution (corresponding to C~23~H~48~NO~5~PS and C~23~H~48~NO~7~P
respectively). They were clearly distinct in terms of chemical classification.
HEPC belong to 'Cholines' (level 5) from 'Organic nitrogen compounds'
(superclass) family, whereas LPC15:0 belong to 'Lysophosphatidylcholines'
(level 5) from 'Lipids and lipid-like molecules' family.  As a part of
MCnebula2 workflow, sulfur element is detectable for SIRIUS in isotopes pattern
with high mass accuracy [@bocker_sirius_2009].  However, for the MS/MS spectra
of 'HEPC', there was no candidate formula that harbouring sulfur element. In
addition, the high quality identified compounds were collated in Tab.
S{@s.tab:serum_compounds}{nolink=True}

&ensp;&ensp; **Herbal medicine analysis.** *Eucommia ulmoides Oliv.* (*E.
ulmoides*) [@2021n], as a traditional Chinese medicine (TCM), after being
processed with saline water, was applied to the treatment of renal diseases for
a long time in China.  Due to its complex composition, discovering chemical
changes during processing (such as processed with saline water) is challenging.
MCnebula2 was successfully applied to analyze plant-derived chemical
composition. Fig. S{@s.fig:herbal_tracer}{nolink=True} shown the focused
classes with top 'features'. It was noticed there were several characteristic
classes 'lignan', 'iridoid' or 'terpenoid'.  In *E. ulmoides*, numerous
literatures have reported the medicinal value of compounds in these classes
[@2021cq; @2021bt; @2021ch; @2021aw; @2018u; @2016aj; @2015q]. Fig.
S{@s.fig:msms}{nolink=True} shown the MS/MS spectra and chemical structure of
the identified top 'features'. All the high quality identified compounds were
collated in Tab. S{@s.tab:herbal_compounds}{nolink=True}.

# Discussion

&ensp;&ensp; MCnebula offers a unique analytical perspective, termed
multi-chemical Nebulae to achieve unknown compound identification and classes
focus.  The visualization is equipped with a more precise, flexible and
perceptive capturing ability of chemical classes which is different from
classical molecular networking pattern.  Meanwhile, it draws on the superiority
of the classical pattern.  Recently, molecular networking is a popular method
for visualization and annotation of mass spectra.  Depending on fragmentation
spectra similarity, structural annotations are propagated via network-based
method [@2012a; @2017g; @2018d; @2020e; @2021d].  Unfortunately, molecular
networking is a highly spectral similarity dependent method instead of
compounds structural or classified similarity.  For example, Flavonoids were
expected to be clustered together as its specific class and structural
similarity.  However, in previous research, it has been reported that some
Flavonoids happened to be absent from the cluster of many Flavonoids compounds
[@duhrkop_systematic_2021].  In this context, visualization in a classified
perspective is a better choice for untargeted mass spectra dataset.  Earlier in
2012, molecular networking was proposed with visualization for mass data
analysis for the first time [@2012a].  At that time, *in silico* tools for
predicting compound classification by fragmentation spectra were not available.
Nowadays, with the development of automatic classified *in silico* tools
[@duhrkop_systematic_2021; @2016], it is time for a revolution of the
visualization strategy.  

&ensp;&ensp; Untargeted metabolomics emerged to profile cellular and organismal
metabolism without prior knowledge dependence [@2016aq; @2017at].  Researchers
with the help of statistical methodologies from thousands of features screen
out biomarker, towards pharmaceutical, physiological or pathological mechanisms
[@2016ar; @2016ao].  These statistical approaches involved classical statistic
and artificial intelligence (e.g., random forests) [@2019bv; @2021de].  Both
approaches were impossible to avoid specific biases, owing to the complexity of
feature set or algorithmic stability [@2017i].  Further, evaluation in per
feature level seemed incapable of profiling systematic effects in metabolites
[@duhrkop_systematic_2021].  In this view, analyzing at chemical classified
level may be a comprehensive settlement.  However, we can not neglect the
differences of metabolites at the same classified level.  For example,
small-molecules belonging to 'Indoles and derivatives' harbour structural
denpendent affection on aryl hydrocarbon receptor (AHR) [@2019c].  Different
structural characteristics may lead to diverse activities.  The settlement for
that is integrating either 'per feature' level statistic or classified level
assessment.  Therewith, MCnebula is proposed to screen and trace biomarkers
with higher confidence in classified level. 

&ensp;&ensp; MCnebula can be applied to discover biomarkers.  We demonstrated
the application of MCnebula by re-analyzing serum metabolic dataset. We
discovered additional classes, i.e. 'Lysophosphatidylcholines' (LPCs) and 'Bile
acids, alcohols and derivatives' (BAs), that were not concerned in previous
study.  Previously, LPCs have been extensively investigated in the context of
inflammation and atherosclerosis development [@2020cv; @2016at; @2014ao;
@2003n].  In a recent review [@2020cv], the complex roles of LPCs in vascular
inflammation have been well described, involving the context-dependent pro- or
anti-inflammatory action, impact in innate immune cells and adaptive immune
system, etc.  Decreasing level of LPCs was associated with wild range of
diseases of increasing mortality risk [@2016at].  The investigation of spesis
indicated LPCs concentrations in blood were established correlation with severe
sepsis or septic shock [@2014ao]; In addition, LPCs was reported inversely
correlate with mortality in sepsis patients [@2003n].  BAs' disorder implied a
liver dysfunction and imbalance of intestinal microphylactic homeostasis
[@2021dg].  The chemical multiversity of BAs, which were discovered in the BAs'
child-nebula, were determined by the intestinal microbiome and allowed for a
complex regulation of adaptive responses in host.  In our study, the level of
BAs showed higher correlation with SaB infection than ACs.  The decreased level
of LPCs suggested a mortality risk of SaB infection.  From LPCs to BAs,
steroids related classes, 'Lineolic acids and derivatives', and other fatty
acids related classes, showed that liver played a central role in SaB infection
and mortality.  Liver X receptors (LXRs) harboured pivotal roles in the
transcriptional control of lipid metabolism [@2018bd].  LXRs modulate membrane
phospholipid composition through activation of lysophosphatidylcholine
acyltransferase 3 (LPCAT3), which directly related to LPCs [@2021di].  In
addition, the above classes showed correlation with LXRs [@2018bd].
Unfortunately, LXRs's specific role in SaB infection or mortality has not been
documented and beyond the scope of this research.

&ensp;&ensp; In herbal dataset analysis, we showed a quick identification in
Child-Nebulae with a scope of chemical classes. MCnebula is favorable to
compound identification even for unknown compound. Although some specific
database of plant-derived compounds have been constructed [@2015ak; @2012ac],
there were lack of enough fragmentation spectra for comprehensive library
match.  With the help of MCnebula, mostly via retrieving structural libraries,
a rapid and reliable resolution of complex compositions of plant-derived can be
achieved.  

&ensp;&ensp; In this article, due to limited space, few examples demonstrated
MCnebula application.  Indeed, MCnebula has a great potential in the field of
chemistry, pharmacy and medicine.  The latter, beyond this article, e.g.,
fields of application include natural products, foodomics, environmental
research etc.  As an integrated visualization method, MCnebula possibly be more
popular with biologists or chemists.  MCnebula has been proposed and
implemented in the R language with package MCnebula2.  In the future, its
methods and application will be extensively expanded.

# Methods

## MCnebula2 algorithm

**Overall consideration** We knew that the analysis of untargeted LC-MS/MS
dataset generally begin with feature detection.  It detected 'peaks' as features
in MS^1^ (MASS level 1) data.  Each feature may represents a compound, and
assigned with MS^2^ (MASS level 2) spectra.  The MS^2^ spectra was used to find
out the compound identity.  The difficulty lied in annotating these features to
discover their compound identity, mining out meaningful information, so as to
serve further biological research.  In addition, the untargeted LC-MS/MS
dataset was general a huge dataset, which leads to time-consuming analysis of
the whole process.  Herein, a classified visualization method, called MCnebula2,
was used for addressing these difficulty.

The MCnebula2 package itself did not contain any part of molecular formula
prediction, structure prediction and chemical prediction of compounds, so the
accuracy of these parts was not involved.  Currently, MCnebula2 performed
downstream analysis by extracting the prediction data from SIRIUS project.  The
core of MCnebula2 was its chemical classes filtering algorithm, called
abundance-based classes (ABC) selection algorithm. To explain the ABC selection
algorithm in details, we need to begin with MS/MS spectral analysis and
identification of compounds. 

**Chemical structure and formula.** The analysis of MS/MS spectrum was a
process of inference and prediction.  For example, we speculated the
composition of elements based on the molecular weight of MS^1^; combined with
the possible fragmentation pattern of MS^2^ spectrum, we speculated the
potential molecular formula of a compound; finally, we look for the exact
compound from the compound structure database.  Sometimes, this process is full
of uncertainty, because there are too many factors that affect the reliability
of MS/MS data and the correctness of inference.  It can be assumed that there
are complex candidates for the potential chemical molecular formula, chemical
structure and chemical class behind MS/MS spectrum. Suppose we had these data
of candidates now, MCnebula2 extracted these candidates and obtained the unique
molecular formula and chemical structure for each MS/MS spectrum based on the
highest score of chemical structure prediction; in this process, as most
algorithms do, we make a choice based on the score, and only select the result
of highest score.

**Establish reference upon top candidate** We predicted a potential
compound represented by LC-MS/MS spectrum, and obtained the candidates of
chemical molecular formula, structure and chemical class.  These candidates
include both positive and negative results: for chemical molecular formula and
chemical structure, the positive prediction was unique; for chemical class,
multiple positive predictions that belong to various classification were
involved.  We did not know the exact negative and positive.  Normally, we
ranked and filtered these according to the scores.  There were numerous scores,
for isotopes, for mass error, for structural similarity, for chemical
classes...  Which score selected to rank candidates depends on the purpose of
research. Such as:

- To find out the chemical structure mostly be positive, ranking the candidates
    by structural score.

- To determine whether the potential compound may be of a certain chemical
    classes, ranking the candidates by the classified score.


Ether by functions in MCnebula2 of 'filter_formula()', 'filter_structure()' or
'filter_ppcp()', the candidate with top score can be obtained.  However, for
the three module (formula, structure, classes), sometimes their top score
candidates were not in line with each other.  That was, their top score towards
different chemical molecular formulas.  To find out the corresponding data in
other modules, 'create_reference()' should be performed to establish the
'specific candidate' as reference for subsequent data integrating.

Above, we talked about chemical molecular formula, chemical structural formula
and chemical classes.  We obtained the unique chemical molecular formula and
chemical structure formula for reference by scoring and ranking.  But for
chemical classes, we can't adopt such a simple way to get things done.

**Chemical classification.** Chemical classification is a complex system.
Here, we only discuss the structure based chemo taxonomy system [@2016],
because the MS/MS spectrum is more indicative of the structure of compounds
than biological activity and other information.

According to the division of the overall structure and local structure of
compounds, we can call the structural characteristics as the dominant structure
and substructure [@2016]. Correspondingly, in the chemical classification
system, we can not only classify according to the dominant structure, but also
classify according to the substructure.  The chemical classification based on
the dominant structure of compounds is easy to understand, because we generally
define it in this way.  For example, we will classify Taxifolin as 'flavones',
not 'phenols', although its local structure has a substructure of 'phenol'.  We
hope to classify a compound by its dominant structure rather than substructure,
because such classify is more concise and contains more information.  However,
in the process of MS/MS spectral analysis, we sometimes can only make chemical
classification based on the substructure of compounds, which may be due to:
uncertainty in the process of structural analysis; it may be an unknown
compound; MS/MS spectral fragment information is insufficient.  In this case,
it was necessary for us to classify the compounds with the aid of substructure
information, otherwise we had no knowledge of the compounds for which we cannot
obtain dominant structure information.

We should also be clear about the complexity of another aspect of chemo
taxonomy, i.e., the hierarchy of classification.  This was easy to understand.
For example, 'Flavones' belongs to its superior, 'Flavonoids'; its next higher
level, 'Phynylpropanoids and polyketides'; the further upward classification is
'organic compounds'.

**ABC selection.** The above section discusses the inferential prediction of
individual MS/MS spectrum.  In the untargeted LC-MS/MS dataset, each feature
has a corresponding MS/MS spectrum, and there are thousands of features in
total.  The ABC selection algorithm regards all features as a whole, examined
the number and abundance of features of each chemical classification
(classification at different levels, classification of substructure and
dominant structure), and then selected representative classes (mainly screening
the classes according to the number or abundance range of features) to serve
the subsequent analysis (Fig. {@fig:mech}{nolink=True}).

- Create Stardust Classes (Inner filter).
    The posterior probability of classification prediction (PPCP) data belonged
    to each 'feature'. When performing the filtering, only simple threshold
    conditions or absolute conditions were set to filter the chemical classes;
    there was no crossover between the different attributes and no crossover
    between the 'features'.  Therefore, we considered this as 'inner' filtering.

- Cross filter Stardust Classes.
    The data of the chemical classes and their classified 'features', i.e.
    Stardust Classes data, were combined and then grouped upon the chemical
    classes.  After grouping, each chemical class had a certain quantity of
    'features'.  When filtering, statistics may be performed on 'features' data
    within a group; statistics may be performed on these data in conjunction
    with 'features annotation' data; and statistics may be performed to compare
    groups with each other.  As its crossover of attributes for filtering, we
    consider this as 'cross' filtering. (See details in next subsection about
    Cross filter Stardust Classes.)


Whether it is all filtered by the algorithm provided by MCnebula2 function or
custom filtered for some chemical classes, we now have a data called
Nebula-Index.  This data records a number of chemical classes and the
'features' attributed to them.  The subsequent analysis process or
visualization will be based on it.  Each chemical class is considered as a
'nebula' and its classified 'features' are the components of these 'nebulae'.
In the visualization, these 'nebulae' will be visualized as networks. Formally,
we call these 'nebulae' formed on the basis of Nebula-Index data as
Child-Nebulae. In comparison, when we put all the 'features' together to form a
large network, then this 'nebula' is called Parent-Nebula.

**Details of Cross filter Stardust Classes**.  This method were integration of
the following three module (Fig. {@fig:mech}{nolink=True}):

_Cross filter by 'quantity'_.  Set 'features' quantity limitation for each
group (each group, i.e. a chemical class with its classified 'features').  The
groups with too many 'features' or too few 'features' would be filtered out.
This means the chemical class would be filtered out.  These thresholds are
about:

- Minimum quantity: the 'features' within the group. 
- Maximum proportion: the 'features' quantity within the group versus all
    'features' (unique) quantity of all groups.

The purpose of this step is to filter out chemical classes that have too
large or too subtle a conceptual scope. For example, 'Organic compounds',
which covers almost all compounds that can be detected in metabolomics
data, is too large in scope to be of any help to our biological research.
The setting of parameters is not absolute, and there is no optimal
solution.  Users can draw up thresholds according to the necessity of the
study.

_Cross filter by 'score'_.  This step associate Stardust Classes data with
'features' annotation data.  For each group, the Goodness assessment is
performed for each target attribute (continuous attribute, generally be a
scoring attribute of compound identification, such as 'Tanimoto similarity').
If the group met all the expected Goodness, the chemical class would be
retained; otherwise, the chemical class would be filtered out. The Goodness
($G$) related with the 'features' within the group:

- $n$: the quantity of 'features' of which target attributes satisfied with the
    cut-off.

- $N$: the quantity of all 'features'.

The Goodness: $G = n / N$.

The assessment of Goodness is related to the parameters of 'tolerance' and
'cutoff':

- Expected Goodness, i.e. value of 'tolerance'.
- Actual Goodness, related to parameter 'cutoff'. $G = n / N$.


Goodness assessment can be given to plural target attributes.  Note that the
chemical class would retained only if it passed the Goodness assessment of all
target attributes. The main purpose of this step is to filter out those
chemical classes with too many 'features' of low structural identification.

_Cross filter by 'identical'_. A similarity assessment of chemical classes.
Set a hierarchical range for chemical classification and let groups within this
range be compared for similarity to each other. For two groups, if the
classified 'features' almost identical to each other, the chemical class
represented by one of the groups would be discarded.  The assessment of
identical degree of two groups (A and B):

- $x$: ratio of the classified 'features' of A belonging to B
- $y$: ratio of the classified 'features' of B belonging to A
- $i$: value of parameter 'identical_factor'

If $x > i$ and $y > i$, the two groups would be considered as identical.  Then
the group with fewer 'features' would be discarded. The purpose of this step is
to filter out classes that may incorporate each other and are similar in scope.
The _in silico_ prediection approach may not be able to distinguish which class
the potential compound belongs to from the LC-MS/MS spectra.

**Network graph presentation** As mentioned above, 'features' and their
annotations were integrated as Nebulae according to the Nebula-Index. These
Nebulae were network-type graph data.  The 'features' annotation data contains
top candidate of chemical formula and structure (obtained with the MCnebula2
function 'filter_*()').  The MS/MS spectral similarity (dotproduct) of the
'features' was calculated and used to form the edge data for the network graph.

**Visualization system** MCnebula2 used a number of existing R packages to
integrate and reformat data [@2021z; @2016g; @2021ab; @2021y; @2018h; @2017j;
@2019l; @2020u].  In particular, the network graph data was equipped with
'ggplot2' package for visualization.  The ggplot2 package is known for its
elaborate and aesthetic mapping characteristics.  We designed the 'ggset' data
class to store pre-defined ggplot2 plotting functions and parameters for
visualizing Nebulae.  This allows users to completely customize the
visualization to suit their needs or the needs of the publisher. Its
flexibility depends on the user's knowledge of the 'ggplot2' package.  If users
were not experienced in 'ggplot2', then just follow the preset to
visualization.

**Data structure** MCnebula2 was written mainly in R S4 system of
object-oriented programming.  When analyzing data with MCnebula2, all data
(whether 'features' annotation data or visualization data) was stored in a one
object (class 'mcnebula').  This reduced the difficulty of using the MCnebula2
package, and made the data easy to manage and the analysis easy to repeat.

**Report system** MCnebula2 integrated a reporting system that allows the
analysis process to be output as a PDF document or in other formats. The
reporting system was based on the data class 'report', which could stores each
step of the analysis as a section and could be flexibly modified according to
the user's needs. In addition, the reporting system can be used to generate
reports even if the analysis is completely irrelevant to MCnebula2 package.
The reporting system was associated with the 'rmarkdown' R package
[@allaire_rmarkdown_2022; @xie_r_2020; @xie_r_2018].

**Code Compatibility** MCnebula2 performs downstream analysis by extracting the
data from the already computed SIRIUS project.  The SIRIUS project is the main
source of data for MCnebula2 2. The SIRIUS software is still being updated and
improved. In fact, from SIRIUS version 4 to version 5
(<https://github.com/boecker-lab/sirius>), the data structure and attributes
name in the project directory have changed. In order that the functionality of
MCnebula2 is not invalidated due to versioning issues, its application program
interface (API) for the SIRIUS project has been designed to be flexible.
MCnebula2 is able to perform data extraction for different SIRIUS versions.

## Serum dataset

&ensp;&ensp; We re-analyzed 245 LC-MS/MS data (.mzML) from MASSIVE (id no.
[MSV000083593](https://massive.ucsd.edu/ProteoSAFe/QueryMSV?id=MSV000079949))
(blanks, controls and samples)[@2020s].  MZmine2 (version 2.53) was performed
for feature detection.  The detection workflow mainly involves **1)** Automated
Data Analysis Pipeline (ADAP) for peak detection and deconvolution [@2017f],
**2)** isotopes peak finder, **4)** parallel samples join alignment, **5)** gap
filling algorithm.  While exporting MS/MS spectra (.mgf) for SIRIUS 4 software
computation, spectra were merged across samples into one fragmentation list
with 30% Peak Count threshold filtering.  The feature detection workflow was
refer to  [FBMN
preprocessing](https://ccms-ucsd.github.io/GNPSDocumentation/featurebasedmolecularnetworking-with-mzmine2/)
and  [SIRIUS computational
prerequisites](https://boecker-lab.github.io/docs.sirius.github.io/prerequisites/).
The output .mgf was run with SIRIUS 4 software (version 4.9.12) for computation
with SIRIUS [@duhrkop_sirius_2019; @bocker_sirius_2009], ZODIAC
[@ludwig_database-independent_2020], CSI:fingerID [@duhrkop_searching_2015],
CANOPUS [@duhrkop_systematic_2021].  In particular, SIRIUS was customized set
to detect Iodine element while predicting formula.  MCnebula2 package were used
for subsequent data analysis. All subsequent analysis have been organized into
concise code and exported as reports (see section of Data and code
availability).

&ensp;&ensp; Kyoto Encyclopedia of Genes and Genomes (KEGG) metabolic pathway
enrichment analysis was performed with 'Lysophosphatidylcholines' (LPCs) and
'Bile acids, alcohols and derivatives' (BAs), respectively.  We used the
identified InChIKey planar of structures to hit compounds in metabolic pathway.
In detail, firstly, in order to avoid the identified structural deviations due
to stereoisomerism, the InChIKey planar were used to obtain all possible
InChIKeys via PubChem API.  In this step, PubChem CID of those compounds were
also obtained.  The R package of MetaboAnalystR was used for converting PubChem
CID to KEGG ID [@2020cx].  Many compounds were not related to metabolic pathway
so those were filtered out.  The R package of FELLA was used for KEGG
enrichment with 'pagerank' algorithm [@2018bj; @ilprints422]. The above methods
have been integrated as functions to interface with the MCnebula workflow.
These functions are available in the 'exMCnebula2' package.

## Herbal dataset

&ensp;&ensp; **Material and processing.** *E. ulmoides* dried bark was obtained
from company of ZheJiang ZuoLi Chinese Medical Pieces LTD.  Raw-Eucommia and
Pro-Eucommia were prepared as following: (1) Raw-Eucommia: The shreds or blocks
of *E. ulmoides* dried bark were took, powdered and passed through 80-mesh
sieves for further process.  (2) Pro-Eucommia: The shreds or blocks of *E.
ulmoides* dried bark were took, fried with saline water (the amount of salt is
2% of *E. ulmoides*, add 10 fold of water to dissolve), and smothered in
airtight for 30 min.  Then, the barks were dried in oven at 60 °C, followed by
baking at 140 °C for 60 min.  Finally, the baked barks were powdered and passed
through 80-mesh sieves for further process.  The processing method was based on
previous studies of *E. ulmoides* [@2010b].  

&ensp;&ensp; **Sample preparation.** 2 g of Raw-Eucommia powder and
Pro-Eucommia powder were weighed, respectively, added 50 ml of methanol/water
(1:1, v/v) followed by ultrasonic (20 kHz for 40 min).  After ultrasonic, the
mixture was filtered to obtain filtrate and residue.  The residue was added
with 50 ml of methanol/water (1:1, v/v) and extracted with ultrasonic (40 kHz,
250 W for 20 min) again.  The mixture was filtered.  Then, the filtrate of the
two extracts was combined, the solvent was evaporated.  Methanol/water (1:1,
v/v) was added to redissolve the extract and the volume was fixed to 5 ml.
Finally, the supernatant was obtained by centrifugation (12,000 r.p.m. for 10
min) for further LC−MS analysis.

&ensp;&ensp; **LC–MS experiments.** LC−MS analysis was performed using a Dionex
Ultimate 3000 UHPLC system (Dionex, Germany) coupled with a high-resolution
Fourier-transform mass spectrometer (Orbitrap Elite, Thermo Fisher Scientific,
Germany) using a Waters Acquity HSS T3 column (1.8 μm, 100 mm $\times$ 2.1 mm,
Waters Corporation, Milford, MA, USA).  Solvent A, formic acid/water (0.1:99,
v/v), and solvent B, formic acid/acetonitrile (0.1:99, v/v), were used as the
mobile phase.  The gradient profile for separation was as follows: 2% of
solvent B at 0min, 5% of solvent B at 2 min, 15% of solvent B at 10 min, 25% of
solvent B at 15 min, 50% of solvent B at 18 min, 100% of solvent B at 23 min,
2% of solvent B at 25 min, and 2% of solvent B at 30 min.  The flow rate was
0.3 ml/min.  The column temperature was set at 40°C.  Mass spectrometric
analysis was performed using an Orbitrap Elite instrument equipped with an ESI
source (Thermo FisherScientific, Germany) that operated in the negtive
ionization mode.  The ESI source was operated at 50 °C with a capillary
temperature of 275 °C, an ionization voltage of 3.5 kV, and a sheath gas flow
rate of 35 L/min.  The survey scans were obtained in the Orbitrap mass analyzer
operating at a 120,000 (full width at half-maximum) resolving power.  A mass
range of 100−1500 m/z and a normalized collision energy of 30 eV were used for
survey scans.  The analysis method was set to analyze the top 10 most intense
ions from the survey scan, and a dynamic exclusion was enabled for 15 s.

&ensp;&ensp; **MCnebula Workflow.** E.ulmoides dataset were preprocessed with
MZmine2 for feature detection, followed by SIRIUS software computation. The
subsequent analysis was similar to serum metabolic dataset and also been
organized as a report (see section of Data and code availability).

## Data processing

&ensp;&ensp; Raw data (.raw) were converted to m/z extensible markup language
(mzML, i.e., .mzml format data) in centroid mode using MSConvert ProteoWizard
[@2011b;@2012d].  The .mzml files were processed with MZmine2 (v.2.53) and
followed by SIRIUS 4 in Pop!-OS (Ubuntu) 22.04 LTS 64-bits workstation (Intel
Core i9-10900X, 3.70GHz $\times$ 20, 125.5 Gb of RAM) [@2010;
@duhrkop_sirius_2019]. MCnebula2 and other R packages were executed in Pop!_OS
(Ubuntu) 22.04 LTS 64-bits PC (Intel Core i7-1065G7, 1.3 GHz $\times$ 8, 16 Gb
of RAM).

# Data and code availability

&ensp;&ensp; The serum dataset were available at MassIVE web service (id no.
[MSV000083593](https://massive.ucsd.edu/ProteoSAFe/QueryMSV?id=MSV000079949)).
The source code of MCnebula2 is available at
<https://github.com/Cao-lab-zcmu/MCnebula2>.  The source code of exMCnebula2 is
available at <https://github.com/Cao-lab-zcmu/exMCnebula2>.  The code for all
the analysis in this study can be found in the internal data directory
('inst/extdata/') of the 'exMCnebula2' package.  In addition, .mgf files (msms
spectra) and .csv files (feature quantification) and SIRIUS output files (use
MCnebula2 function to filter and compress tens of GB of data to just a few tens
of MB) and analysis report of serum and herbal dataset were compressed and
stored in the exMCnebula2 package. By downloading and installing MCnebula2
package and exMCnebula2 package, all the analyses of this study can be
reproduced by executing a few lines of R codes (while using tools beyond R,
such as MSconvert software, SIRIUS 4 software and MZmine2 are excluded).

[annotation]: ----------------------------------------- 

[citation]: {@fig:data_stream}{nolink=True}

[citation]: {@fig:serum_tracer}{nolink=True}

[citation]: {@fig:serum_logFC}{nolink=True}

[citation]: {@fig:ac_node}{nolink=True}

[citation]: {@fig:hps}{nolink=True}

[citation]: {@fig:mech}{nolink=True}

[annotation]: -----------------------------------------

[citation]: {@s.fig:serum_parent}{nolink=True}

[citation]: {@s.fig:serum_child}{nolink=True})

[citation]: {@s.fig:lpc_ba}{nolink=True}

[citation]: {@s.fig:pathway}{nolink=True}

[citation]: {@s.tab:serum_compounds}{nolink=True}

[citation]: {@s.fig:herbal_tracer}{nolink=True}

[citation]: {@s.fig:msms}{nolink=True}

[citation]: {@s.tab:herbal_compounds}{nolink=True}
