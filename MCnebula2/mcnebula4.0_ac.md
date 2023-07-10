# MCnebula: Critical chemical classes to classify and boost identification by visualization for untargeted LC-MS/MS data analysis

**Lichuang Huang^1, 2 #^, Qiyuan Shan^1, 2 #^,** **Qiang Lyu^1^, Shuosheng
Zhang^3^, Lu Wang^1, 2\*^, Gang Cao^1, 2\*^**

^1^ School of Pharmacy, Zhejiang Chinese Medical University, Hangzhou, China

^2^ Jinhua Institute, Zhejiang Chinese Medical University, Hangzhou, China

^3^ College of Chinese Materia Medica and Food Engineering, Shanxi University
of Chinese Medicine, Jinzhong, China.

^\#^These authors contributed equally to this work

\*Address correspondence to:

**Lu Wang, Ph.D.**

School of Pharmacy, Zhejiang Chinese Medical University, No. 548 Binwen Road,
Hangzhou, Zhejiang 310053, China; E-mail: luwang0520@163.com

**Professor Gang Cao, Ph.D.**

School of Pharmacy, Zhejiang Chinese Medical University, No. 548 Binwen Road,
Hangzhou, Zhejiang 310053, China; Tel/Fax: +86 571 87195895; E-mail:
caogang33@163.com

## Abstract

   Untargeted mass spectrometry is a robust tool for biology, but it
usually requires much time on data analysis especially for system
biology. We established a framework called MCnebula (Multiple-Chemical
nebula)  to facilitate mass spectrometry data analysis process by
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
investigated a plant-derived dataset of herbal *E. ulmoides* to achieve
a rapid unknown compound annotation and discovery.

\includegraphics{tocg.pdf}

**Keywords:** Mass spectrometry, visualization, chemical classes,
identification, MCnebula

## Introduction

   Analyzing untargeted liquid chromatography/tandem mass spectrometry
(LC-MS/MS) dataset is complicated, due to the massive of data volume,
complexity of spectra and structural diversity of compounds. In the past
decades, a lot of researchers attempted to address the issues. Many
technical software or web-based interfaces were developed to provide a
one-stop bulk solution for data analysis
 [@2020p; @2018az; @2020co; @2016a]. These solutions applied or
suggested flexible mass spectra processing tools or analogous algorithms
 [@2012d; @2016e; @2006a; @2010]. To reduce false-positive and
false-negative results, more algorithms have been implemented for peak
deconvolution, feature selection or statistical filtering
 [@2017f; @2022; @2017ao; @2022b]. Every feature corresponding to a
compound within sample or parallel samples was prevalently equipped with
fragmentation spectra for identification. In this context, researchers
have to be confronted with a problem: how to identify so many compounds
accurately and quickly?

   Until today, several strategies have been developed for identifying
compounds with fragmentation spectra. **1)** Spectral library matching.
A number of public available databases were built to settle that via
achieving re-usability of reference fragmentation spectra, such as
MassBank, MassBank of North America (MoNA), Global Natural Products
Society molecular networking (GNPS)
 [@2016a]. In the
meanwhile, these fragmentation spectra are available via their web
servers, third-party platform (e.g.,
[CompMass](http://prime.psc.riken.jp/compms/msdial/main.html#MSP%3E)) or
specific tools (MASST)  [@2020cm]. However, compared with
structure database (PubChem harbours over 100 million records), spectral
library is too small in size that limit the application of mass
spectrometry. To cross this barrier, **2)** *In silico* simulation by
fragmentation spectra. *In silico* tools have been increasingly
developed for simulating fragmentation spectra
 [@2010c; @2015c; @2016am; @2017aq]. Some databases such as MoNA
collated *in silico* fragmentation spectra and were available for public
 [@2013w]. **3)** *In silico* prediction with matching
learning. At present, the algorithms made machine training from
reference mass dataset or libraries, then 'learned' how to predict
chemical fingerprints or principles so as to retrieve the correct
structure from molecular structure database [@2012ab; @duhrkop_searching_2015; @2018ay].

*In silico* methods are developing quickly.  Currently, the cutting-edge
technology, called SIRIUS 4 [@duhrkop_sirius_2019], integrates many advanced
artificial intelligence algorithms and has achieved an accuracy rate of 70%
when retrieving from molecular structure database.  This method helps to
identify metabolites beyond the scope of spectral libraries.  While *in silico*
tools boost chemical identification, it is still lack of a proper framework
that could incorporate and leverage SIRIUS 4 into user-friendly way for
biological research, such as biomarker discovery and pathway analysis of mass
spectral dataset. Compounds annotation and screening of biomarkers manually are
both time-consuming and the results are impressed by subjective factors.
Molecular networking is more and more popular due to its visualization and data
transparency. Molecular networking was a spectral correlation and visualization
method that can detect spectra from related molecules (so-called spectral
networks), even when the spectra were not matched to any known compounds
[@2016a]. Based on the concept of molecular networking, we proposed an idea,
clustering features for visualization of chemical classification probably
contribute to the discovery of biomarkers and metabolic pathway analysis.

   The history of classification in chemistry dated back to the middle
of the last century. The Chemical Fragmentation Coding system was
firstly developed by Derwent World Patent Index (DWPI) in 1963. Until
recent years chemical classification like Gene Ontology (GO)
 [@2000g] which was organized with taxonomy and ontology was
proposed more systematically  [@2016]. ClassyFire is popular
for compound annotation in LC-MS dataset analysis due to its computation
available and systematicness  [@2019bt; @2019br; @2019bs; @2019bq].
The taxonomy and ontology is robust and useful for chemistry. For
example, a hierarchical classification-based method, called Qemistree,
was proposed to analyze mass spectrometry data by expressing molecular
relationships as a tree, which could be represented in the context of
sample metadata and chemical ontologies  [@2021b].

