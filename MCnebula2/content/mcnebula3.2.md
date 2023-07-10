
# MCnebula: Select critical chemical classes to classify and boost identification by visualization for downstream analysis of untargeted LC-MS/MS dataset analysis

# Abstract

&ensp;&ensp; Untargeted mass spectrometry is a robust tool for biological
research, but researchers universally time consumed by dataset parsing.  We
developed the MCnebula approach to address this challenge by focusing on
critical chemical classes and visualizing them in multiple dimensions: via
abundance-based classes (ABC) selection algorithm, critical chemical classes
were selected to classify 'features' (compounds); visualizing these chemical
classes as multiple Child-Nebulae (network graph) and annotated them in depth
with chemical classification and structure.  Notably, MCnebula can be applied
to explore classification and structural characteristics of unknown compounds
that beyond the limitation of spectral library; it can also be used for pathway
spotting and biomarker discovery. MCnebula was implemented in the R language.
We provide a series of tools in the R packages to facilitate downstream
analysis in a MCnebula-featured way, including feature selection (statistical
analysis of binary comparisons), homology tracing of top features, pathway
enrichment analysis, heat map clustering analysis, spectral visualization
analysis, chemical information query, output analysis reports, etc.  For
illustration, we conducted investigation of human-derived dataset of serum
metabolomics by tracing structural classes of biomarkers so that facilitating
metabolic pathway spotlight; we also investigated a plant-derived dataset of
herbal *E.  ulmoides* to achieve a rapid identification and discovery of
chemistry.

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
barrier: how to identify so many compounds accurately?  

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
relationships at a dataset-wide level [@2021b].

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
dependent affection on aryl hydrocarbon receptor (AHR) [@2019c].  Different
structural characteristics may lead to diverse activities.  The settlement for
that is integrating either 'per feature' level statistic or classified level
assessment.

&ensp;&ensp; In addition to chemical classifying and statistical analysis,
clustering visualization was another popular tool for untargeted mass
spectrometry data analysis.  For over a decade, Global Natural Products Social
Molecular Networking (GNPS) developed as such a popular tool. Depending on
fragmentation spectra similarity, structural annotations are propagated via
network-based method [@2012a; @2017g; @2018d; @2020e; @2021d].  Unfortunately,
molecular networking is a highly spectral similarity dependent method instead
of compounds structural or classified similarity.  For example, Flavonoids were
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
visualization strategy. With higher confidence in classified level. 

&ensp;&ensp; For above consideration, we proposed a comprehensive analysis
workflow, named MCnebula, for untargeted LC-MS/MS dataset analysis. For the
first time, MCnebula integrated an abundance-based classes (ABC) selection
algorithm for chemical classes selection. The ABC selection algorithm: first,
applied an initial filtering to thousands of chemical classes based on the
predicted probability; regarded all 'features' as a whole, examined the number
and abundance of 'features' of each chemical classification (classification at
different levels, classification of sub-structure and dominant structure), and
then selected representative classes; these chemical classes were followed by
goodness assessment (about identification of its classified compounds) and
identicality assessment (the extent to which these chemical classes are
distinguished from each other in the context of MS/MS spectra).  The final
chemical classes would be serve to the subsequent analysis: visualized as
Child-Nebulae and focus on these chemical classes (Nebulae) for biomarker
finding or chemistry discovery. The top 'features' depend on statistic analysis
could be set as tracer to discover more homology compounds of chemical
structure or spectral similarity or chemical class. MCnebula can be used to
explore unknown compounds because the identification module of MCnebula
utilized the cutting-edge technology of SIRIUS software [@bocker_sirius_2009;
@duhrkop_sirius_2019; @2015; @duhrkop_searching_2015;
@ludwig_database-independent_2020; @duhrkop_systematic_2021], which exceeds the
limitations of spectral library matching.  MCnebula has been implemented in the
R language, which means that it can be easily integrated into the diverse
biological analysis workflow of R. MCnebula (MCnebula2) was written primarily
in S4 system of object-oriented programming. This allows all data for one
analysis to be concentrated in one object from initial initiation to the end of
the analysis, facilitating data management and reproducible analysis.  In
addition to the MCnebula (MCnebula2 package included tools such as ABC
selection algorithm, Nebula visualization, statistical analysis, and output
report etc.), we also provide an additional 'exMCnebula2' package for downstream
analysis, which contains all the analysis tools used in this study, including:
pathway enrichment analysis, heat map clustering analysis, spectral
visualization analysis, chemical information query, etc.  Downstream analysis
of untargeted LC/MS-MS is complex and varies from data to data.  The additional
tools in exMCnebula2 package could provide a prototype for the expanded
application of MCnebula.

&ensp;&ensp; In this article, two datasets were applied to MCnebula in order to
demonstrate the broad utility of our method.  One was a human-derived serum
dataset that correlated with mortality risk profiling of staphylococcus aureus
Bacteremia (SaB); the other was a plant-derived herbal dataset that related to
the processing of herbal medicine.

# Results

## Overview