Untargeted metabolomics is a field of omics science that uses
cutting-edge analytical chemistry techniques and advanced computational
methods to characterize complex biochemical mixtures aimlessly.
LC­MS-based untargeted metabolomics is very popular due to its high
sensitivity, small sample volume and direct injection without separation
etc.  [@2016aq]. With the help of statistical methodologies,
researchers could screen and identify more-informative disease
biomarkers from thousands of LC-MS features, to aid the design or
development of improved treatments and to better assess health outcomes
 [@2016ar]. These statistical approaches mainly involved
classical statistic and artificial intelligence models(e.g., random
forests)  [@2019bv]. Both approaches were inevitable to
introduce specific biases, owing to the complexity of feature set or
algorithmic stability  [@2017i]. Furthermore, analyzing at
feature level (quantification of the peak area
relating to the 'features') was unable to profile systematic effects on
metabolites unbiased  [@duhrkop_systematic_2021]. In this view, analyzing
at chemical classified level (classifying of 'features' with the
knowledge of systematic chemical classification) may be a better settlement. However, it
shouldn't be ignored that the differences of metabolites at the same
classified level. For example, small-molecules belonging to 'Indoles and
derivatives' had structural dependent affection on aryl hydrocarbon
receptor (AHR)  [@2019c]. Different structural
characteristics will lead to diverse activities. The settlement for that
is integrating both 'feature' level statistic and classified level
assessment.

   In addition to chemical classifying and statistical analysis,
clustering visualization was also a popular tool for untargeted mass
spectrometry data analysis. Over the last decade, Global Natural
Products Social Molecular Networking (GNPS) is more and more popular as
a clustering visualization tool based on MS dataset. GNPS applied
molecular networking connecting mass spectra of molecules based on the
similarity of their fragmentation patterns
 [@2012a]. Unfortunately, molecular
networking of GNPS mainly depend on on spectral similarity instead of
compounds structural or classified similarity. For example, flavonoids
consist of an aromatic ring joined to an oxygenated heterocyclic ring
linked to a phenyl group,which were expected to be clustered together
since its specific class and structural similarity. However, , it was
reported that some compounds belonging to flavonoids happened to be
absent from the cluster of other flavonoids compounds in previous
research  [@duhrkop_systematic_2021]. Thus, clustering
visualization in a classified level is a better choice for untargeted
mass spectra dataset. Earlier in 2012, the concept of molecular
networking with visualization for mass data analysis was proposed for
the first time  [@2012a] but *in silico* tools for predicting
compound classification by fragmentation spectra were not available at
that time. Nowadays, with the development of automatic classified *in
silico* tools  [@2016], it is time for a revolution of the
visualization strategy with higher confidence in classified level.

   For above consideration, we proposed a comprehensive framework, named
MCnebula (<https://mcnebula.org/>), for untargeted LC-MS/MS dataset analysis.
MCnebula integrated
a new abundance-based classes (ABC) selection algorithm for chemical
classes selection. The principle of ABC selection algorithm: (1) applied
an initial filtering to thousands of chemical classes based on the
predicted probability, (2) regarded all 'features' as a whole, examined
the number and abundance of 'features' of each chemical classification
(classification at different levels, classification of sub-structure and
dominant structure), and then selected representative classes, (3) these
chemical classes were followed by goodness assessment (about
identification of its classified compounds) and identicality assessment
(the extent to which these chemical classes are distinguished from each
other in the context of MS/MS spectra). The final chemical classes would
serve to the subsequent analysis: visualized as Child-Nebulae and focus
on these chemical classes (or Nebulae) for biomarker or chemistry
discovery. The top 'features' based on statistical analysis could be set
as tracer to discover more homology compounds of chemical structure or
spectral similarity or chemical class. MCnebula can be used to explore
unknown compounds because of the annotation module and the cutting-edge
technology of SIRIUS software
 [@duhrkop_searching_2015; @duhrkop_sirius_2019; @duhrkop_systematic_2021; @bocker_sirius_2009; @2015; @ludwig_database-independent_2020],
which exceeded the limitations of spectral library matching. MCnebula
was implemented in the R language and can be easily integrated into the
diverse biological analysis workflow of R. MCnebula (updated to
MCnebula2, which included more tools such as ABC selection algorithm,
Nebula visualization, statistical analysis, and output report etc.) was
written primarily in S4 system of object-oriented programming. It
allowed all data for one-button analysis from the beginning to the end,
which facilitated data processing. In addition to the basic function of
MCnebula), we provided an additional 'exMCnebula2' package for
downstream analysis, which contained all the analysis tools used in this
study such as pathway enrichment analysis, heatmap clustering analysis,
spectral visualization analysis, chemical information query, etc.
Downstream analysis of untargeted LC/MS-MS is complex and varies from
data to data. The additional tools in exMCnebula2 package could provide
a prototype for the expanded application of MCnebula.

   In this article, two datasets were applied in MCnebula in order to
demonstrate the broad utility of our method. One was a human-derived
serum dataset that correlated with mortality risk profiling of
staphylococcus aureus Bacteremia (SaB); the other was a plant-derived
herbal dataset that related to the traditional processing of herbal
medicine.

## Experimental section

### MCnebula algorithm

**Overview**. The analysis of untargeted LC-MS/MS datasets typically
starts with feature detection. Annotating these features is
time-consuming and extracting useful information for further biological
research can also be challenging. To address these issues, we present
MCnebula, with an abundance-based classes (ABC) selection algorithm, to
boost mass spectrometry data analysis by focusing on critical chemical
classes and visualization in multiple dimensions.

**Molecular formula and chemical structure prediction**. The analysis of
MS/MS spectra involve a process of inference and prediction. We deduce
the molecular formula based on the molecular weight of elements
composition and possible fragmentation pattern of the MS/MS spectrum by
SIRIUS; We then search for the exact chemical structure from compound
structure databases. However, this process is often uncertain as several
factors can affect the reliability of MS/MS data and the correctness of
inference. SIRIUS generates a list of candidates for the potential
molecular formula, chemical structure, and chemical classification
behind each MS/MS spectral feature. In such cases, MCnebula extract
these candidates and determine the unique molecular formula and chemical
structure for each MS/MS spectrum based on the highest score of
prediction.

**Top candidate selection by multiple score systems**. After the process
of compound prediction, we get candidates for molecular formula,
structure, and chemical classes. Some candidates are correct while
others are not. While the correct predictions for molecular formula and
chemical structure are unique, the chemical classification may have
multiple correct predictions belonging to different classes of hierarchy. The
scoring method depends on personalized research purpose. We can use scores based on
various criteria such as isotopes, mass error, structural similarity,
or chemical classes to rank and filter the candidates. With numerous
score systems available, we filter out low-scoring candidates and focus
on those with higher scores, which are more likely to be the correct
compound. However, in most cases, the top candidates from the three
scoring systems are not always consistent. So, we choose a 'specific
candidate' as a reference in the user-selected scoring system and
retrieve its chemical information from the other systems for data
integration. We obtain unique molecular formulae and chemical structure
for the reference by scoring and ranking, but for chemical classes, more
work is needed.

**Chemical classification**. Compounds with MS/MS spectrum can be
classified based on their overall structure or local structure, which
we refer to as the dominant structure and substructure, respectively.
Therefore, in the chemical classification system, we can classify
compounds not only based on their dominant structure, but also based on
their substructure. When the dominant structure is unavailable, or the
MS/MS spectral fragment is insufficient, we classify the compounds using
substructure information to gain knowledge of the compound.
Note: Classifying compounds based on their dominant structure is
straightforward. For example, we classify Taxifolin as a Flavone, not a
phenol, even though its local structure contains a phenol substructure.
We prefer to classify compounds based on their dominant structure
because it is more concise and provides more information. However,
during the MS/MS spectral analysis, we sometimes can only classify
compounds based on their substructure.

**ABC selection**. The ABC selection algorithm evaluates all features
collectively in an untargeted LC-MS/MS dataset, by examining the number
and abundance of features for each chemical classification at different
levels with both substructure and dominant structure. Based on this
analysis, representative classes are selected for subsequent analysis
(as shown in Fig. {@fig:mech}).



-   Create Stardust Classes (Inner filter). By using the posterior
    probability of classification prediction (PPCP) data for each
    feature, simple threshold or absolute conditions are set to filter
    the chemical classes, and refer to as 'inner' filtering.

-   Cross filter Stardust Classes. This involves combining the data of
    the chemical classes and their classified features (i.e. Stardust
    Classes data), grouping them based on the chemical classes, and then
    performing statistics on the features within each group. Statistics
    may also be performed on these data in conjunction with features
    annotation data, or to compare groups with each other. This method
    involves crossover of attributes for filtering, hence it is referred
    to as 'cross' filtering. (See details in the next subsection about
    Cross filter Stardust Classes.)

The resulting dataset is called Nebula-Index, which records multiple
chemical classes and their associated features. Each chemical class is
considered as a 'Nebula' and its classified 'features' are the
components of the Nebula. These Nebulae are visualized as networks,
with Parent-Nebula representing all features combined and Child-Nebulae
representing individual classes with their 'features'.

**Details of Cross filter Stardust Classes.** This method involves
integrating three modules, as shown in Fig. {@fig:mech}:

*Cross-filtering by 'quantity'* (abundance selection): The 'features'
quantity limitation is set for each group (a chemical class with its
classified 'features'). The minimum quantity of 'features' within the
group and the maximum proportion of 'features' quantity within the group
versus all 'features' (unique) quantity of all groups are used as
thresholds. Chemical classes with too many or too few 'features' are
filtered out.

*Cross-filtering by 'score'* (Goodness assessment): This step associates
the Stardust Classes data with 'features' annotation data. For each
group, the Goodness assessment is performed for each target attribute
(continuous attribute, generally a scoring attribute of compound
identification, such as 'Tanimoto similarity'). If the group satisfies
all the expected Goodness, the chemical class is retained. The Goodness
($G$) is calculated as follows: $G = n/N$, where $n$ is the quantity of
'features' of which the target attributes satisfy the cut-off, and $N$
is the quantity of all 'features'.

The assessment of Goodness is related to the parameters of 'tolerance'
and 'cutoff': the expected Goodness value of 'tolerance' and the actual
Goodness, which is related to the parameter 'cutoff'.

Goodness assessment can be given to multiple target attributes. Note
that the chemical class is retained only if it passes the Goodness
assessment of all target attributes. The main purpose of this step is to
filter out chemical classes with too many 'features' of low structural
identification.

*Cross-filtering by 'identical'* (identicality assessment): This step
involves a similarity assessment of chemical classes. A hierarchical
range is set for chemical classification, and groups within this range
are compared for similarity. If the classified 'features' of two groups
are almost identical to each other, the chemical class represented by
one of the groups is excluded. The degree of identicality between two
groups (A and B) is assessed, as well as the value of the parameter
'identical_factor' ($i$) :

$x$: ratio of the classified 'features' of A belonging to B

$y$: ratio of the classified 'features' of B belonging to A

$i$: value of parameter 'identical_factor'

If $x \gt i$ and $y \gt i$, the two groups are considered identical, and the
group with fewer 'features' is discarded. The purpose of this step is to
filter out classes that may incorporate each other and are similar in
scope. The *in silico* prediction approach may not be able to
distinguish which class the potential compound belongs to from the
LC-MS/MS spectra.

**Network graph presentation**. The features and their annotations are
integrated as Nebulae based on the Nebula-Index. These Nebulae are
represented as network-type graph data. The feature annotation data
includes top candidates for chemical formula and structure. The MS/MS
spectral similarity of the features is calculated and used to generate
the edge data for the network graph.

**Visualization system**. MCnebula integrates various R packages to
format data, including the 'ggplot2' package. To make visualization
easier for users, we developed the 'ggset' data class, which stores
pre-defined ggplot2 plotting functions and parameters for visualizing
Nebulae. Users can customize the visualization according to their
specific needs or the requirements of the publisher.