&ensp;&ensp; The MCnebula workflow was dedicated to analyzing LC-MS/MS datasets
from the beginning, i.e. starting from the raw data obtained from the sample
and going through the various stages of analysis to obtain a complete analysis
report (Fig. {@fig:data_stream}{nolink=True}).  The analysis process followed
the general MCnebula analysis templates, from filtering candidates of chemical
formula, structural formulae, chemical classes, to creating visual Nebulae; it
also allowed for custom advanced analysis, with the help of chemical class
focused Nebulae, to perform statistic analysis, features selection, focus on
critical metabolites (compounds) and their structural characteristics, pathway
enrichment, querying compound synonyms, etc.  We evaluated workflow of MCnebula
in function with other popular public available methods. In terms of the
evaluation of our chosen indicators which cover identification, classifying,
etc., MCnebula has a wider scope of applicability.  (Tab.
S{@s.tab:subEval}{nolink=True})

## Method evaluation

&ensp;&ensp; **Classified accuracy.** We used a public available reference
spectral library to assess the accuracy of classifying of MCnebula. The direct
use of such a reference spectral library may lead to over-fitting during the
evaluation. We have taken the approach of simulating noise to eliminate this
consequence. Simulating noise, i.e., adding invalid noisy data to the reference
spectrum or numerically shifting the existing data, also simulates data
acquisition similar to a real scenario: due to the different acquisition
conditions, the spectral data in the real case will be more noisy compared to
the reference spectrum.  By adding noise to the reference spectral library, we
now have three datasets for evaluation (origin, medium noise and high noise
dataset) (commonly 7524 compounds (spectra)).  All three datasets were analyzed
using MCnebula. Due to the richness of the compounds in the reference spectra,
for the origin dataset, we obtained a total of 152 chemical classes (each with
a corresponding compounds to be evaluated) via using ABC selection algorithm.
These 152 chemical classes include both chemical classes refined on the basis
of dominant structures and chemical classes refined on the basis of
substructures. To facilitate comparison with other methods, we selected only
chemical classes that are likely to be dominant structures for evaluation.
There were 37 such chemical classes that were selected for evaluation.

&ensp;&ensp; In order to evaluate MCnebula more objectively, we chose an
existing method as a benchmark method for parallel comparison. We finally chose
the molecular networking provided by GNPS (Global Natural Products Social
Molecular Networking) as the benchmark method because we considered that it is
also a visual analysis method that has been popular among chemists for a long
time. In GNPS, the workflow of Feature-based molecular networking (FBMN)
combined with MolNetEnhancer provides a way to classify compounds present in
spectral data. This is a traditional classified method, which first identifies
the exact chemical structure based on spectral data, and then determines the
chemical class based on the chemical structure.  We uploaded the three datasets
to the GNPS server and then obtained the results and used them for evaluation.
For origin dataset, GNPS resulted in a total of 44 chemical classes (parallel
to MCnebula, with at least 50 compounds per chemical class).

&ensp;&ensp; There were 19 common classes in total. These classes were selected
to compare MCnebula and GNPS in parallel in terms of classified number,
stability, and relative false rate. For the classified number, MCnebula
outperformed GNPS in three dataset (MCnebula: 199, 178, 160; GNPS: 162, 95, 81)
(Fig. {@fig:compare_accuracy}{nolink=True}a). For the stability of the
classifying after adding noise, MCnebula outperformed GNPS in two dataset
(MCnebula: 10.5%, 19.8%; GNPS: 41.7%, 50.1%) (Fig.
{@fig:compare_accuracy}{nolink=True}a).  For the last indicator, to assess the
performance of classifying, it combined the level of the stability to calculate
the relative false rate, rather than the absolute false rate.  The relative
false rate better simulated the actual application to LC-MS/MS analysis, since
the actual spectral data contains not only noise but also many unknown
compounds that cannot be identified by spectral matching. In this context,
MCnebula outperformed the GNPS in the evaluation of the relative false rate in
three dataset (MCnebula: 30.2%, 32.9%, 32.6%; GNPS: 51.9%, 48.8%, 47.6%) (Fig.
{@fig:compare_accuracy}{nolink=True}a). In addition to the three indicators
mentioned above, we also compared MCnebula and GNPS at the individual level for
the 19 chemical classes (Fig. {@fig:compare_accuracy}{nolink=True}b).
Remarkably, MCnebula was more stable to noise than GNPS.

&ensp;&ensp; **Identified accuracy.** Using MCnebula workflow, the origin
dataset containing 8057 compounds (precursor ions m/z &lt; 800), all of these
compounds were predicted with chemical molecular formulae, and of these, 6610
compounds were predicted with chemical structure.  These chemical structure
were evaluated for accuracy in a classified context.  For the 37 chemical
classes (Fig.  {@fig:compare_accuracy}{nolink=True}c), the average false rate
of identification was 37%; the average identified compounds number was 156.
Among them, most of the identified false rate were between 30% to 40%, however,
some classes were quite low, such as 'Long-chain fatty acids' or 'Lignans,
neolignans and related compounds'.  The reliability of the predicted chemical
structure can be assessed in terms of a score. Tanimoto similarity provides
such a score for each predicted chemical structure (it provides the matching
degree of chemical fingerprints with structures [@duhrkop_sirius_2019]). When
Tanimoto similarity sets the cutoff value to 0.5, the average false rate of
identification was 29.4%; the average identified compounds number was 139 (Fig.
 {@fig:compare_accuracy}{nolink=True}c).  Above we evaluated the accuracy of
the identification of compounds in each chemical class obtained by MCnebula. It
should be noted that MCnebula itself does not contain any module for
identification, it only utilized the top scoring candidate from the SIRIUS
predicted results for annotation. For more evaluation on identification please
refer to [@duhrkop_sirius_2019].

## Data analysis

&ensp;&ensp; **Serum metabolic analysis.** To illustrate the application of
MCnebula in metabolism, we re-analyzed the serum data from Wozniak et al.
[@2020s].  The serum samples were collected from patients with *Staphylococcus
aureus* bacteremia (SaB) or not and healthy volunteers.  Overall, the samples
were divided into **1)** control groups, involving NN (non-hospital,
non-infected) and HN (hospital, non-infected); **2)** infection groups,
involving HS (hospital, survival), HM (hospital, mortality).  

&ensp;&ensp; A total of 7680 'features' were detected while running with LC-MS
preprocessing on the serum dataset.  After predicting the compounds by MS/MS
spectra (with SIRIUS software), subsequent analysis was performed using
MCnebula.  Of these, 6501 'features' were annotated with molecular formula and
further, 3449 'features' were annotated with chemical structure.  Using ABC
selection algorithm: more than one thousand chemical classes were filtered out
in module of 'inner filter' (see method section of ABC selection algorithm);
508 chemical classes were filtered out while performing 'cross filter'; for the
remaining 41 chemical classes, 19 chemical classes were manually filtered out;
the final 22 chemical classes make up the Nebula-Index, and these chemical
classes would be visualized as Child-Nebulae. It is worth mentioning that the
filtered out 527 (508 + 19) chemical classes could be re-added to the analysis.
Herein, with the basic workflow of MCnebula, Parent-Nebula and Child-Nebulae
were obtained (Fig.  S{@s.fig:serum_parent}{nolink=True}, Fig.
S{@s.fig:serum_child}{nolink=True}).  By interrogating Child-Nebulae, we had a
basic insight into the chemical classes contained in the serum dataset. To mine
more information from Child-Nebulae: we performed a binary comparison of HS and
HM groups, ranking 'features' according to Q-value (adjusted P-value); the top
50 'features' were set as 'tracers' to mark them in Child-Nebulae (Fig.
{@fig:serum_tracer}{nolink=True}). By combining the features selection
algorithm about Q-value, the chemical classes exhibited in Child-Nebulae were
reduced. The log~2~(Fold Change) (log~2~(FC)) quantification for the HM versus
HS groups was visualized in Child-Nebulae (Fig.
S{@s.fig:serum_logFC}{nolink=True}).  In Fig.
S{@s.fig:serum_logFC}{nolink=True}, the overall level of 'Bile acids, alcohols
and derivatives' (BAs) class and 'Acyl carnitines' (ACs) (Fig.
{@fig:ac_node2}{nolink=True}a and b) class increased remarkably, while the
overall level of 'Lysophosphatidylcholines' (LPCs) class decreased remarkably.
Indeed, BAs, ACs and LPCs were reported associated with liver dysfunction,
imbalance of intestinal microphylactic homeostasis, and mortality risk
[@2021db; @2020s; @2016at]. By deep annotation of Child-Nebula, all three
classes of compounds have similar structural parent nuclei, and their levels in
the NN, HN, HS, and HM groups are similar (Fig.  {@fig:ac_node2}{nolink=True}c,
Fig. S{@s.fig:lpc_ba}{nolink=True}).  Subsequently, we performed cluster heat
map analysis and pathway enrichment analysis on the compounds of these three
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
(level 5) from 'Lipids and lipid-like molecules' family.  As a part of MCnebula
workflow, sulfur element is detectable for SIRIUS in isotopes pattern with high
mass accuracy [@bocker_sirius_2009].  However, for the MS/MS spectra of 'HEPC',
there was no candidate formula that harbouring sulfur element.  Overall, we
identified more compounds with the MCnebula workflow and many of the results
were in line with the analysis of Wozniak et al [@2020s]. All identified
compounds were collated in Tab. S{@s.tab:serum_compounds}{nolink=True}
(filtered with Tanimoto similarity &gt; 0.5 and de-duplicated with the first
hash block of InChIKey (molecular skeleton)).
The compounds (top 50 of EFS and MWU) that were not successfully identified via
spectral library matching by Wozniak et al. but were identified by our MCnebula
workflow for molecular formula or chemical structure were additionally
collated (Tab. S{@s.tab:serum_otops}{nolink=True}).