**Statistical analysis**. MCnebula integrates the functions of the
'limma' package for differential expression analysis of RNA-sequence and
microarray data [@gentleman_limma_2005-1], and package them for differential analysis of
metabolomics data. The gene expression matrix and feature quantification
matrix of LC-MS are similar, both have phenotypic variables (sample
information) and dependent variables (gene expression or feature
quantification values). Our method can be appropriate for statistical analysis
of feature quantification of experimental
designs in which explanatory variables are factorial variables and the
design matrix is without an intercept [@law_guide_2020].

**Feature detection**.  Feature detection is a kind of algorithm for detecting
peaks from mass data file, and most mass spectrometry processing tools have a
similar function. Users can implement this process with any tool, but to access
the MCnebula workflow, .mgf (long list file containing MS/MS information) and
.csv files (or other formatted table file of feature quantification) were
required for output.  In this study, all processing of Feature detection were
implemented in MZmine2 (version 2.53). But now, the R package MCnebula2 has
provided some convenient tools which integrated XCMS (R package) methods or
functions for Feature detection. See details in: <https://mcnebula.org/>.

**Data structure**. MCnebula was primarily developed using the R S4
system of object-oriented programming. All data including 'features'
annotation data and visualization data is stored in a single object
(class 'mcnebula'), which simplifies the application, makes data
management and analysis easier to perform and repeat.

**Reporting system**. MCnebula includes a reporting system that enables
the analysis process to be output as a PDF document or in other formats.
The reporting system is based on the 'report' data class, which stores
each step of the analysis as a section and can be easily modified
according to the user's requirements. Furthermore, the 'rmarkdown' R
package [@xie_r_2020] is incorporated in the reporting system to generate
reports.