&ensp;&ensp; **Herbal medicine analysis.** *Eucommia ulmoides Oliv.* (*E.
ulmoides*) [@2021n], as a traditional Chinese medicine (TCM), after being
processed with saline water, was applied to the treatment of renal diseases for
a long time in China.  Due to its complex composition, discovering chemical
changes during processing (such as processed with saline water) is challenging.
MCnebula was instructive for addressing this challenge.  With the help of ABC
selection algorithm, the 29 chemical classes representing the richness of
composition of *E. ulmoides* were obtained.  Two groups of quantification data
were performed with binary comparison. The top 20 features (Top20) were
selected using function 'select_features' (|Log~2~(Fold change)| &gt; 0.3,
Q-value &lt; 0.05, Tanimoto similarity &gt; 0.5) and were traced in
Child-Nebulae (Fig.  S{@s.fig:herbal_tracer}{nolink=True}).  We used MCnebula
to draw the mirrored MS/MS and extracted ions chromatography (EIC) plots of the
Top20 (Fig. S{@s.fig:msms}{nolink=True} and S{@s.fig:eic}{nolink=True}).
According to Fig. S{@s.fig:eic}{nolink=True}, we speculated that the 'features'
of ID 1642, 1785, and 2321 were newly generated compounds because the peak area
levels before the processing were almost zero compared to after the processing.
Their chemical structures were shown in Fig. S{@s.fig:msms}{nolink=True}. Among
them, the 'feature' of ID 1642 has a higher probability of correct
identification (Tanimoto similarity: 0.69). Based on Fig.
S{@s.fig:herbal_tracer}{nolink=True}, we knew that 'feature' of ID 1642 belongs
to 'Iridoids and derivatives' (IAD), the others were 'Dialkyl ethers' (DE; ID
1785) and 'Phenylpropanoids and polyketides' (PAP; ID 2321). We annotated in
depth of the Child-Nebulae of IAD, DE and PAP respectively. The locations of
the 'features' of ID 1642, 1785 and 2321 in the Child-Nebulae were interrogated
(Fig. S{@s.fig:complex}{nolink=True}a, b, and c). Only the 'features' of ID
1642 had neighboring 'features' and their identified chemical structures (ID
2110 and ID 854) had similar parent nuclei. The 'features' of ID 2110 and ID
854 were well been identified with chemical structure (Tanimoto similarity:
0.69 and 0.7 respectively) (Fig. S{@s.fig:complex}{nolink=True}d, e, and f);
their levels of peak area were decreased and increased after the processing.
Based on the chemical structures shown in Fig. S{@s.fig:complex}{nolink=True}d
and e, we speculated that the compound of ID 2110 was partially converted to
the compound of ID 854 after the processing, which may involve chemical changes
such as dehydration and rearrangement. Such speculation explained the
alteration of the levels of peak area. In addition, the increasing in the level
of the compound of ID 1642 (its spectra were shown in Fig.
S{@s.fig:msms}{nolink=True} and S{@s.fig:eic}{nolink=True}) may also be
associated with the reduction of the compound with ID 2110.

&ensp;&ensp; The methods of MCnebula we have demonstrated for discovering
significant compounds and discovering chemical changes can be applied to
explore more compounds in Tab. S{@s.tab:herbal_compounds}{nolink=True}, but we
would not expand on this description here.

# Discussion

&ensp;&ensp; The analysis of untargeted LC-MS/MS data is challenging because of
its large data volume and the unknown nature of the potential information as
well as the limited size of the current reference spectral library. Researchers
often need to map out critical compounds from this black box to advance to the
next step in biology, but this process was time consuming. We developed
MCnebula to advance this process. MCnebula assists researchers in focusing on
potential critical compounds by combining full-spectrum identification with
machine prediction, visualization of sub-nebulae in a multi-dimensional view,
and statistical analysis to track top 'features' and find analogues.  The ABC
selection algorithm can summarize a representative chemical class in a dataset
and obtain the features to that class, so that the overall direction of the
study is not biased; it is an effective guarantee for statistical analysis to
produce top features for tracing analysis. Because the results of statistical
analysis may be biased, filtering on the basis of chemical classes can prevent
bias. The Child-Nebula mapped on the basis of the chemical classes obtained by
the ABC selection algorithm makes it visualizing the huge untargeted dataset as
a single graph. It is important to stress that the parameters of the ABC
selection algorithm are subjectively adjustable and they should be determined
according to the richness of the chemical class of the studied object. In
general, our default parameters used to acquire the chemical classes that are
abundant in variety in the dataset and filter out those that are too large or
too small in conceptual scope.

&ensp;&ensp; For identification, spectral library matching is still the
mainstay of MS/MS data analysis because of its high accuracy. The general
classifying of compounds is also based on it, i.e., the chemical structure is
first identified by spectral matching, and then its chemical class is evaluated
based on the chemical structure.  However, the classifying technique (CANOPUS
[@duhrkop_systematic_2021]) incorporated in MCnebula bypassed the step of first
identifying the chemical structure and predicted the possible chemical class
even if the exact chemical structure was not known. MCnebula combined this
cutting-edge technology with ABC selection algorithm and visualization of
Child-Nebulae to make it possible to explore unknown compounds. We have
compared the classifying method of MCnebula with GNPS of which method relies on
chemical structure identification.  Since we choose the reference spectral
data, which was included in the matching library of GNPS, for the origin
dataset, the classifying method of MCnebula was not as good as GNPS in terms of
accuracy and the classified number. However, when different levels of noise
were added, the number of classified compounds of GNPS decreased remarkably
compared to the stable performance of MCnebula.  For the actual acquired MS/MS
spectra, they were often not as good as the reference spectra and contained
some noise. This means that the conditions we evaluate are actually present.
Using MCnebula can avoid failure to classify due to noise.  At the end of the
evaluation, we examined the accuracy of the MCnebula identification, although
its identification technologies belongs to SIRIUS [@duhrkop_sirius_2019], and
we confirmed that the accuracy of its identification fluctuated around 70%.