**Code Compatibility**. MCnebula performs downstream analysis by
extracting data from the pre-computed SIRIUS project, which is the
primary data source for MCnebula 2. The SIRIUS software is continually
updated and enhanced. From SIRIUS version 4 to version 5
(https://github.com/boecker-lab/sirius), the data structure and
attribute names in the project directory have been modified. To ensure
that MCnebula is not affected by version problems, we have designed its
application programming interface (API) for various SIRIUS versions.

### MCnebula evaluation

**Spectra dataset for evaluation**. To evaluate the performance of
MCnebula, the spectra from the GNPS MS/MS library was used
(http://prime.psc.riken.jp/compms/msdial/main.html#MSP). To prevent
overfitting during library match evaluation, 'noise' was added to the
MS/MS spectra [@2021]. Two models of noise were simulated: medium noise
and high noise. The simulation involved a global mass shift, individual
mass deviations, intensity variations, and additional 'noise peaks.'
Isotope patterns were also simulated using the 'get.isotopes.pattern'
function within the 'rcdk' R package [@2007j]. The mass and abundance of
isotopes were considered for the adduct type to increase or decrease
exact mass. The 'isotope peaks' were merged into the MS^1^ list of
compounds, and all spectra collections were formatted into mgf or csv
file for the continuing MCnebula and benchmark analysis.

**Evaluation method.** MCnebula and benchmark workflow was conducted for
all the three simulated datasets. SIRIUS 4 command-line interface (CLI)
(version 4.9.12) was applied for computation, and filtered out MS/MS
spectra with empty fragmentation peaks. In total 7524 out of 8782
compounds were left for evaluation. ClassyFire was used to assess the
classification accuracy [@2016]. After *in-silico* annotation, we obtained
structure annotation, International Chemical Identifier Key (InChIKey),
and other metadata of these compounds. Considering that ClassyFire only
supports chemical identities those structures have been classified in
its server previously, we used the first hash block of InChIKeys
(InChIKey planar, which represents the molecular skeleton) to query the
PubChem application programming interface (API)
(https://pubchemdocs.ncbi.nlm.nih.gov/pug-rest) [@2022ak]. This provided us
with all the possible InChIKeys of isomerism (stereo, isotopic
substitution) [@2012e]. Classification of small molecules depends on their
molecular skeleton, so chemical identities that share the same InChIKey
planar are identical in classification. The InChIKey list was imported
into ClassyFire to obtain chemical classification. In our R script, once
any InChIKey of isomerism matched the classified data in the database,
we turned off the acquisition status for this molecular skeleton. In the
end, we collated, integrated, and assigned all these chemical
annotations as standard reference.

Due to differences in algorithms and classified results, we evaluated
the MCnebula and benchmark methods separately. Since sub-structural
classification was not available for the benchmark method, we excluded
these classes during the evaluation analysis. Nevertheless, some
compounds within the remaining classes may still be classified into
sub-structural classes. We assigned three levels for evaluation: 'True,'
'Latent,' and 'False.' 'True' indicated that the classified classes were
consistent with those of ClassyFire. 'Latent' indicated that the
classified classes were not consistent with ClassyFire, but their parent
classes at the 'class' level were consistent. 'False' indicated that the
classified classes were completely inconsistent with ClassyFire. Then, the true
positive (TP) was assigned as: 'True' + 'Latent'; the false positive (FP) was
assigned as 'False'.

To evaluate the identification of classes or structures, we merged the
results with a standard reference by InChIKey planar. For the evaluation
of chemical structure identification, we considered a structure as
'True' if it matched the chemical structure identified by InChIKey
planar. However, this evaluation neglected stereochemistry due to the
limit of LC-MS/MS detection.

### Other information

More methodological details regarding the MCnebula assessment, handling of
samples in the study (serum and phytochemicals), data processing, and
acquisition of available data and codes are documented in the supplemental
file.

## Results and discussion

### Results

#### Overview

The MCnebula workflow was dedicated to analyzing LC-MS/MS datasets from the
beginning, i.e. starting from the raw data obtained from the sample and going
through the various stages of analysis to obtain a complete analysis report
(Fig. {@fig:data_stream}). The analysis process followed the general MCnebula
analysis templates, from filtering candidates of chemical formula, structural
formulae, chemical classes, to creating visual Nebulae; it also allowed for
custom advanced analysis, with the help of chemical class focused Nebulae, to
perform statistic analysis, features selection, focus on critical metabolites
(compounds) and their structural characteristics, pathway enrichment, querying
compound synonyms, etc. One of the main characteristics of the MCnebula
workflow was the visualization system. The mass dataset is finally presented as
Parent-Nebula and Child-Nebula: Parent-Nebula is a simple network visualization
of a mixture of all the features, which contains too much information for the
user to extract useful information intuitively; Child-Nebulae were multiple
network visualization for LC-MS/MS data analysis highlighted the advantages of
the ABC selection algorithm for fast filtering and selection of chemical
classes.  We evaluated workflow of MCnebula in function with other popular
public available methods. In terms of the evaluation of our chosen indicators
which cover identification, classifying, etc., MCnebula has a wider scope of
applicability. (Tab. S1)



#### Method evaluation

   **Classified accuracy.** We used a public available reference
spectral library to assess the accuracy of classifying by MCnebula. The
direct use of such a reference spectral library may lead to over-fitting
during the evaluation. We have taken the approach of simulating noise to
eliminate this consequence. Simulating noise, i.e., adding invalid noisy
data to the reference spectrum or numerically shifting the existing
data, also simulates data acquisition similar to a real scenario: due to
the different acquisition conditions, the spectral data in the real case
will be more noisy compared to the reference spectrum. By adding noise
to the reference spectral library, we now have three datasets for
evaluation (origin, medium noise and high noise dataset) (commonly 7524
compounds (spectra)). All three datasets were analyzed using MCnebula.
Due to the richness of the compounds in the reference spectra, for the
origin dataset, we obtained a total of 152 chemical classes (each with a
corresponding compound to be evaluated) via using ABC selection
algorithm. These 152 chemical classes include both chemical classes
refined on the basis of dominant structures and chemical classes refined
on the basis of substructures. To facilitate comparison with other
methods, we selected only chemical classes that are likely to be
dominant structures for evaluation. There were 37 such chemical classes
that were selected for evaluation. To evaluate MCnebula more
objectively, we chose the molecular networking provided by GNPS (Global
Natural Products Social Molecular Networking), with the modules of
Feature-based molecular networking (FBMN) and MolNetEnhancer, as the
benchmark method to provide a visualized clustering analysis of mass
spectra data. GNPS is a typical and popular spectral library-based mass
spectrometry annotation method. In principle, it first calculates
spectral similarity by conducting mirror match with public spectral
library, identifies compounds with the exact chemical structures, and
then determines the chemical class based on the annotated chemical
structure.

We uploaded the three datasets to the GNPS server and then obtained the
results and used them for evaluation. For origin dataset, GNPS resulted
in a total of 44 chemical classes (parallel to MCnebula, with at least
50 compounds per chemical class). There were 19 common classes in total.
These classes were selected to compare MCnebula and GNPS in parallel in
terms of classified number, stability, precision and recall. For the
classified number (TP + FP), MCnebula outperformed GNPS in three datasets
(MCnebula: 199, 178, 160; GNPS: 162, 95, 81) (Fig. {@fig:compare_accuracy}a). For the
stability of the classifying after adding noise, MCnebula outperformed
GNPS in two dataset (MCnebula: 89.5%, 81.2%; GNPS: 59.3%, 49.9%) (Fig.
{@fig:compare_accuracy}a). For the indicators of precision, to assess the
performance of classifying,
it combined the level of the stability to calculate the relative false
rate, rather than the absolute false rate, then it was used to estimate
precision. The relative false rate
better simulated the actual application to LC-MS/MS analysis, since the
actual spectral data contains not only noise but also many unknown
compounds that cannot be identified by spectral matching. In this
context, MCnebula outperformed the GNPS in the evaluation of the
precision in three datasets (MCnebula: 69.8%, 67.1%, 67.4%;
GNPS: 48.1%, 51.2%, 52.4%) (Fig. {@fig:compare_accuracy}a).
The recall was estimated using relative false rate as well. As shown in Fig.
{@fig:compare_accuracy}a, MCnebula (82.2%, 81.6%, 81.6%) outperformed than GNPS
(51.2%, 52.7%, 53.3%). In addition to the three
indicators mentioned above, we also compared MCnebula and GNPS at the
individual level for the 19 chemical classes (Fig. {@fig:compare_accuracy}b). Remarkably,
MCnebula was more stable to noise than GNPS.  



**Identified accuracy.** Using MCnebula workflow, the origin dataset
containing 8057 compounds (precursor ions m/z &lt; 800), all of these
compounds were predicted with chemical molecular formulae, and of these,
6610 compounds were predicted with chemical structure. Those chemical
structure were evaluated for accuracy in a classified context. For the
37 chemical classes (Fig. {@fig:compare_accuracy}c), the average false rate of identification
was 37%; the average identified compounds number was 156. Among them,
most of the identified false rate were between 30% to 40%, however, some
classes were quite low, such as 'Long-chain fatty acids' or 'Lignans,
neolignans and related compounds'. The reliability of the predicted
chemical structure can be assessed in terms of a score. Tanimoto
similarity provides such a score for each predicted chemical structure
(it provides the matching degree of chemical fingerprints with
structures). When Tanimoto similarity sets the cutoff value to 0.5,
the average false rate of identification was 29.4%; the average
identified compounds number was 139 (Fig. {@fig:compare_accuracy}c). Above we evaluated the
accuracy of the identification of compounds in each chemical class
obtained by MCnebula. It should be noted that MCnebula itself does not
contain any module for identification, it only utilized the top scoring
candidate from the SIRIUS predicted results for annotation. For more
evaluation on identification please refer to the publication and our
previous related work [@duhrkop_sirius_2019; @lai_deep_2022].

#### Data analysis

   **Serum metabolic analysis.** To illustrate the application of
MCnebula in metabolism, we re-analyzed the serum data from Wozniak et
al. [@2020s]. The serum samples were collected from patients in-hospital
infected with Staphylococcus aureus bacteremia (SaB) or not and healthy
volunteers. Overall, the samples were divided into 1) control groups,
involving NN (non-hospital, non-infected) and HN (hospital,
non-infected); 2) infection groups, involving HS (hospital, survival),
HM (hospital, mortality).

   A total of 7680 'features' were detected while running with LC-MS
preprocessing on the serum dataset. After predicting the compounds by MS/MS
spectra (with SIRIUS software), subsequent analysis was performed using
MCnebula. Of these, 6501 'features' were annotated with predicted molecular
formula and further, 3449 'features' were annotated with predicted chemical
structure. Using ABC selection algorithm, we filtered out more than one
thousand chemical classes by applied of 'inner filter' module (see method
section of ABC selection algorithm); further filtered out 508 chemical classes
while performing 'cross filter'; for the remaining 41 chemical classes, 19
chemical classes were manually filtered out, while leaving the final 22
chemical classes to make up the Nebula-Index, which further visualized as
Child-Nebulae. It is worth mentioning that the filtered out 527 (508 + 19)
chemical classes could be re-added to the analysis. Herein, with the basic
workflow of MCnebula, Parent-Nebula and Child-Nebulae were obtained (Fig. S1,
Fig.  S2). By interrogating Child-Nebulae, we had a basic insight into the
chemical classes contained in the serum dataset. To mine more information from
Child-Nebulae: we performed a binary comparison of HS and HM groups, ranking
'features' according to Q-value (adjusted P-value); the top 50 'features' were
set as 'tracers' to mark them in Child-Nebulae (Fig. {@fig:serum_tracer}). By combining the
features selection algorithm about Q-value, the chemical classes exhibited in
Child-Nebulae were reduced. The log2(Fold Change) (log2(FC)) quantification for
the HM versus HS groups was visualized in Child-Nebulae (Fig. S3). In Fig. S3,
the overall level of 'Bile acids, alcohols and derivatives' (BAs) class and
'Acyl carnitines' (ACs) (Fig. {@fig:ac_node2}a and b) class increased remarkably, while the
overall level of 'Lysophosphatidylcholines' (LPCs) class decreased remarkably.
Indeed, BAs, ACs and LPCs were reported associated with liver dysfunction,
imbalance of intestinal microphylactic homeostasis, and mortality risk[@2021db;
@2020s; @2016at].





By deep annotation of Child-Nebula, all three classes of compounds have similar
structural parent nuclei, and their levels in the NN, HN, HS, and HM groups are
similar (Fig. {@fig:ac_node2}c, Fig. S4). Subsequently, we performed cluster heat map
analysis and pathway enrichment analysis on the compounds of these three
classes.   As shown in the clustering heat map (Fig. {@fig:hps}), the control group of
ACs and BAs were remarkably separated from the infection group, which implied
the infection relevance of ACs and BAs to SaB. In contrast, LPCs did not show
remarkable SaB infection relevance or mortality relevance, probably owing to
the general consistency of this class of compounds for SaB disease. We
performed pathway enrichment analysis for these three classes of significant
compounds (HS versus HM group, Q-value &lt; 0.05). The results of BAs showed
that four compounds exhibited metabolic pathways associated with 'Bile
secretion', 'Cholesterol metabolism', and 'Primary bile acid biosynthesis' etc
(Fig. S5b). Among them, $beta$GCS was a class of compounds with the same parent
nucleus. The results for LPCs suggested that compounds with similar parent
nucleus structure of LPCs implied association with a series of downstream
pathways (Fig. S5c). The significant compounds of ACs were not enriched in the
pathway. But, A fundamental role of ACs in tuning the switch between the
glucose and fatty acid metabolism was reviewed [@2018bi].  Their function implemented
via bi-directional transport of acyl moieties Between cytosol and mitochondria
(Fig. S5a).  



In research of Wozniak et al  [@2020s], five ACs compounds
were identified. In addition, four top metabolites
(2-Hexadecanoylthio-1-Ethylphosphorylcholine (HEPC);
sphingosine-1-phosphate (S1P); decanoyl-carnitine; L-Thyroxine (T4))
were also identified. In our reanalysis, all identifications were in
line except for HEPC (see 'Data and code availability' section for the
report of serum dataset analysis). In our re-analysis, 'HEPC' was
identified as 1-pentadecanoyl-sn-glycero-3-phosphocholine (LPC15:0) or
its stereoisomers. Indeed, HEPC and LPC15:0 are quite similar in
structure, but distinct in element constitution (corresponding to
C~23~H~48~NO~5~PS and C~23~H~48~NO~7~P respectively). They were clearly distinct in
terms of chemical classification. HEPC belongs to 'Cholines' (level 5)
from 'Organic nitrogen compounds' (superclass) family, whereas LPC15:0
belongs to 'Lysophosphatidylcholines' (level 5) from 'Lipids and
lipid-like molecules' family. As a part of MCnebula workflow, sulfur
element is detectable for SIRIUS in isotopes pattern with high mass
accuracy  [@bocker_sirius_2009]. However, for the MS/MS
spectra of 'HEPC', there was no candidate formula that containing sulfur
element. Overall, we identified more compounds with the MCnebula
workflow and many of the results were in line with the analysis of
Wozniak et al  [@2020s]. All identified compounds were
collated in Tab. S2 (filtered with Tanimoto similarity &gt; 0.5 and
de-duplicated with the first hash block of InChIKey (molecular
skeleton)). The compounds (top 50 of EFS and MWU) that were not
successfully identified via spectral library matching by Wozniak et
al. but were identified by our MCnebula workflow for molecular formula
or chemical structure were additionally collated (Tab. S3).

   **Herbal medicine analysis.** We used MCnebula to interpretate
structure diversity and chemical transformation during traditional
processing of a representative herbal medicine, *Eucommiae Cortex,* the
peel of *Eucommia ulmoides Oliv. (E. ulmoides)* [@2021n]. After being
processed with saline water, it is commonly applied to treat renal
diseases for a long time in China but the chemical basis still remained
to be explored. With the help of ABC selection algorithm in MCnebula, a
total of 29 chemical classes representing the richness of composition of
E. ulmoides were obtained. Two groups of quantification data were
performed with binary comparison. The top 20 features (Top20) were
selected using function 'select_features' (\|Log2(Fold change)\| &gt; 0.3,
Q-value &lt; 0.05, Tanimoto similarity &gt; 0.5) and were traced in
Child-Nebulae (Fig. S6). We used MCnebula to draw the mirrored match of
MS/MS spectra and extracted ions chromatography (EIC) plots of the Top20
(Fig. S7 and S8). According to Fig. S8, we speculated that the
'features' of ID 1642, 1785, and 2321 were newly generated compounds
because the peak area levels before the processing were almost zero
compared to those after processing. Their chemical structures are showed
in Fig. S7. Among them, the 'feature' of ID 1642 has a higher
probability of correct identification (Tanimoto similarity: 0.69). Based
on Fig. S6, we knew that 'feature' of ID 1642 belongs to 'Iridoids and
derivatives' (IAD), the others were 'Dialkyl ethers' (DE; ID 1785) and
'Phenylpropanoids and polyketides' (PAP; ID 2321). We annotated in depth
of the Child-Nebulae of IAD, DE and PAP respectively. The locations of
the 'features' of ID 1642, 1785 and 2321 in the Child-Nebulae were
interrogated (Fig. S9a, b, and c). Only the 'features' of ID 1642 had
neighboring 'features' and their identified chemical structures (ID 2110
and ID 854) had similar parent nuclei. The 'features' of ID 2110 and ID
854 were identified with chemical structure (Tanimoto similarity: 0.69
and 0.7 respectively) (Fig. S9d, e, and f); their levels of peak area
were decreased and increased after the processing. Based on the chemical
structures shown in Fig. S9d and e, we speculated that the compound of
ID 2110 was partially converted to the compound of ID 854 after the
processing, which may involve chemical changes such as dehydration and
rearrangement. Such speculation explained the alteration of the levels
of peak area. In addition, the increasement in the level of the compound
ID 1642 (its spectra were shown in Fig. S7 and S8) may also be
associated with the reduction of the compound ID 2110.

   The methods of MCnebula we have demonstrated for discovering
significant compounds and discovering chemical changes can be applied to
explore more compounds in Tab. S4, but we would not expand on this
description here.

### Discussion


   The analysis of LC-MS/MS data is challenging because of its large
dataset and the potential information of the unknown compounds as well
as the limited of reference spectral library. Researchers often need to
take much time on mapping the landscape of all the interesting compounds
from this "black box", and then move to next step in research MCnebula
could assist researchers in focusing on potential markers or interesting
compounds quickly by combining full-spectrum identification with machine
prediction, visualization of sub-nebulae in a multi-dimensional view,
and statistical analysis to track top 'features' and find analogues. The
ABC selection algorithm can summarize a representative chemical class in
a dataset and obtain the features to that class, so the overall
direction of the study is unbiased. Also, it is an effective guarantee
for statistical analysis to produce top features for tracing analysis in
next step. The results of statistical analysis based on feature level
may cause bias since the loss of information, filtering on the basis of
chemical classes level can prevent the bias in some degree. The
Child-Nebula, which mapped on the basis of the chemical classes obtained
by the ABC selection algorithm, achieved the goal of visualizing the
huge untargeted dataset as a single graph. Above all, the parameters of
the ABC selection algorithm were subjectively adjustable and they should
be determined according to the richness of the chemical class of the
studied object. In general, our default parameters used to acquire the
chemical classes that are abundant in variety according to the datasets
and filtered out those that were too large or too small classes in
conceptual scope.

   For identification, spectral library matching is still the main
method for LC-MS/MS data because of its high accuracy. The general
classifying of compounds is also based on it, i.e., the chemical
structure is firstly identified by spectral matching, and then its
chemical class is evaluated based on the chemical structure. Considering
the limit of reference spectral library, The classifying technique like
CANOPUS  [@duhrkop_systematic_2021]incorporated in MCnebula
bypassed the first step of identifying the chemical structure but
predicted the possible chemical class even if the exact chemical
structure was not known. MCnebula combined this cutting-edge technology
with ABC selection algorithm and achieve visualization of Child-Nebulae,
which make it possible to explore unknown compounds that beyond spectral
library. We compared the classifying method of MCnebula with GNPS, of
which method relies on chemical structure identification. When different
levels of noise were added, the number of classified compounds of GNPS
decreased remarkably compared with the stable performance of MCnebula.
For the actual acquired MS/MS spectra, they were not as good as the
reference spectra and contained some noise. Indeed ,the reality of MS/MS
spectra is much closer to the condition with noise. It means MCnebula
can resist noise interference in some extent. At the end of the
evaluation, we examined the accuracy of the identification by MCnebula.
It confirmed that the accuracy of identification fluctuated around 70%,
which was the same as SIRIUS [@duhrkop_sirius_2019].
However, this accuracy is overestimated for some specific chemical classes, such as lipids,
which is a result of the limitation of current *in silico* approach in the
lipidomics [@krettler_map_2021].

   Serum metabolomics data was applied to illustrate that MCnebula can
be used for pathway analysis and biomarker discovery. Most of our
results were consistent with that of reference  [@2020s]. The
exciting thing was that that we identified more metabolites that beyond
the scope of spectral library matching. Three of the four top
metabolites identified by Wozniak et al. were the same as our
re-identification, but only one metabolite was controversial. Wozniak et
al. mentioned ACs compounds had correlation with SaB disease and ACs
compounds were also re-identified in our study. Wozniak et al. used a
joint approach of Ensemble Feature Selection (EFS) and Mann-Whitney U
(MWU) tests to screen top metabolites  [@2020s]. When we
compared the 50 top 'features' obtained by the 'binary comparison'
method integrated in MCnebula with the top 50 metabolites (top 50 of EFS
and 50 of MWU) obtained by the joint method of W et al., a total of 37
overlapped metabolites were screened out, including the key metabolite
of L-Thyroxine in the reference study. Top 'features' were usually
different according to the feature selection algorithm. The reliability
of the 'binary comparison' method was verified again by our ranked
results comparing with those of Wozniak et al. In addition to the
consistent parts, , more interesting results about other chemical
classes associated with SaB disease were revealed by MCnebula. We
discovered additional classes, i.e. 'Lysophosphatidylcholines' (LPCs)
and 'Bile acids, alcohols and derivatives' (BAs), that were not
concerned in previous study. Acutally, LPCs have been extensively
investigated in the context of inflammation and atherosclerosis
development  [@2016at; @2020cv; @2014ao]. In a recent review
 [@2020cv], the complex roles of LPCs in vascular
inflammation were well described, involving the context-dependent pro-
or anti-inflammatory action, impact in innate immune cells and adaptive
immune system, etc. Decreasing level of LPCs was associated with wild
range of diseases of increasing mortality risk  [@2016at].
The investigation of spesis indicated LPCs concentrations in blood were
established correlation with severe sepsis or septic shock
 [@2014ao]. LPCs was reported inversely correlated with
mortality in sepsis patients  [@2003n]. BAs' disorder implied
a liver dysfunction and imbalance of intestinal microphylactic
homeostasis  [@2021dg]. The chemical multiversity of BAs,
which were discovered in the BAs' child-nebula, were determined by the
intestinal microbiome and allowed for a complex regulation of adaptive
responses in host. In our study, the level of BAs showed higher
correlation with SaB infection than ACs. The decreased level of LPCs
suggested a mortality risk of SaB infection. From LPCs to BAs, steroids
related classes, 'Lineolic acids and derivatives', and other fatty acids
related classes, showed that liver played a central role in SaB
infection and mortality. Liver X receptors (LXRs) played pivotal roles
in the transcriptional control of lipid metabolism
 [@2018bd]. LXRs modulated membrane phospholipid composition
through activation of lysophosphatidylcholine acyltransferase 3
(LPCAT3), which was directly related to LPCs  [@2021di]. The
above classes showed correlation with LXRs  [@2018bd].
Unfortunately, LXRs' specific role in SaB infection or mortality has not
been reported and beyond the scope of this research.

   In herbal dataset analysis, MCnebula provided a quick annotation of
compounds and exploration of chemical changes in Child-Nebulae with a
scope of chemical classes. The main components of *E. ulmoides* were
lignans, iridoids, phenolics, flavonoids, steroid and terpenoids
 [@huang_traditional_2021]. In our study, the chemical classes that obtained
by ABC selection algorithm included 'Lignans, neolignans and related
compounds' (LNARC) and 'Iridoids and derivatives' (IAD), as well as
'Monoterpenoids' and 'Terpene glycosides'. The flavonoids were covered
by 'Phenylpropanoids and polyketides' (PAP)  [@2016] and
phenolics may be found in 'Methoxyphenols'. The flavonoids were similar
to the steroids and were not retained in selected results as
'Flavonoides' and 'Steroids and steroid derivatives', because they were
not as abundant in *E. ulmoides* (bark) as LNARC and IAD. Many of the
compounds that identified in chemical classes of LNARC and IAD (Tab. S1)
were reported in previous research about LC-MS/MS analysis of *E.
ulmoides*  [@2014w; @2015v]. We obtained top
features based on statistical comparison of the changes in 'features'
quantification levels before and after processing. One of the compounds
that changed significantly or even was newly produced (ID: 1642) was
traced in the Child-Nebulae. We hypothesized that it was related to two
structurally similar compounds by transformation. The application of
MCnebula in the analysis of plant-derived compounds was well illustrated
with this example, particular for quick identification and exploration
of chemical changes. Notably, the reference spectral library or database
for plant-derived compounds was much more scarce compared with reference
spectral library for human-derived metabolites, Although some specific
database of plant-derived compounds was constructed
 [@2012ac], there were lack of enough fragmentation spectra
for comprehensive library match. With the help of MCnebula, a rapid and
reliable resolution of complex compositions of plant-derived can be
achieved.

## Conclusion

The analysis of LC-MS/MS data is challenging because of its large dataset and
much information of the unknown compounds as well as the limited of reference
spectral library. Thus, we established a framework called MCnebula to
facilitate mass spectrometry data analysis by focusing on critical chemical
classes and visualization in multiple dimensions. MCnebula was proposed and
implemented in the R language with package of MCnebula. As an integrated
visualization method, MCnebula may be more popular for researchers without
background of bioinformatics and computer science. According to the results of
method evaluation, MCnebula had a lower relative false rate of classified
accuracy and its accuracy of identification was up to 70%.  In order to
illustrate the broad utility of MCnebula, we investigated a human-derived serum
dataset for metabolomics analysis. The results indicated that 'Acyl carnitines'
were screened out by tracing structural classes of biomarkers which was
consistent with the reference. We also investigated a plant-derived dataset of
herbal E. ulmoides to achieve a rapid unknown compound annotation and
discovery. MCnebula has a great potential in the field of chemistry and
biology. In the future, we hope that fields of application of MCnebula could
expand to agriculture, food science, medicine and so on. 

## Acknowledgements

This work was financially supported by the National Natural Science
Foundation of China (No. 81922073), Zhejiang Province Traditional
Chinese Medicine Science and Technology Project (Nos. 2022ZQ033).

[citation]: {@fig:mech}

[citation]: {@fig:data_stream}

[citation]: {@fig:compare_accuracy}

[citation]: {@fig:serum_tracer}

[citation]: {@fig:ac_node2}

[citation]: {@fig:hps}