&ensp;&ensp; We used serum metabolomics data to illustrate that MCnebula can be
used for pathway spotting and Biomarker discovery.  Most of our identification
were in line with that of Wozniak et al., except that we identified more
metabolites that beyond the scope of spectral library matching.  Three of the
four top metabolites identified by Wozniak et al. were consistent in our
re-identification, leaving one controversial. ACs compounds mentioned by
Wozniak et al. for their correlation with SaB disease were also re-identified
in our study.  Wozniak et al. used a joint approach of Ensemble Feature
Selection (EFS) and Mann-Whitney U (MWU) tests to screen top metabolites
[@2020s]. It should be added that when we compared the 50 top 'features'
obtained by the 'binary comparison' method integrated in MCnebula with the top
50 metabolites (top 50 of EFS and 50 of MWU) obtained by the joint method of W et
al., we found a total of 37 overlaps, including the key metabolite of
L-Thyroxine in the study of W et al.  Top 'features' can differ depending on
the feature selection algorithm.  The reliability of the 'binary comparison'
method is indirectly illustrated by our ranked results with those of Wozniak et
al.  In addition to the consistent parts, with MCnebula, we have more findings
about other chemical classes associated with SaB disease.  We discovered
additional classes, i.e. 'Lysophosphatidylcholines' (LPCs) and 'Bile acids,
alcohols and derivatives' (BAs), that were not concerned in previous study.
Previously, LPCs have been extensively investigated in the context of
inflammation and atherosclerosis development [@2020cv; @2016at; @2014ao;
@2003n].  In a recent review [@2020cv], the complex roles of LPCs in vascular
inflammation have been well described, involving the context-dependent pro- or
anti-inflammatory action, impact in innate immune cells and adaptive immune
system, etc.  Decreasing level of LPCs was associated with wild range of
diseases of increasing mortality risk [@2016at].  The investigation of spesis
indicated LPCs concentrations in blood were established correlation with severe
sepsis or septic shock [@2014ao]. LPCs was reported inversely correlate with
mortality in sepsis patients [@2003n].  BAs' disorder implied a liver
dysfunction and imbalance of intestinal microphylactic homeostasis [@2021dg].
The chemical multiversity of BAs, which were discovered in the BAs'
child-nebula, were determined by the intestinal microbiome and allowed for a
complex regulation of adaptive responses in host.  In our study, the level of
BAs showed higher correlation with SaB infection than ACs.  The decreased level
of LPCs suggested a mortality risk of SaB infection.  From LPCs to BAs,
steroids related classes, 'Lineolic acids and derivatives', and other fatty
acids related classes, showed that liver played a central role in SaB infection
and mortality.  Liver X receptors (LXRs) harboured pivotal roles in the
transcriptional control of lipid metabolism [@2018bd].  LXRs modulate membrane
phospholipid composition through activation of lysophosphatidylcholine
acyltransferase 3 (LPCAT3), which directly related to LPCs [@2021di]. The above
classes showed correlation with LXRs [@2018bd].  Unfortunately, LXRs's specific
role in SaB infection or mortality has not been documented and beyond the scope
of this research.

&ensp;&ensp; In herbal dataset analysis, we showed a quick identification and
exploration of chemical changes in Child-Nebulae with a scope of chemical
classes.  The main components of _E. ulmoides_ were lignans, iridoids,
phenolics, flavonoids, steroid and terpenoids [@2021bi].  In our study, the
chemical classes obtained by ABC selection algorithm include 'Lignans,
neolignans and related compounds' (LNARC) and 'Iridoids and derivatives' (IAD),
as well as 'Monoterpenoids' and 'Terpene glycosides'; the flavonoids were
covered by 'Phenylpropanoids and polyketides' (PAP) [@2016] and phenolics may
found in 'Methoxyphenols'. The flavonoids were similar to the steroids and were
not retained in selected results as 'Flavonoides' and 'Steroids and steroid
derivatives', because they were not as abundant in _E. ulmoides_ (bark) as
LNARC and IAD.  Many of the compounds we identified in chemical classes of
LNARC and IAD (Tab. S{@s.tab:serum_compounds}{nolink=True}) have been reported
in previous research about LC-MS/MS analysis of _E. ulmoides_ [@2014w; @2015v;
@2016aj; @2018ah; @2019am; @2021bt].  We obtained top features based on
statistical comparison of the changes in 'features' quantification levels
before and after processing. One of the compounds that changed significantly or
even was newly produced (ID: 1642) was traced into the Child-Nebulae. We then
hypothesized that it was related to two structurally similar compounds by
transformation.  The application of MCnebula in the analysis of plant-derived
compounds was illustrated with this example of quick identification and
exploration of chemical changes.  In contrast to reference spectral library for
human-derived metabolites, which are more likely to be commercially valuable,
the spectra for plant-derived compounds was more scarce.  Although some
specific database of plant-derived compounds have been constructed [@2015ak;
@2012ac], there were lack of enough fragmentation spectra for comprehensive
library match.  With the help of MCnebula, mostly via retrieving structural
libraries, a rapid and reliable resolution of complex compositions of
plant-derived can be achieved.  

&ensp;&ensp; In this article, due to limited space, few examples demonstrated
MCnebula application.  Indeed, MCnebula has a great potential in the field of
chemistry, pharmacy and medicine.  The latter, beyond this article, e.g.,
fields of application include natural products, foodomics, environmental
research etc.  As an integrated visualization method, MCnebula possibly be more
popular with biologists or chemists.  MCnebula has been proposed and
implemented in the R language with package MCnebula.  In the future, its
methods and application will be extensively expanded.

# Methods

## MCnebula algorithm

**Overall consideration** We knew that the analysis of untargeted LC-MS/MS
dataset generally begin with feature detection.  It detected 'peaks' as features
in MS^1^ (MASS level 1) data.  Each feature may represents a compound, and
assigned with MS^2^ (MASS level 2) spectra.  The MS^2^ spectra was used to find
out the compound identity.  The difficulty lied in annotating these features to
discover their compound identity, mining out meaningful information, so as to
serve further biological research.  In addition, the untargeted LC-MS/MS
dataset was general a huge dataset, which leads to time-consuming analysis of
the whole process.  Herein, a classified visualization method, called MCnebula,
was used for addressing these difficulty.

The MCnebula package itself did not contain any part of molecular formula
prediction, structure prediction and chemical prediction of compounds, so the
accuracy of these parts was not involved.  Currently, MCnebula performed
downstream analysis by extracting the prediction data from SIRIUS project.  The
core of MCnebula was its chemical classes filtering algorithm, called
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
of candidates now, MCnebula extracted these candidates and obtained the unique
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


Ether by functions in MCnebula of 'filter_formula()', 'filter_structure()' or
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


Whether it is all filtered by the algorithm provided by MCnebula function or
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

_Cross filter by 'quantity'_ (abundance selection).  Set 'features' quantity
limitation for each group (each group, i.e. a chemical class with its
classified 'features').  The groups with too many 'features' or too few
'features' would be filtered out.  This means the chemical class would be
filtered out.  These thresholds are about:

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

_Cross filter by 'score'_ (Goodness assessment).  This step associate Stardust
Classes data with 'features' annotation data.  For each group, the Goodness
assessment is performed for each target attribute (continuous attribute,
generally be a scoring attribute of compound identification, such as 'Tanimoto
similarity').  If the group met all the expected Goodness, the chemical class
would be retained; otherwise, the chemical class would be filtered out. The
Goodness ($G$) related with the 'features' within the group:

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

_Cross filter by 'identical'_ (identicality assessment). A similarity
assessment of chemical classes.  Set a hierarchical range for chemical
classification and let groups within this range be compared for similarity to
each other. For two groups, if the classified 'features' almost identical to
each other, the chemical class represented by one of the groups would be
discarded.  The assessment of identical degree of two groups (A and B):

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
top candidate of chemical formula and structure (obtained with the MCnebula
function 'filter_*()').  The MS/MS spectral similarity (dotproduct) of the
'features' was calculated and used to form the edge data for the network graph.

**Visualization system** MCnebula used a number of existing R packages to
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

**Statistic analysis** MCnebula integrated the functions (mainly for:
'limma::makeContrasts', 'limma::lmFit', 'limma::lmFit', 'limma::eBayes') of the
'limma' package for differential expression analysis (analysis of RNA-sequence
and microarray) and packaged them for differential analysis of metabolomics
data [@gentleman_limma_2005-1; @ritchie_limma_2015].  The gene expression
matrix and the feature quantification matrix of LC-MS are similar in that both
have corresponding explanatory variables (sample information) and dependent
variables (gene expression values or feature quantification values), except
that one represents the level of gene expression and the other the level of
metabolite.  We normalized the peak area levels of the features and transformed
(log2) them, used the metadata information of the samples to create the design
matrix and the contrast matrix [@gentleman_limma_2005-1; @ritchie_limma_2015];
thus even if the data itself is not gene related, it can be performed
differential analysis using the tools of the 'limma' package.  The 'limma' is a
powerful package for differential analysis using linear models that can handle
not only simple experimental designs in which the explanatory variables are
factors (e.g., Control group versus Model group), but also complex experimental
designs in which the explanatory variables are covariates (e.g., groups
containing time series).  However, our packaged method was only appropriate to
experimental designs in which explanatory variables are factorial variables and
the design matrix without intercept (code: 'model.matrix(~ 0 + group)')
[@law_guide_2020]. Because of its simple applicability, we called it as 'binary
comparison'.  Our evaluation section does not cover its evaluation (as it is
not the main part of this study), but we used it in two demo datasets and
validated them to some extent: in the serum dataset, we compared our obtained
top 'features' with that of Wozniak et al. [@2020s]; in the herbal dataset, we
traced the obtained top 'features' to the EIC plot.

**Data structure** MCnebula was written mainly in R S4 system of
object-oriented programming.  When analyzing data with MCnebula, all data
(whether 'features' annotation data or visualization data) was stored in a one
object (class 'mcnebula').  This reduced the difficulty of using the MCnebula
package, and made the data easy to manage and the analysis easy to repeat.

**Report system** MCnebula integrated a reporting system that allows the
analysis process to be output as a PDF document or in other formats. The
reporting system was based on the data class 'report', which could stores each
step of the analysis as a section and could be flexibly modified according to
the user's needs. In addition, the reporting system can be used to generate
reports even if the analysis is completely irrelevant to MCnebula package.
The reporting system was associated with the 'rmarkdown' R package
[@allaire_rmarkdown_2022; @xie_r_2020; @xie_r_2018].

**Code Compatibility** MCnebula performs downstream analysis by extracting the
data from the already computed SIRIUS project.  The SIRIUS project is the main
source of data for MCnebula 2. The SIRIUS software is still being updated and
improved. In fact, from SIRIUS version 4 to version 5
(<https://github.com/boecker-lab/sirius>), the data structure and attributes
name in the project directory have changed. In order that the functionality of
MCnebula is not invalidated due to versioning issues, its application program
interface (API) for the SIRIUS project has been designed to be flexible.
MCnebula is able to perform data extraction for different SIRIUS versions.

## MCnebula evaluation

&ensp;&ensp; **Spectra dataset for evaluation.** The spectra collection (in
positive ion mode, for more spectra data) of GNPS MS/MS library were used for
evaluation (.msp file)
(<http://prime.psc.riken.jp/compms/msdial/main.html#MSP>).  As Fragmentation
spectra in reference library generally possess high quality, and while used for
evaluation of library match, it may caused overfitting. To address the issue,
refer to ref. [@2021], we added 'noise' into these MS/MS spectra. In brief, the
'noise' involves mass shift, intensity shift, and the inserted noise peak; of
note, the magnitude factors for these shift were drawn randomly from function
of normal distribution. Overall, we simulated two model of 'noise' (medium
noise and high noise). The 'noise' simulation was achieved in custom R script.
The algorithm and parameters were parallel to the reference [@2021]. We assign these
datasets as origin dataset, medium noise dataset and high noise dataset. The
details of simulation of noise were as following:

  - A global mass shift was simulated by drawing a random number $\delta^*$ from
  $N(0,\sigma^2_{mb})$ (Normal distribution) and then shifting every peak mass
  $m$ by $\delta^*m$. The standard deviation $\sigma_{mb}$ was chosen as
  $\sigma_{mb} = (10/3) \times 10^{-6}$ (medium noise) or $\sigma_{mb} = (15/3)
  \times 10^{-6}$ (high noise), so that the $3\sigma_{mb}$ interval represents a
  10-ppm shift for medium noise and a 15-ppm shift for high noise.

  - Individual mass deviations was simulated by drawing, for each peak with mass
  $m$ individually, a random number $\delta$ from $N(0,\sigma^2_{md})$ and
  shifting the peak by $\delta m$. The standard deviation $\sigma_{md}$ was
  chosen so that the $3\sigma_{md}$ interval represents a 10-ppm shift for medium
  noise and a 20-ppm shift for high noise.

  - Intensity variations were simulated in the spectrum. Each peak intensity was
  multiplied by an individual random number $\epsilon$ drawn from
  $N(1,\sigma^2_{id})$. Variance was chosen as $\sigma^2_{id} = 1$ for medium
  noise and $\sigma^2_{id} = 2$ for high noise. 0.03 times the maximum peak
  intensity of the spectrum was subtracted from each peak intensity. If a peak
  intensity fell below the threshold of one thousands of the maximum intensity
  in the spectrum, the peak was discarded.

  - Additional 'noise peaks' were added to the spectrum. In processing of
  origin dataset, a pool of 'noise peaks' was gathered from the fragmentation
  spectra, using all peaks that did not have a molecular sub-formula
  decomposition of the known molecular formula of the precursor. For each
  spectrum, $\alpha n$ of these 'noise peaks' were added to the spectrum, where
  $n$ is the number of peaks in the spectrum and $\alpha = 0.2$ for medium
  noise and $\alpha = 0.4$ for high noise. Intensities of 'noise peaks' were
  adjusted for maximum peak intensities in the contributing and receiving
  spectrum. 'Noise peaks' were randomly drew from the pool of 'noise peaks' and
  added to the spectrum.

&ensp;&ensp; For another issue, the spectra collection did not possess isotopes
pattern. In real LC-MS processing (feature detection), isotope peaks were
grouped and merged, which favorable for SIRIUS to detect some specific element
[@bocker_sirius_2009]. To simulate isotopes pattern, we used function of
'get.isotopes.pattern' within 'rcdk' R package to get isotope mass and its
abundance [@2007j]. Further, these mass were considered for the adduct type to
increase or decrease exact mass. For the 'intensity' of these isotopes pattern,
we simulated as relative intensity, i.e., the abundance of isotopes multiply by
100 as the value. These 'isotope peaks' were merged into MS^1^ list of its
compounds. All the spectra collections were formatted to fit with input of
MCnebula workflow or benchmark method (.mgf file and feature quantified table
.csv).  

&ensp;&ensp; **Evaluation method.** The three simulated data were all run with
MCnebula workflow and benchmark method. While these data were put into SIRIUS 4
command-line interface (CLI) (version 4.9.12) for computation, the MS/MS
spectra with empty fragmentation peak were auto-filtered. In addition, to
reduce computation time, the compounds with over 800 m/z precursor were
filtered out manually. These filtered out compounds were excluded from ultimate
accuracy assessment. There were 8782 MS/MS spectra within the raw collection, and after
filtered or excluded, totally 7524 compounds for ultimate evaluation.

&ensp;&ensp; The assessment of classified accuracy was conducted with the help
of ClassyFire [@2016]. In detail, we traversed the raw .msp spectra file to
collate metadata of these compounds, involving structure annotation. The
International Chemical Identifier Key (InChIKey) of these compounds were
available for ClassyFire database retrieve.  However, since ClassyFire only
support for those chemical identity of which structure have been classified in
its server previously, we noticed all the InChIKeys were vetoed.  To address
that, we employed first hash block of these InChIKeys (InChIKey planar,
represent molecular skeleton) to touch PubChem application programming
interface (API) (<https://pubchemdocs.ncbi.nlm.nih.gov/pug-rest>) [@2022ak].
Accordingly, we got all the possibly InChIKeys of isomerism (stereo, isotopic
substitution) [@2012e]. The classification of small molecules are depending on
its molecular skeleton hence these chemical identities possess the same
InChIKey planar are identical in classification.  We pushed the obtained
InChIKey list to ClassyFire to obtain classification. In R script, once any
InChIKey of isomerism meet the classified data in database, the acquisition
status for this molecular skeleton was turn off.  In the end, all these
chemical annotation were collated, integrated and assigned as standard
reference.  

&ensp;&ensp; The discrepancies between the MCnebula and benchmark methods in
terms of algorithm and classified results disallow them to be evaluated at
completely the same level. We evaluated both methods respectively. For
MCnebula, before assess the accuracy, we interrogated the obtained classes
generated from pre-analysis of the origin dataset.  The classes over in half
were classified based on sub-structural class, such as 'Organic carbonic acids
and derivatives', 'Hydroxy acids and derivatives'.  These classes were small in
structural size and were chemical function group within compounds.  The
principle of ClassyFire is selecting the most dominant structural class of
compounds to substitute [@2016].  But, in perspective of drug discovery,
structure determines potency; many pharmacological action possibly depends on
these sub-structure.  To locate more universality among features, in algorithm,
we reserved these classes in results.  Sub-structural classify for benchmark
method not available, hence we neglected these classes in evaluation.  The rest
classes, nevertheless, still possibly be sub-structural class while meet some
compounds. We assigned three levels for evaluation, i.e., 'True', 'Latent',
'False'. The 'True' indicated the classified classes were in line with that of
ClassyFire.  The 'Latent' indicated the classified classes were not in line
with that of ClassyFire, but their parent classes of 'class' level  were in
line with that of ClassyFire.  The 'False' indicated the classified classes
were completely inconsistent with that of ClassyFire.

&ensp;&ensp; To assess the identification of classes or structures, the results
were merge with standard reference by InChIKey planar.  For assessment of
identification of chemical structure, once the identified chemical structure
was in line with or chemical structure (match by InChIKey planar), we assigned
it as 'true'. Indeed, such evaluation neglect stereochemistry.

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
to detect Iodine element while predicting formula.  MCnebula package were used
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
@duhrkop_sirius_2019]. MCnebula (MCnebula2) and other R packages were executed in Pop!_OS
(Ubuntu) 22.04 LTS 64-bits PC (Intel Core i7-1065G7, 1.3 GHz $\times$ 8, 16 Gb
of RAM).

# Data and code availability

&ensp;&ensp; The serum dataset were available at MassIVE web service (id no.
[MSV000083593](https://massive.ucsd.edu/ProteoSAFe/QueryMSV?id=MSV000079949)).
The source code of MCnebula is available at
<https://github.com/Cao-lab-zcmu/MCnebula>.  The source code of exMCnebula2 is
available at <https://github.com/Cao-lab-zcmu/exMCnebula2>.  The code for all
the analysis in this study can be found in the internal data directory
('inst/extdata/') of the 'exMCnebula2' package.  In addition, .mgf files (msms
spectra) and .csv files (feature quantification) and SIRIUS output files (use
MCnebula function to filter and compress tens of GB of data to just a few tens
of MB) and analysis report of serum and herbal dataset were compressed and
stored in the exMCnebula2 package. By downloading and installing MCnebula
package and exMCnebula2 package, all the analyses of this study can be
reproduced by executing R codes (while using tools beyond R, such as MSconvert
software, SIRIUS 4 software and MZmine2 are excluded).

[annotation]: ----------------------------------------- 

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
