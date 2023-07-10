# MCnebula: Critical chemical classes for the classification and boost identification by visualization for untargeted LC-MS/MS data analysis

**Lichuang Huang^1, 2 #^, Qiyuan Shan^1, 2 #^,** **Qiang Lyu^1^,
Shuosheng Zhang^3^, Lu Wang^1, 2\*^, Gang Cao^1, 2, 4\*^**

^1^ School of Pharmacy, Zhejiang Chinese Medical University, Hangzhou,
China

^2^ Jinhua Institute, Zhejiang Chinese Medical University, Hangzhou,
China

^3^ College of Chinese Materia Medica and Food Engineering, Shanxi
University of Chinese Medicine, Jinzhong, China.

^4^ The Third Affiliated Hospital of Zhejiang Chinese Medical
University, Hangzhou, China.

^\#^These authors contributed equally to this work

\*Address correspondence to:

**Lu Wang, Ph.D.**

School of Pharmacy, Zhejiang Chinese Medical University, No. 548 Binwen
Road, Hangzhou, Zhejiang 310053, China; E-mail: luwang0520@163.com

**Professor Gang Cao, Ph.D.**

School of Pharmacy, Zhejiang Chinese Medical University, No. 548 Binwen
Road, Hangzhou, Zhejiang 310053, China; Tel/Fax: +86 571 87195895;
E-mail: caogang33@163.com

## Abstract {#abstract-1}

Untargeted mass spectrometry is a robust tool for biology, but it
usually requires [much]{.deletion author="2003"
date="2023-04-21T14:47:00Z"} [a large amount of]{.insertion
author="2003" date="2023-04-21T14:47:00Z"} time on data
analysis[,]{.insertion author="2003" date="2023-04-21T14:47:00Z"}
especially for system biology. [We established a]{.deletion
author="2003" date="2023-04-21T14:47:00Z"}[A]{.insertion author="2003"
date="2023-04-21T14:47:00Z"} framework called [MCnebula (]{.deletion
author="2003" date="2023-04-21T14:47:00Z"}Multiple-Chemical nebula
[(MCnebula]{.insertion author="2003" date="2023-04-21T14:47:00Z"}) [was
developed herein]{.insertion author="2003" date="2023-04-21T14:47:00Z"}
to facilitate mass spectrometry data analysis process by focusing on
critical chemical classes and visualization in multiple dimensions.
[It]{.deletion author="2003" date="2023-04-21T14:47:00Z"} [This
framework]{.insertion author="2003" date="2023-04-21T14:47:00Z"}
consisted of [the]{.insertion author="2003" date="2023-04-21T14:47:00Z"}
three vital steps [as follows]{.insertion author="2003"
date="2023-04-21T14:47:00Z"}: (1) abundance-based classes (ABC)
selection algorithm, (2) critical chemical classes to classify
'features' (compounds), [and]{.insertion author="2003"
date="2023-04-21T14:48:00Z"} (3) visualization as multiple Child-Nebulae
(network graph) with annotation, chemical classification[,]{.insertion
author="2003" date="2023-04-21T14:48:00Z"} and structure. Notably,
MCnebula can be [applied]{.deletion author="2003"
date="2023-04-21T14:48:00Z"} [used]{.insertion author="2003"
date="2023-04-21T14:48:00Z"} to explore [the]{.insertion author="2003"
date="2023-04-21T14:48:00Z"} classification and structural
characteristic of unknown compounds [that]{.deletion author="2003"
date="2023-04-21T14:48:00Z"} beyond the limit of spectral library.
[What's m]{.deletion author="2003"
date="2023-04-21T14:48:00Z"}[M]{.insertion author="2003"
date="2023-04-21T14:48:00Z"}ore[over]{.insertion author="2003"
date="2023-04-21T14:48:00Z"}, it is intuitive and convenient for pathway
analysis and biomarker discovery [due to]{.deletion author="2003"
date="2023-04-21T14:48:00Z"}[because of]{.insertion author="2003"
date="2023-04-21T14:48:00Z"} its function of ABC selection and
visualization. MCnebula was implemented in the R language. [We provided
a]{.deletion author="2003" date="2023-04-21T14:48:00Z"}[A]{.insertion
author="2003" date="2023-04-21T14:48:00Z"} series of tools in the R
packages [was provided]{.insertion author="2003"
date="2023-04-21T14:48:00Z"} to facilitate downstream analysis in a
MCnebula-featured way, including feature selection (statistical analysis
of binary comparisons), homology tracing of top features, pathway
enrichment analysis, heat map clustering analysis, spectral
visualization analysis, chemical information query[,]{.insertion
author="2003" date="2023-04-21T14:48:00Z"} and output analysis reports[,
etc]{.deletion author="2003" date="2023-04-21T14:48:00Z"}. [In order to
illustrate t]{.deletion author="2003"
date="2023-04-21T14:48:00Z"}[T]{.insertion author="2003"
date="2023-04-21T14:48:00Z"}he broad utility of MCnebula [was
illustrat]{.insertion author="2003"
date="2023-04-21T14:48:00Z"}[ed]{.insertion author="2003"
date="2023-04-21T14:49:00Z"}, [we investigated]{.deletion author="2003"
date="2023-04-21T14:49:00Z"} a human-derived serum dataset for
metabolomics analysis. The results indicated that 'Acyl carnitines' were
screened out by tracing structural classes of biomarkers which was
consistent with the reference. [We also investigated a]{.deletion
author="2003" date="2023-04-21T14:49:00Z"}[A]{.insertion author="2003"
date="2023-04-21T14:49:00Z"} plant-derived dataset of herbal
[*Eucommia*]{.insertion author="2003" date="2023-04-21T18:56:00Z"}
[*E.*]{.deletion author="2003" date="2023-04-21T18:56:00Z"} *ulmoides*
[was investigated]{.insertion author="2003" date="2023-04-21T14:49:00Z"}
to achieve a rapid unknown compound annotation and discovery.

**Keywords:** Mass spectrometry, visualization, chemical classes,
identification, MCnebula

## Introduction

[T]{.insertion author="2003" date="2023-04-21T14:49:00Z"}[he]{.insertion
author="2003" date="2023-04-21T14:50:00Z"} [Analyzing]{.deletion
author="2003" date="2023-04-21T14:50:00Z"} [analysis of]{.insertion
author="2003" date="2023-04-21T14:50:00Z"} untargeted liquid
chromatography/tandem mass spectrometry (LC-MS/MS) dataset is
complicated[, due to]{.deletion author="2003"
date="2023-04-21T14:50:00Z"} [because of]{.insertion author="2003"
date="2023-04-21T14:50:00Z"} the massive of data volume, complexity of
spectra[,]{.insertion author="2003" date="2023-04-21T14:50:00Z"} and
structural diversity of compounds. In the past decades, [a lot
of]{.deletion author="2003" date="2023-04-21T14:50:00Z"}
[many]{.insertion author="2003" date="2023-04-21T14:50:00Z"} researchers
[have]{.insertion author="2003" date="2023-04-21T14:50:00Z"} attempted
to address the issues. Many technical software or web-based interfaces
[were]{.deletion author="2003" date="2023-04-21T14:50:00Z"} [have
been]{.insertion author="2003" date="2023-04-21T14:50:00Z"} developed to
provide a one-stop bulk solution for data analysis^[1](\l)--[4](\l)^.
These solutions applied or suggested flexible mass spectra processing
tools or analogous algorithms^[5](\l)--[8](\l)^. [To reduce f]{.deletion
author="2003" date="2023-04-21T14:50:00Z"}[F]{.insertion author="2003"
date="2023-04-21T14:50:00Z"}alse-positive and false-negative results
[were reduced]{.insertion author="2003" date="2023-04-21T14:50:00Z"}[,
more]{.deletion author="2003" date="2023-04-21T14:50:00Z"} [through the
implementation of]{.insertion author="2003" date="2023-04-21T14:50:00Z"}
algorithms [have been implemented]{.deletion author="2003"
date="2023-04-21T14:50:00Z"} for peak deconvolution, feature
selection[,]{.insertion author="2003" date="2023-04-21T14:50:00Z"} or
statistical filtering^[9](\l)--[12](\l)^. Every feature corresponding to
a compound within sample or parallel samples was prevalently equipped
with fragmentation spectra for identification. In this context,
researchers have to be confronted with [a]{.deletion author="2003"
date="2023-04-21T14:51:00Z"} [the]{.insertion author="2003"
date="2023-04-21T14:51:00Z"} problem[: how to]{.deletion author="2003"
date="2023-04-21T14:51:00Z"} [of]{.insertion author="2003"
date="2023-04-21T14:51:00Z"} [the quick and accurate]{.insertion
author="2003" date="2023-04-21T14:51:00Z"} [identify]{.deletion
author="2003" date="2023-04-21T14:51:00Z"} [identification
of]{.insertion author="2003" date="2023-04-21T14:51:00Z"} [so
many]{.deletion author="2003" date="2023-04-21T14:51:00Z"}[a large
number of]{.insertion author="2003" date="2023-04-21T14:51:00Z"}
compounds [accurately and quickly?]{.deletion author="2003"
date="2023-04-21T14:51:00Z"}[.]{.insertion author="2003"
date="2023-04-21T14:51:00Z"}

Until today, several strategies have been developed for identifying
compounds with fragmentation spectra. **1)** Spectral library matching.
[A number of]{.deletion author="2003"
date="2023-04-21T14:51:00Z"}[Several]{.insertion author="2003"
date="2023-04-21T14:51:00Z"} public available databases were built to
settle [that]{.deletion author="2003" date="2023-04-21T14:51:00Z"} [this
matter]{.insertion author="2003" date="2023-04-21T14:51:00Z"}
[via]{.deletion author="2003" date="2023-04-21T14:52:00Z"}
[by]{.insertion author="2003" date="2023-04-21T14:52:00Z"} achieving
re-usability of reference fragmentation spectra, such as MassBank,
MassBank of North America (MoNA), Global Natural Products Society
molecular networking (GNPS)[^4^](\l). [In the meanwhile, t]{.deletion
author="2003" date="2023-04-21T14:52:00Z"}[T]{.insertion author="2003"
date="2023-04-21T14:52:00Z"}hese fragmentation spectra are available via
their web servers, third-party platform (e.g.,
[CompMass](http://prime.psc.riken.jp/compms/msdial/main.html#MSP%3E))[,]{.insertion
author="2003" date="2023-04-21T14:52:00Z"} or specific tools
(MASST)[^13^](\l). However, compared with structure database (PubChem
[harbours]{.deletion author="2003"
date="2023-04-21T18:59:00Z"}[harbors]{.insertion author="2003"
date="2023-04-21T18:59:00Z"} over 100 million records), [the]{.insertion
author="2003" date="2023-04-21T14:52:00Z"} spectral library [is
too]{.deletion author="2003" date="2023-04-21T14:52:00Z"}[has a
very]{.insertion author="2003" date="2023-04-21T14:52:00Z"} small
[in]{.deletion author="2003" date="2023-04-21T14:52:00Z"}
size[,]{.insertion author="2003" date="2023-04-21T14:52:00Z"}
[that]{.deletion author="2003" date="2023-04-21T14:52:00Z"}
[thus]{.insertion author="2003" date="2023-04-21T14:52:00Z"}
limit[ing]{.insertion author="2003" date="2023-04-21T14:53:00Z"} the
application of mass spectrometry. T[o cross t]{.deletion author="2003"
date="2023-04-21T14:53:00Z"}his barrier[,]{.deletion author="2003"
date="2023-04-21T14:53:00Z"} [was addressed via]{.insertion
author="2003" date="2023-04-21T14:53:00Z"} **2)** [*In*]{.deletion
author="2003" date="2023-04-21T14:53:00Z"} [in]{.insertion author="2003"
date="2023-04-21T14:53:00Z"} silico[]{.comment-end id="0"} simulation by
fragmentation spectra. In silico tools have been increasingly developed
for simulating fragmentation spectra^[14](\l)--[17](\l)^. Some databases
such as MoNA [are]{.insertion author="2003" date="2023-04-21T14:53:00Z"}
collated in silico fragmentation spectra and [were]{.deletion
author="2003" date="2023-04-21T14:53:00Z"} [are publicly]{.insertion
author="2003" date="2023-04-21T14:53:00Z"} available [for
public]{.deletion author="2003" date="2023-04-21T14:53:00Z"}[^18^](\l).
**3)** In silico prediction with matching learning. At present, the
algorithms [made]{.deletion author="2003" date="2023-04-21T14:53:00Z"}
[allo]{.insertion author="2003"
date="2023-04-21T14:53:00Z"}[w]{.insertion author="2003"
date="2023-04-21T14:54:00Z"} []{.insertion author="2003"
date="2023-04-21T14:53:00Z"}machine training from reference mass dataset
or libraries[, then]{.deletion author="2003"
date="2023-04-21T14:54:00Z"} [and]{.insertion author="2003"
date="2023-04-21T14:54:00Z"} [']{.deletion author="2003"
date="2023-04-21T14:54:00Z"}learn[ed']{.deletion author="2003"
date="2023-04-21T14:54:00Z"} how to predict chemical fingerprints or
principles [so as]{.deletion author="2003" date="2023-04-21T14:54:00Z"}
to retrieve the correct structure from molecular structure
database^[19](\l)--[21](\l)^.

In silico methods are developing quickly. Currently, the cutting-edge
technology, called SIRIUS 4[^22^](\l), integrates many advanced
artificial intelligence algorithms and has achieved an accuracy rate of
70% when retrieving from molecular structure database. This method helps
[to]{.deletion author="2003" date="2023-04-21T14:56:00Z"}
[in]{.insertion author="2003" date="2023-04-21T14:56:00Z"}
identify[ing]{.insertion author="2003" date="2023-04-21T14:56:00Z"}
metabolites beyond the scope of spectral libraries. While in silico
tools boost chemical identification, it [is]{.deletion author="2003"
date="2023-04-21T14:57:00Z"} still lack[s]{.insertion author="2003"
date="2023-04-21T14:57:00Z"} [of]{.deletion author="2003"
date="2023-04-21T14:57:00Z"} a proper framework that could incorporate
and leverage SIRIUS 4 into [a]{.insertion author="2003"
date="2023-04-21T14:57:00Z"} user-friendly way for biological research,
such as biomarker discovery and pathway analysis of mass spectral
dataset. [The manual]{.insertion author="2003"
date="2023-04-21T14:57:00Z"} [Compounds]{.deletion author="2003"
date="2023-04-21T14:57:00Z"} [compound]{.insertion author="2003"
date="2023-04-21T14:57:00Z"} annotation and screening of biomarkers
[manually]{.deletion author="2003" date="2023-04-21T15:00:00Z"} are both
time-consuming[,]{.insertion author="2003" date="2023-04-21T15:00:00Z"}
and the results are impressed by subjective factors. Molecular
networking is [becoming increasingly]{.insertion author="2003"
date="2023-04-21T15:00:00Z"} [more and more]{.deletion author="2003"
date="2023-04-21T15:00:00Z"} popular [due to]{.deletion author="2003"
date="2023-04-21T15:00:00Z"}[because of]{.insertion author="2003"
date="2023-04-21T15:00:00Z"} its visualization and data transparency.
Molecular networking [was]{.deletion author="2003"
date="2023-04-21T15:00:00Z"} [is]{.insertion author="2003"
date="2023-04-21T15:00:00Z"} a spectral correlation and visualization
method that can detect spectra from related molecules (so-called
spectral networks), even when the spectra [were]{.deletion author="2003"
date="2023-04-21T15:00:00Z"} [do]{.insertion author="2003"
date="2023-04-21T15:00:00Z"} not match[ed to]{.deletion author="2003"
date="2023-04-21T15:00:00Z"} [with]{.insertion author="2003"
date="2023-04-21T15:00:00Z"} any known compounds[^4^](\l). Based on the
concept of molecular networking, we proposed an idea, clustering
features for visualization of chemical classification probably
contribute to the discovery of biomarkers and metabolic pathway
analysis.

The history of classification in chemistry [dated]{.deletion
author="2003" date="2023-04-21T15:01:00Z"} [can be traced]{.insertion
author="2003" date="2023-04-21T15:01:00Z"} back to the middle of the
last century. The Chemical Fragmentation Coding system was
first[ly]{.deletion author="2003" date="2023-04-21T15:08:00Z"} developed
by Derwent World Patent Index [(DWPI)]{.deletion author="2003"
date="2023-04-21T15:08:00Z"} in 1963. [Until recent years]{.deletion
author="2003" date="2023-04-21T15:08:00Z"}[Thereafter,]{.insertion
author="2003" date="2023-04-21T15:08:00Z"} chemical
classification[s]{.insertion author="2003" date="2023-04-21T15:08:00Z"}
[like]{.deletion author="2003" date="2023-04-21T15:08:00Z"} [such
as]{.insertion author="2003" date="2023-04-21T15:08:00Z"} Gene Ontology
(GO)[^23^](\l)[,]{.insertion author="2003" date="2023-04-21T15:08:00Z"}
which was organized with taxonomy and ontology[,]{.insertion
author="2003" date="2023-04-21T15:08:00Z"} was proposed [more]{.deletion
author="2003" date="2023-04-21T15:08:00Z"} systematically[^24^](\l).
ClassyFire is popular for compound annotation in LC-MS dataset analysis
[due to]{.deletion author="2003" date="2023-04-21T15:09:00Z"}[because
of]{.insertion author="2003" date="2023-04-21T15:09:00Z"} its
computation[al]{.insertion author="2003" date="2023-04-21T15:09:00Z"}
[available]{.deletion author="2003" date="2023-04-21T15:09:00Z"}
[availability]{.insertion author="2003" date="2023-04-21T15:09:00Z"} and
systematicness^[25](\l)--[28](\l)^. The taxonomy and ontology
[is]{.deletion author="2003" date="2023-04-21T15:09:00Z"}
[are]{.insertion author="2003" date="2023-04-21T15:09:00Z"} robust and
useful for chemistry. [For example, a]{.deletion author="2003"
date="2023-04-21T15:09:00Z"}[A]{.insertion author="2003"
date="2023-04-21T15:09:00Z"} hierarchical classification-based
method[,]{.deletion author="2003" date="2023-04-21T15:09:00Z"} called
Qemistree[,]{.deletion author="2003" date="2023-04-21T15:09:00Z"}
[was]{.deletion author="2003" date="2023-04-21T15:09:00Z"} [has
been]{.insertion author="2003" date="2023-04-21T15:09:00Z"} proposed to
analyze mass spectrometry data by expressing molecular relationships as
a tree, which could be represented in the context of sample metadata and
chemical ontologies[^29^](\l).

Untargeted metabolomics is a field of omics science that uses
cutting-edge analytical chemistry techniques and advanced computational
methods to characterize complex biochemical mixtures aimlessly.
LC­MS-based untargeted metabolomics is very popular [due to]{.deletion
author="2003" date="2023-04-21T15:09:00Z"}[because of]{.insertion
author="2003" date="2023-04-21T15:09:00Z"} its high sensitivity, small
sample volume[,]{.insertion author="2003" date="2023-04-21T15:09:00Z"}
and direct injection without separation etc.[^30^](\l). With the help of
statistical methodologies, researchers could screen and identify
more[-]{.deletion author="2003" date="2023-04-21T15:09:00Z"}
[]{.insertion author="2003" date="2023-04-21T15:09:00Z"}informative
disease biomarkers from thousands of LC-MS features[,]{.deletion
author="2003" date="2023-04-21T15:09:00Z"} to aid the design or
development of improved treatments and [to better]{.deletion
author="2003" date="2023-04-21T15:09:00Z"}[effectively]{.insertion
author="2003" date="2023-04-21T15:09:00Z"} assess health
outcomes[^31^](\l). These statistical approaches mainly
involve[d]{.deletion author="2003" date="2023-04-21T15:09:00Z"}
classical statistic[al]{.insertion author="2003"
date="2023-04-21T15:10:00Z"} and artificial intelligence models
[]{.insertion author="2003" date="2023-04-21T15:10:00Z"}(e.g., random
forests)[^32^](\l). Both approaches [were inevitable to]{.deletion
author="2003" date="2023-04-21T15:10:00Z"} introduce specific biases,
owing to the complexity of feature set or algorithmic
stability[^33^](\l). Furthermore, [the]{.insertion author="2003"
date="2023-04-21T15:10:00Z"} [analyzing]{.deletion author="2003"
date="2023-04-21T15:10:00Z"} [analysis]{.insertion author="2003"
date="2023-04-21T15:10:00Z"} at feature level [was]{.deletion
author="2003" date="2023-04-21T15:10:00Z"} [is]{.insertion author="2003"
date="2023-04-21T15:10:00Z"} unable to profile systematic effects on
metabolites unbiased[^34^](\l). [In this view]{.deletion author="2003"
date="2023-04-21T15:10:00Z"}[Therefore]{.insertion author="2003"
date="2023-04-21T15:10:00Z"}, [the]{.insertion author="2003"
date="2023-04-21T15:10:00Z"} [analyzing]{.deletion author="2003"
date="2023-04-21T15:10:00Z"} [analysis]{.insertion author="2003"
date="2023-04-21T15:10:00Z"} at chemical classified level may be a
[better]{.deletion author="2003" date="2023-04-21T15:10:00Z"}
[good]{.insertion author="2003" date="2023-04-21T15:10:00Z"} settlement.
However, [it shouldn't be ignored that]{.deletion author="2003"
date="2023-04-21T15:10:00Z"} the differences of metabolites at the same
classified level [need to be noted]{.insertion author="2003"
date="2023-04-21T15:10:00Z"}. For example, small-molecules belonging to
'Indoles and derivatives' [had]{.deletion author="2003"
date="2023-04-21T15:10:00Z"} [have]{.insertion author="2003"
date="2023-04-21T15:10:00Z"} [structural]{.deletion author="2003"
date="2023-04-21T15:10:00Z"} [structure-]{.insertion author="2003"
date="2023-04-21T15:10:00Z"}dependent affection on aryl hydrocarbon
receptor [(AHR)]{.deletion author="2003"
date="2023-04-21T15:11:00Z"}[^35^](\l). Different structural
characteristics will lead to diverse activities. [The]{.deletion
author="2003" date="2023-04-21T15:11:00Z"} [This condition can be
addressed]{.insertion author="2003" date="2023-04-21T15:11:00Z"}
[settlement for that is]{.deletion author="2003"
date="2023-04-21T15:11:00Z"}[by]{.insertion author="2003"
date="2023-04-21T15:11:00Z"} integrating both 'feature' level statistic
and classified level assessment.

In addition to chemical classifying and statistical analysis, clustering
visualization [was also]{.deletion author="2003"
date="2023-04-21T15:11:00Z"}[is]{.insertion author="2003"
date="2023-04-21T15:11:00Z"} a popular tool for untargeted mass
spectrometry data analysis. Over the last decade, [Global Natural
Products Social Molecular Networking (]{.deletion author="2003"
date="2023-04-21T14:52:00Z"}GNPS[)]{.deletion author="2003"
date="2023-04-21T14:52:00Z"} is [more and more]{.deletion author="2003"
date="2023-04-21T15:11:00Z"}[becoming an increasingly]{.insertion
author="2003" date="2023-04-21T15:11:00Z"} popular [as a]{.deletion
author="2003" date="2023-04-21T15:11:00Z"} clustering visualization tool
based on MS dataset. GNPS [applied]{.deletion author="2003"
date="2023-04-21T15:11:00Z"} [applies]{.insertion author="2003"
date="2023-04-21T15:11:00Z"} molecular networking connecting mass
spectra of molecules based on the similarity of their fragmentation
patterns[^36^](\l). Unfortunately, [the]{.insertion author="2003"
date="2023-04-21T15:11:00Z"} molecular networking of GNPS mainly depend
on [on]{.deletion author="2003" date="2023-04-21T15:11:00Z"} spectral
similarity instead of [compounds]{.deletion author="2003"
date="2023-04-21T15:12:00Z"} structural or classified similarity [of the
compounds]{.insertion author="2003" date="2023-04-21T15:12:00Z"}. For
example, flavonoids consist of an aromatic ring joined to an oxygenated
heterocyclic ring linked to a phenyl group, []{.insertion author="2003"
date="2023-04-21T15:12:00Z"}which [were]{.deletion author="2003"
date="2023-04-21T15:12:00Z"} [are]{.insertion author="2003"
date="2023-04-21T15:12:00Z"} expected to be clustered together
[since]{.deletion author="2003" date="2023-04-21T15:12:00Z"} [because
of]{.insertion author="2003" date="2023-04-21T15:12:00Z"} its specific
class and structural similarity. However, [, it was reported
that]{.deletion author="2003" date="2023-04-21T15:12:00Z"} some
compounds belonging to flavonoids [happened to be]{.deletion
author="2003" date="2023-04-21T15:12:00Z"}[are]{.insertion author="2003"
date="2023-04-21T15:12:00Z"} absent from the cluster of other flavonoids
compounds [in previous research]{.deletion author="2003"
date="2023-04-21T15:12:00Z"}[^34^](\l). Thus, clustering visualization
in a classified level is a [better]{.deletion author="2003"
date="2023-04-21T15:12:00Z"} [good]{.insertion author="2003"
date="2023-04-21T15:12:00Z"} choice for untargeted mass spectra dataset.
Earlier in 2012, the concept of molecular networking with visualization
for mass data analysis was proposed for the first
time[^36^](\l)[,]{.insertion author="2003" date="2023-04-21T15:12:00Z"}
but in silico tools for predicting compound classification by
fragmentation spectra were not available [at that time]{.deletion
author="2003" date="2023-04-21T15:12:00Z"}. Nowadays, with the
development of automatic classified in silico tools[^24^](\l), [it is
time for a revolution of]{.deletion author="2003"
date="2023-04-21T15:12:00Z"} the visualization strategy [can be
revolution]{.insertion author="2003"
date="2023-04-21T15:12:00Z"}[iz]{.insertion author="2003"
date="2023-04-21T15:13:00Z"}[ed]{.insertion author="2003"
date="2023-04-21T15:12:00Z"} []{.insertion author="2003"
date="2023-04-21T15:13:00Z"}with higher confidence in classified level.

[Accordingly,]{.underline}  [a comprehensive framework, named MCnebula,
was proposed here]{.underline}[in{.underline}] [for untargeted LC-MS/MS
dataset analysis. MCnebula]{.underline}
 [integrates{.underline}] [a new abundance-based
classes (ABC) selection algorithm for chemical classes selection.
The]{.underline}  [ABC selection algorithm]{.underline}
[involves the following principles: (1)]{.underline}
 [applies{.underline}] [an initial filtering to
thousands of chemical classes based on the predicted probability,
(2)]{.underline} 
[regards{.underline}] [all 'features' as a whole,]{.underline}
 [examines{.underline}] [the number and abundance of
'features' of each chemical classification (classification at different
levels, classification of sub-structure and dominant structure), and
then]{.underline}  [selects{.underline}] [representative
classes,]{.underline} [and{.underline}] [(3)]{.underline} [these chemical classes were
followed by goodness assessment (about identification of its classified
compounds) and identicality assessment (the extent to which these
chemical classes are distinguished from each other in the context of
MS/MS spectra). The final chemical classes [would serve to]{.deletion
author="2003" date="2023-04-21T16:38:00Z"}[are important for]{.insertion
author="2003" date="2023-04-21T16:38:00Z"} the subsequent
analysis]{.underline}[[:]{.underline}]{.deletion author="2003"
date="2023-04-21T16:38:00Z"} [[. They can be]{.underline}]{.insertion
author="2003" date="2023-04-21T16:38:00Z"} [visualized as
Child-Nebulae[,]{.insertion author="2003" date="2023-04-21T16:39:00Z"}
and]{.underline} [[focus on]{.underline}]{.deletion author="2003"
date="2023-04-21T16:39:00Z"} [these chemical classes]{.underline}
[]{.deletion author="2003" date="2023-04-21T16:39:00Z"}[/]{.underline}
[]{.deletion author="2003"
date="2023-04-21T16:39:00Z"}[Nebulae]{.underline} [[can be
used]{.underline}]{.insertion author="2003" date="2023-04-21T16:39:00Z"}
[for biomarker or chemistry discovery. The top 'features' based on
statistical analysis could be set as tracer to discover more homology
compounds of chemical structure or spectral similarity or chemical
class. MCnebula can be used to explore unknown compounds because of the
annotation module and the cutting-edge technology of SIRIUS
software^[20](\l),[22](\l),[34](\l),[37](\l)--[39](\l)^, which exceeded
the limitations of spectral library matching. MCnebula was implemented
in]{.underline} [[the]{.underline}]{.deletion author="2003"
date="2023-04-21T16:40:00Z"} [R language and can be easily integrated
into the diverse biological analysis workflow of R. MCnebula (updated to
MCnebula2, which]{.underline} [[included]{.underline}]{.deletion
author="2003" date="2023-04-21T16:40:00Z"}
[[includes]{.underline}]{.insertion author="2003"
date="2023-04-21T16:40:00Z"} [more tools such as ABC selection
algorithm, Nebula visualization, statistical analysis, and output
report]{.underline} [[etc.]{.deletion author="2003"
date="2023-04-21T16:40:00Z"}) was written primarily in]{.underline}
[[the]{.underline}]{.insertion author="2003"
date="2023-04-21T16:40:00Z"} [S4 system of object-oriented programming.
It allowed all data for one-button analysis from the beginning to the
end,]{.underline} [[which]{.underline}]{.deletion author="2003"
date="2023-04-21T16:40:00Z"} [[thus]{.underline}]{.insertion
author="2003" date="2023-04-21T16:40:00Z"}
[[facilitated]{.underline}]{.deletion author="2003"
date="2023-04-21T16:40:00Z"} [[facilitating]{.underline}]{.insertion
author="2003" date="2023-04-21T16:40:00Z"} [data processing. In addition
to the basic function of MCnebula[)]{.deletion author="2003"
date="2023-04-21T16:40:00Z"},]{.underline} [[we
provided]{.underline}]{.deletion author="2003"
date="2023-04-21T16:40:00Z"} [an additional 'exMCnebula2'
package]{.underline} [[was provided]{.underline}]{.insertion
author="2003" date="2023-04-21T16:40:00Z"} [for downstream
analysis]{.underline}[[,]{.underline}]{.deletion author="2003"
date="2023-04-21T16:40:00Z"} [[.]{.underline}]{.insertion author="2003"
date="2023-04-21T16:40:00Z"} [[which]{.underline}]{.deletion
author="2003" date="2023-04-21T16:40:00Z"} [[This
package]{.underline}]{.insertion author="2003"
date="2023-04-21T16:40:00Z"} [[contained]{.underline}]{.deletion
author="2003" date="2023-04-21T16:40:00Z"}
[[contains]{.underline}]{.insertion author="2003"
date="2023-04-21T16:40:00Z"} [all the analysis tools used in this study
such as pathway enrichment analysis, heatmap clustering analysis,
spectral visualization analysis,]{.underline}
[[and]{.underline}]{.insertion author="2003"
date="2023-04-21T16:40:00Z"} [chemical information query[,
etc]{.deletion author="2003" date="2023-04-21T16:41:00Z"}.]{.underline}
[[The]{.underline}]{.insertion author="2003"
date="2023-04-21T16:41:00Z"} [[Downstream]{.underline}]{.deletion
author="2003" date="2023-04-21T16:41:00Z"}
[[downstream]{.underline}]{.insertion author="2003"
date="2023-04-21T16:41:00Z"} [analysis of untargeted LC/MS-MS is complex
and varies]{.underline} [[from]{.underline}]{.deletion author="2003"
date="2023-04-21T16:41:00Z"} [[across different]{.underline}]{.insertion
author="2003" date="2023-04-21T16:41:00Z"} [data]{.underline} [[to
data]{.deletion author="2003" date="2023-04-21T16:41:00Z"}. The
additional tools in exMCnebula2 package could provide a prototype for
the expanded application of MCnebula.]{.underline}

[In this article, two datasets were applied in MCnebula]{.underline}
[[in order]{.underline}]{.deletion author="2003"
date="2023-04-21T16:41:00Z"} [to demonstrate the broad utility of our
method.]{.underline} [[These dataset include]{.underline}]{.insertion
author="2003" date="2023-04-21T16:41:00Z"} [[One
was]{.underline}]{.deletion author="2003" date="2023-04-21T16:41:00Z"}
[a human-derived serum dataset that]{.underline}
[[is]{.underline}]{.insertion author="2003" date="2023-04-21T16:41:00Z"}
[correlated with mortality risk profiling of]{.underline}
[[staphylococcus]{.underline}]{.deletion author="2003"
date="2023-04-21T16:41:00Z"} [*[Staphylococcus]{.underline}*]{.insertion
author="2003" date="2023-04-21T16:41:00Z"} [*aureus* Bacteremia (SaB)[;
the other was]{.deletion author="2003"
date="2023-04-21T16:41:00Z"}]{.underline} [[and]{.insertion
author="2003" date="2023-04-21T16:41:00Z"} a plant-derived herbal
dataset that]{.underline} [[is]{.insertion author="2003"
date="2023-04-21T16:41:00Z"} related to the traditional processing of
herbal medicine.]{.underline}

## Experimental section

### MCnebula algorithm

**Overview**. The analysis of untargeted LC-MS/MS datasets typically
starts with feature detection. [The]{.insertion author="2003"
date="2023-04-21T16:41:00Z"} [Annotating]{.deletion author="2003"
date="2023-04-21T16:41:00Z"} [annotation of]{.insertion author="2003"
date="2023-04-21T16:41:00Z"} these features is
time-consuming[,]{.insertion author="2003" date="2023-04-21T16:42:00Z"}
and [extracting]{.deletion author="2003" date="2023-04-21T16:42:00Z"}
[extraction of]{.insertion author="2003" date="2023-04-21T16:42:00Z"}
useful information for further biological research [can also
be]{.deletion author="2003" date="2023-04-21T16:42:00Z"}[is]{.insertion
author="2003" date="2023-04-21T16:42:00Z"} challenging. [To
address]{.deletion author="2003" date="2023-04-21T16:42:00Z"}[In
response to]{.insertion author="2003" date="2023-04-21T16:42:00Z"} these
issues, [we present]{.deletion author="2003"
date="2023-04-21T16:42:00Z"} MCnebula, [with]{.deletion author="2003"
date="2023-04-21T16:42:00Z"} [which has]{.insertion author="2003"
date="2023-04-21T16:42:00Z"} an abundance-based class[es]{.deletion
author="2003" date="2023-04-21T16:42:00Z"} (ABC) selection algorithm,
[was presented]{.insertion author="2003" date="2023-04-21T16:42:00Z"} to
boost mass spectrometry data analysis by focusing on critical chemical
classes and visualization in multiple dimensions.

[**Molecular formula and chemical structure prediction**. The analysis
of MS/MS spectra involve a process of inference and prediction. [We
deduce t]{.deletion author="2003"
date="2023-04-21T16:42:00Z"}[T]{.insertion author="2003"
date="2023-04-21T16:42:00Z"}he molecular formula]{.underline} [[was
determined]{.underline}]{.insertion author="2003"
date="2023-04-21T16:42:00Z"} [based on the molecular weight of
elements]{.underline} [[composition]{.underline}]{.deletion
author="2003" date="2023-04-21T16:42:00Z"} [and possible fragmentation
pattern of the MS/MS spectrum by
SIRIUS]{.underline}[[;]{.underline}]{.deletion author="2003"
date="2023-04-21T16:42:00Z"} [[.]{.underline}]{.insertion author="2003"
date="2023-04-21T16:42:00Z"} [[We then search for t]{.deletion
author="2003" date="2023-04-21T16:43:00Z"}[T]{.insertion author="2003"
date="2023-04-21T16:43:00Z"}he exact chemical structure]{.underline}
[[was then searched]{.underline}]{.insertion author="2003"
date="2023-04-21T16:43:00Z"} [from compound structure databases.
However, this process is often uncertain[, because]{.insertion
author="2003" date="2023-04-21T16:43:00Z"}]{.underline}
[[as]{.underline}]{.deletion author="2003" date="2023-04-21T16:43:00Z"}
[several factors can affect the reliability of MS/MS data and the
correctness of inference. SIRIUS generates a list of candidates for the
potential molecular formula, chemical structure, and chemical
classification behind each MS/MS spectral feature. In such cases,
MCnebula extract these candidates and determine the unique molecular
formula and chemical structure for each MS/MS spectrum based on the
highest score of prediction.]{.underline}

[**Top candidate selection by multiple score systems**. After the
process of compound prediction,]{.underline} [[we
get]{.underline}]{.deletion author="2003" date="2023-04-21T16:43:00Z"}
[candidates for molecular formula, structure, and chemical
classes]{.underline} [[were obtained]{.insertion author="2003"
date="2023-04-21T16:43:00Z"}. Some candidates are correct[,]{.insertion
author="2003" date="2023-04-21T16:43:00Z"} while others are not. [While
t]{.deletion author="2003" date="2023-04-21T16:43:00Z"}[T]{.insertion
author="2003" date="2023-04-21T16:43:00Z"}he correct predictions for
molecular formula and chemical structure are unique,]{.underline}
[[and]{.underline}]{.insertion author="2003"
date="2023-04-21T16:43:00Z"} [the chemical classification may have
multiple correct predictions belonging to different classes of
hierarchy. The scoring method depends on personalized research purpose.
[We can use s]{.deletion author="2003"
date="2023-04-21T16:44:00Z"}[S]{.insertion author="2003"
date="2023-04-21T16:44:00Z"}cores]{.underline} [[can be used]{.insertion
author="2003" date="2023-04-21T16:44:00Z"} based on various criteria
such as isotopes, mass error, structural similarity, or chemical classes
to rank and filter the candidates.]{.underline}
[[With]{.underline}]{.deletion author="2003"
date="2023-04-21T16:44:00Z"} [[Given the availability
of]{.underline}]{.insertion author="2003" date="2023-04-21T16:44:00Z"}
[numerous score systems]{.underline} [[available]{.deletion
author="2003" date="2023-04-21T16:44:00Z"},]{.underline} [[we filter
out]{.underline}]{.deletion author="2003" date="2023-04-21T16:44:00Z"}
[low-scoring candidates]{.underline} [[were filtered
out,]{.underline}]{.insertion author="2003" date="2023-04-21T16:44:00Z"}
[and]{.underline} [[focus on]{.underline}]{.deletion author="2003"
date="2023-04-21T16:44:00Z"} [those with higher scores, which are more
likely to be the correct compound[, were focused on]{.insertion
author="2003" date="2023-04-21T16:44:00Z"}. However, in most cases, the
top candidates from the three scoring systems are not always consistent.
[So]{.deletion author="2003"
date="2023-04-21T17:06:00Z"}[Hence]{.insertion author="2003"
date="2023-04-21T17:06:00Z"},]{.underline} [[we
choose]{.underline}]{.deletion author="2003"
date="2023-04-21T17:06:00Z"} [a 'specific candidate']{.underline} [[was
chosen]{.underline}]{.insertion author="2003"
date="2023-04-21T17:07:00Z"} [as a reference in the user-selected
scoring system[,]{.insertion author="2003" date="2023-04-21T17:07:00Z"}
and]{.underline} [[retrieve]{.underline}]{.deletion author="2003"
date="2023-04-21T17:07:00Z"} [its chemical information]{.underline}
[[was retrieved]{.underline}]{.insertion author="2003"
date="2023-04-21T17:07:00Z"} [from the other systems for data
integration. [We obtain u]{.deletion author="2003"
date="2023-04-21T17:07:00Z"}[U]{.insertion author="2003"
date="2023-04-21T17:07:00Z"}nique molecular formulae and chemical
structure]{.underline} [[were obtained]{.underline}]{.insertion
author="2003" date="2023-04-21T17:07:00Z"} [for]{.underline}
[[the]{.underline}]{.deletion author="2003" date="2023-04-21T17:07:00Z"}
[reference by scoring and ranking, [but for]{.deletion author="2003"
date="2023-04-21T17:07:00Z"}[while]{.insertion author="2003"
date="2023-04-21T17:07:00Z"} chemical
classes]{.underline}[[,]{.underline}]{.deletion author="2003"
date="2023-04-21T17:07:00Z"} [[require]{.underline}]{.insertion
author="2003" date="2023-04-21T17:07:00Z"} [more work]{.underline} [[is
needed]{.deletion author="2003"
date="2023-04-21T17:07:00Z"}.]{.underline}

[**Chemical classification**. Compounds with MS/MS spectrum can be
classified based on their overall structure or local structure, [which
we refer to]{.deletion author="2003" date="2023-04-21T17:08:00Z"}[and
they can be referred to]{.insertion author="2003"
date="2023-04-21T17:08:00Z"} as the dominant structure and substructure,
respectively. Therefore, in the chemical classification
system,]{.underline} [[we can classify]{.underline}]{.deletion
author="2003" date="2023-04-21T17:08:00Z"} [compounds [not
only]{.deletion author="2003" date="2023-04-21T17:08:00Z"}[can be
classified]{.insertion author="2003" date="2023-04-21T17:08:00Z"} based
on their dominant structure, [but also based on]{.deletion author="2003"
date="2023-04-21T17:08:00Z"}[as well as]{.insertion author="2003"
date="2023-04-21T17:08:00Z"} their substructure. When the dominant
structure is unavailable, or the MS/MS spectral fragment is
insufficient,]{.underline} [[we classify]{.deletion author="2003"
date="2023-04-21T17:08:00Z"} the compounds]{.underline} [[can be
classified]{.underline}]{.insertion author="2003"
date="2023-04-21T17:08:00Z"} [using substructure information to gain
knowledge]{.underline} [[of]{.underline}]{.deletion author="2003"
date="2023-04-21T17:08:00Z"} [[about]{.underline}]{.insertion
author="2003" date="2023-04-21T17:08:00Z"} [the compound.
Note:]{.underline} [[The]{.underline}]{.insertion author="2003"
date="2023-04-21T17:09:00Z"} [[Classifying]{.underline}]{.deletion
author="2003" date="2023-04-21T17:09:00Z"} [[classification
of]{.underline}]{.insertion author="2003" date="2023-04-21T17:09:00Z"}
[compounds based on their dominant structure is straightforward. For
example,]{.underline} [[we classify]{.underline}]{.deletion
author="2003" date="2023-04-21T17:09:00Z"} [Taxifolin]{.underline}
[[as]{.underline}]{.deletion author="2003" date="2023-04-21T17:09:00Z"}
[[is classified as]{.underline}]{.insertion author="2003"
date="2023-04-21T17:09:00Z"} [a Flavone[, not]{.deletion author="2003"
date="2023-04-21T17:09:00Z"}]{.underline} [[rather than]{.insertion
author="2003" date="2023-04-21T17:09:00Z"} a phenol,]{.underline}
[[even]{.underline}]{.deletion author="2003"
date="2023-04-21T17:09:00Z"} [[al]{.insertion author="2003"
date="2023-04-21T17:09:00Z"}though its local structure contains a phenol
substructure. [We prefer to classify c]{.deletion author="2003"
date="2023-04-21T17:09:00Z"}[C]{.insertion author="2003"
date="2023-04-21T17:09:00Z"}ompounds]{.underline} [[can be
classified]{.underline}]{.insertion author="2003"
date="2023-04-21T17:09:00Z"} [based on their dominant
structure[,]{.insertion author="2003" date="2023-04-21T17:09:00Z"}
because it is more concise and provides more information. However,
during the MS/MS spectral analysis,]{.underline} [[we sometimes can only
classify]{.underline}]{.deletion author="2003"
date="2023-04-21T17:09:00Z"} [compounds]{.underline}
[[can]{.underline}]{.insertion author="2003"
date="2023-04-21T17:09:00Z"} [[only be
classified]{.underline}]{.insertion author="2003"
date="2023-04-21T17:10:00Z"} [based on their substructure]{.underline}
[[sometimes]{.insertion author="2003"
date="2023-04-21T17:10:00Z"}.]{.underline}

**ABC selection**. The ABC selection algorithm evaluates all features
collectively in an untargeted LC-MS/MS dataset[,]{.deletion
author="2003" date="2023-04-21T17:10:00Z"} by examining the number and
abundance of features for each chemical classification at different
levels with both substructure and dominant structure. Based on this
analysis, representative classes are selected for subsequent analysis
([as shown in]{.deletion author="2003" date="2023-04-21T17:10:00Z"} Fig.
6).

-   Create Stardust Classes (Inner filter). By using the posterior
    probability of classification prediction [(PPCP)]{.deletion
    author="2003" date="2023-04-21T17:10:00Z"} data for each feature,
    simple threshold[,]{.insertion author="2003"
    date="2023-04-21T17:31:00Z"} or absolute conditions [are]{.deletion
    author="2003" date="2023-04-21T17:11:00Z"} [were]{.insertion
    author="2003" date="2023-04-21T17:11:00Z"} set to filter the
    chemical classes[, and refer to as]{.deletion author="2003"
    date="2023-04-21T17:11:00Z"} [through a method called]{.insertion
    author="2003" date="2023-04-21T17:11:00Z"} 'inner' filtering.

-   [Cross]{.deletion author="2003" date="2023-04-21T17:31:00Z"}
    [Cross-]{.insertion author="2003" date="2023-04-21T17:31:00Z"}filter
    Stardust Classes. This [method]{.insertion author="2003"
    date="2023-04-21T17:32:00Z"} involves [the]{.insertion author="2003"
    date="2023-04-21T17:32:00Z"} [combining]{.deletion author="2003"
    date="2023-04-21T17:32:00Z"} [combination of]{.insertion
    author="2003" date="2023-04-21T17:32:00Z"} the data of the chemical
    classes and their classified features (i.e. Stardust Classes data),
    grouping them based on the chemical classes, and then performing
    statistics on the features within each group. Statistics may also be
    performed on these data in conjunction with features annotation
    data[,]{.deletion author="2003" date="2023-04-21T17:32:00Z"} or
    [to]{.deletion author="2003" date="2023-04-21T17:32:00Z"} [for
    the]{.insertion author="2003" date="2023-04-21T17:32:00Z"}
    [compare]{.deletion author="2003" date="2023-04-21T17:32:00Z"}
    [comparison of]{.insertion author="2003"
    date="2023-04-21T17:32:00Z"} groups with each other. This method
    involves crossover of attributes for filtering[,]{.deletion
    author="2003" date="2023-04-21T17:32:00Z"} [.]{.insertion
    author="2003" date="2023-04-21T17:32:00Z"} [hence]{.deletion
    author="2003" date="2023-04-21T17:32:00Z"} [Hence,]{.insertion
    author="2003" date="2023-04-21T17:32:00Z"} it is referred to as
    'cross' filtering. (See details in the next subsection about Cross
    filter Stardust Classes[.]{.deletion author="2003"
    date="2023-04-21T17:33:00Z"})

The resulting dataset is called Nebula-Index, which records multiple
chemical classes and their associated features. Each chemical class is
considered as a 'Nebula'[,]{.insertion author="2003"
date="2023-04-21T17:35:00Z"} and its classified 'features' are the
components of the Nebula. These Nebulae are visualized as networks,
[with]{.deletion author="2003" date="2023-04-21T17:35:00Z"} [in which
the]{.insertion author="2003" date="2023-04-21T17:35:00Z"} Parent-Nebula
[representing]{.deletion author="2003" date="2023-04-21T17:35:00Z"}
[represents]{.insertion author="2003" date="2023-04-21T17:35:00Z"} all
features combined[,]{.insertion author="2003"
date="2023-04-21T17:35:00Z"} and [the]{.insertion author="2003"
date="2023-04-21T17:35:00Z"} Child-Nebulae [representing]{.deletion
author="2003" date="2023-04-21T17:35:00Z"} [represents]{.insertion
author="2003" date="2023-04-21T17:35:00Z"} individual classes with their
'features'.

**[Details of]{.underline}** [**[Cross]{.underline}**]{.deletion
author="2003" date="2023-04-21T17:39:00Z"} [**[Cross-]{.insertion
author="2003" date="2023-04-21T17:39:00Z"}filter Stardust Classes.**
This method involves]{.underline} [[the]{.underline}]{.insertion
author="2003" date="2023-04-21T17:39:00Z"}
[[integrating]{.underline}]{.deletion author="2003"
date="2023-04-21T17:39:00Z"} [[integration of]{.underline}]{.insertion
author="2003" date="2023-04-21T17:39:00Z"} [three modules, as shown in
Fig. 6:]{.underline}

[*Cross-filtering by 'quantity'* (abundance selection): The 'features'
quantity limitation]{.underline} [[is]{.underline}]{.deletion
author="2003" date="2023-04-21T17:39:00Z"}
[[was]{.underline}]{.insertion author="2003"
date="2023-04-21T17:39:00Z"} [set for each group (a chemical class with
its classified 'features'). The minimum quantity of 'features' within
the group and the maximum proportion of 'features' quantity within the
group versus all 'features' (unique) quantity of all groups]{.underline}
[[are]{.underline}]{.deletion author="2003" date="2023-04-21T17:39:00Z"}
[[w]{.insertion author="2003" date="2023-04-21T17:39:00Z"}[e]{.insertion
author="2003"
date="2023-04-21T17:40:00Z"}]{.underline}[[re]{.underline}]{.insertion
author="2003" date="2023-04-21T17:39:00Z"} [used as thresholds. Chemical
classes with too many or too few 'features']{.underline}
[[are]{.underline}]{.deletion author="2003" date="2023-04-21T17:40:00Z"}
[[were]{.underline}]{.insertion author="2003"
date="2023-04-21T17:40:00Z"} [filtered out.]{.underline}

[*Cross-filtering by 'score'* (Goodness assessment): This step
associates the Stardust Classes data with 'features' annotation data.
For each group, the Goodness assessment]{.underline}
[[is]{.underline}]{.deletion author="2003" date="2023-04-21T17:40:00Z"}
[[was]{.underline}]{.insertion author="2003"
date="2023-04-21T17:40:00Z"} [performed for each target attribute
(continuous attribute, generally a scoring attribute of compound
identification, such as 'Tanimoto similarity'). If the group satisfies
all the expected Goodness, the chemical class is retained. The Goodness
(]{.underline}$G$[)]{.underline} [[is]{.underline}]{.deletion
author="2003" date="2023-04-21T17:40:00Z"}
[[was]{.underline}]{.insertion author="2003"
date="2023-04-21T17:40:00Z"} [calculated [as follows:]{.deletion
author="2003" date="2023-04-21T17:40:00Z"}[using the
equation]{.insertion author="2003"
date="2023-04-21T17:40:00Z"}]{.underline} $G = n/N$[, where]{.underline}
$n$ [is the quantity of 'features' of which the target attributes
satisfy the cut-off, and]{.underline} $N$ [is the quantity of all
'features'.]{.underline}

[The assessment of Goodness is related to the parameters of 'tolerance'
and 'cutoff']{.underline}[[:]{.underline}]{.deletion author="2003"
date="2023-04-21T17:40:00Z"} [[, namely,]{.underline}]{.insertion
author="2003" date="2023-04-21T17:40:00Z"} [the expected Goodness value
of 'tolerance' and the actual Goodness, which]{.underline}
[[is]{.underline}]{.deletion author="2003" date="2023-04-21T17:40:00Z"}
[[are]{.underline}]{.insertion author="2003"
date="2023-04-21T17:40:00Z"} [related to the parameter
'cutoff'.]{.underline}

[Goodness assessment can be]{.underline} [[given]{.underline}]{.deletion
author="2003" date="2023-04-21T17:40:00Z"}
[[assigned]{.underline}]{.insertion author="2003"
date="2023-04-21T17:40:00Z"} [to multiple target attributes. [Note that
t]{.deletion author="2003" date="2023-04-21T17:40:00Z"}[T]{.insertion
author="2003" date="2023-04-21T17:40:00Z"}he chemical class is retained
only if it passes the Goodness assessment of all target
attributes.]{.underline} [[The]{.underline}]{.deletion author="2003"
date="2023-04-21T17:41:00Z"} [[This step]{.underline}]{.insertion
author="2003" date="2023-04-21T17:41:00Z"} [main[ly]{.insertion
author="2003" date="2023-04-21T17:41:00Z"} [purpose of this step
is]{.deletion author="2003"
date="2023-04-21T17:41:00Z"}[aims]{.insertion author="2003"
date="2023-04-21T17:41:00Z"} to filter out chemical classes with too
many 'features' of low structural identification.]{.underline}

[*Cross-filtering by 'identical'* (identicality assessment): This step
involves a similarity assessment of chemical classes. A hierarchical
range]{.underline} [[is]{.underline}]{.deletion author="2003"
date="2023-04-21T17:42:00Z"} [[was]{.underline}]{.insertion
author="2003" date="2023-04-21T17:42:00Z"} [set for chemical
classification, and groups within this range]{.underline}
[[are]{.underline}]{.deletion author="2003" date="2023-04-21T17:42:00Z"}
[[were]{.underline}]{.insertion author="2003"
date="2023-04-21T17:42:00Z"} [compared for similarity. If the classified
'features' of two groups are almost identical to each other, the
chemical class represented by one of the groups is excluded. The degree
of identicality between two groups (A and B) [is assessed, as well
as]{.deletion author="2003" date="2023-04-21T17:42:00Z"}[and]{.insertion
author="2003" date="2023-04-21T17:42:00Z"} the value of the parameter
'identical_factor' (]{.underline}$i$[) [were assessed as
follows]{.insertion author="2003"
date="2023-04-21T17:42:00Z"}:]{.underline}

$x$[: ratio of the classified 'features' of A belonging to
B]{.underline}

$y$[: ratio of the classified 'features' of B belonging to
A]{.underline}

$i$[: value of parameter 'identical_factor']{.underline}

[If]{.underline} $x > i$ [and]{.underline} $y > i$[, the two groups are
considered identical, and the group with fewer 'features' is discarded.
Th[e purpose of th]{.deletion author="2003"
date="2023-04-21T17:42:00Z"}is step]{.underline}
[[is]{.underline}]{.deletion author="2003" date="2023-04-21T17:42:00Z"}
[[aims]{.underline}]{.insertion author="2003"
date="2023-04-21T17:42:00Z"} [to filter out classes that may incorporate
each other and are similar in scope. The in silico prediction approach
may not be able to distinguish]{.underline}
[[which]{.underline}]{.deletion author="2003"
date="2023-04-21T17:44:00Z"} [[the]{.underline}]{.insertion
author="2003" date="2023-04-21T17:44:00Z"} [class]{.underline} [[in
which]{.underline}]{.insertion author="2003"
date="2023-04-21T17:44:00Z"} [the potential compound belongs to from the
LC-MS/MS spectra.]{.underline}

[**Network graph presentation**. The features and their
annotations]{.underline} [[are]{.underline}]{.deletion author="2003"
date="2023-04-21T17:50:00Z"} [[were]{.underline}]{.insertion
author="2003" date="2023-04-21T17:50:00Z"} [integrated as Nebulae based
on the Nebula-Index. These Nebulae are represented as network-type graph
data. The feature annotation data includes top candidates for chemical
formula and structure. The MS/MS spectral similarity of the
features]{.underline} [[is]{.underline}]{.deletion author="2003"
date="2023-04-21T17:51:00Z"} [[was]{.underline}]{.insertion
author="2003" date="2023-04-21T17:51:00Z"} [calculated and used to
generate the edge data for the network graph.]{.underline}

[**Visualization system**. MCnebula integrates various R packages to
format data, including the 'ggplot2' package. [To make]{.deletion
author="2003" date="2023-04-21T17:51:00Z"}[For the ease of]{.insertion
author="2003" date="2023-04-21T17:51:00Z"} visualization [easier
for]{.deletion author="2003"
date="2023-04-21T17:51:00Z"}[among]{.insertion author="2003"
date="2023-04-21T17:51:00Z"} users,]{.underline} [[we
developed]{.underline}]{.deletion author="2003"
date="2023-04-21T17:51:00Z"} [the 'ggset' data class, which stores
pre-defined ggplot2 plotting functions and parameters for visualizing
Nebulae[, was developed]{.insertion author="2003"
date="2023-04-21T17:51:00Z"}. Users can customize the visualization
according to their specific needs or the requirements of the
publisher.]{.underline}

[**Statistical analysis**. MCnebula integrates the functions of the
'limma' package for]{.underline} [[the]{.underline}]{.insertion
author="2003" date="2023-04-21T17:52:00Z"} [differential expression
analysis of RNA-sequence and microarray
data\[40]{.underline}[[\],]{.underline}]{.deletion author="2003"
date="2023-04-21T17:52:00Z"} [[\].]{.underline}]{.insertion
author="2003" date="2023-04-21T17:52:00Z"} [[and]{.underline}]{.deletion
author="2003" date="2023-04-21T17:52:00Z"} [[Then, they are stored
as]{.underline}]{.insertion author="2003" date="2023-04-21T17:52:00Z"}
[package]{.underline} [[them]{.underline}]{.deletion author="2003"
date="2023-04-21T17:52:00Z"} [for]{.underline} [[the]{.insertion
author="2003" date="2023-04-21T17:52:00Z"} differential analysis of
metabolomics data. The gene expression]{.underline}
[[matrix]{.underline}]{.deletion author="2003"
date="2023-04-21T17:52:00Z"} [and feature quantification]{.underline}
[[matrix]{.underline}]{.deletion author="2003"
date="2023-04-21T17:52:00Z"} [[matrices]{.underline}]{.insertion
author="2003" date="2023-04-21T17:52:00Z"} [of LC-MS are
similar,]{.underline} [[and]{.underline}]{.insertion author="2003"
date="2023-04-21T17:52:00Z"} [both have phenotypic variables (sample
information) and dependent variables (gene expression or feature
quantification values).]{.underline} [[Our]{.underline}]{.deletion
author="2003" date="2023-04-21T17:52:00Z"} [[The use of
our]{.underline}]{.insertion author="2003" date="2023-04-21T17:52:00Z"}
[method [can be]{.deletion author="2003"
date="2023-04-21T17:52:00Z"}[is]{.insertion author="2003"
date="2023-04-21T17:52:00Z"} appropriate for]{.underline}
[[the]{.underline}]{.insertion author="2003"
date="2023-04-21T17:52:00Z"} [statistical analysis of]{.underline}
[[the]{.underline}]{.insertion author="2003"
date="2023-04-21T17:52:00Z"} [feature quantification of experimental
designs[,]{.insertion author="2003" date="2023-04-21T17:52:00Z"} in
which explanatory variables are factorial variables[,]{.insertion
author="2003" date="2023-04-21T17:52:00Z"} and the design matrix is
without an intercept \[41\].]{.underline}

[**Data structure**. MCnebula was primarily developed using the R S4
system of object-oriented programming. All data including 'features'
annotation]{.underline} [[data]{.underline}]{.deletion author="2003"
date="2023-04-21T17:53:00Z"} [and visualization data]{.underline}
[[is]{.underline}]{.deletion author="2003" date="2023-04-21T17:53:00Z"}
[[are]{.underline}]{.insertion author="2003"
date="2023-04-21T17:53:00Z"} [stored in a single object (class
'mcnebula'),]{.underline} [[which]{.underline}]{.deletion author="2003"
date="2023-04-21T17:53:00Z"} [[and this process]{.underline}]{.insertion
author="2003" date="2023-04-21T17:53:00Z"} [simplifies the
application,]{.underline} [[makes]{.underline}]{.deletion author="2003"
date="2023-04-21T17:53:00Z"} [[making]{.underline}]{.insertion
author="2003" date="2023-04-21T17:53:00Z"} [data management and analysis
easier to perform and repeat.]{.underline}

[**Reporting system**. MCnebula includes a reporting system that enables
the analysis process to be]{.underline} [[exported]{.insertion
author="2003" date="2023-04-21T17:53:00Z"} [output as a]{.deletion
author="2003" date="2023-04-21T17:53:00Z"}[in]{.insertion author="2003"
date="2023-04-21T17:53:00Z"} PDF]{.underline}
[[document]{.underline}]{.deletion author="2003"
date="2023-04-21T17:53:00Z"} [or in other formats. The reporting system
is based on the 'report' data class, which stores each step of the
analysis as a section and can be easily modified according to the
user['s]{.deletion author="2003" date="2023-04-21T17:53:00Z"}
requirements. Furthermore, the 'rmarkdown' R package \[43\]]{.underline}
[[is]{.underline}]{.deletion author="2003" date="2023-04-21T17:54:00Z"}
[[was]{.underline}]{.insertion author="2003"
date="2023-04-21T17:54:00Z"} [incorporated in the reporting system to
generate reports.]{.underline}

[**Code Compatibility**. MCnebula performs downstream analysis by
extracting data from the pre-computed SIRIUS project, which is the
primary data source for MCnebula 2. The SIRIUS software is continually
updated and enhanced. From SIRIUS version 4 to version 5
(https://github.com/boecker-lab/sirius), the data structure and
attribute names in the project directory have been modified. [To ensure
that]{.deletion author="2003" date="2023-04-21T17:54:00Z"}[The effect of
other version problems on]{.insertion author="2003"
date="2023-04-21T17:54:00Z"} MCnebula]{.underline} [[is not affected by
version problems,]{.underline}]{.deletion author="2003"
date="2023-04-21T17:54:00Z"} [[was eliminated]{.insertion author="2003"
date="2023-04-21T17:54:00Z"} [we have]{.deletion author="2003"
date="2023-04-21T17:54:00Z"}[by]{.insertion author="2003"
date="2023-04-21T17:54:00Z"}]{.underline}
[[designed]{.underline}]{.deletion author="2003"
date="2023-04-21T17:54:00Z"} [[designing]{.underline}]{.insertion
author="2003" date="2023-04-21T17:54:00Z"} [its application programming
interface (API) for various SIRIUS versions.]{.underline}

### MCnebula evaluation

**Spectra dataset for evaluation**. T[o evaluate t]{.deletion
author="2003" date="2023-04-21T17:55:00Z"}he performance of
MCnebula[,]{.deletion author="2003" date="2023-04-21T17:55:00Z"} [was
evaluated using]{.insertion author="2003" date="2023-04-21T17:55:00Z"}
the spectra from the GNPS MS/MS library [was used]{.deletion
author="2003" date="2023-04-21T17:55:00Z"}
(http://prime.psc.riken.jp/compms/msdial/main.html#MSP). [To prevent
o]{.deletion author="2003" date="2023-04-21T17:55:00Z"}[O]{.insertion
author="2003" date="2023-04-21T17:55:00Z"}verfitting during library
match evaluation [was prevented by adding]{.insertion author="2003"
date="2023-04-21T17:55:00Z"}[,]{.deletion author="2003"
date="2023-04-21T17:55:00Z"} 'noise' [was added]{.deletion author="2003"
date="2023-04-21T17:55:00Z"} to the MS/MS spectra\[44\]. Two models of
noise were simulated[:]{.deletion author="2003"
date="2023-04-21T17:55:00Z"} [, including]{.insertion author="2003"
date="2023-04-21T17:55:00Z"} medium [noise]{.deletion author="2003"
date="2023-04-21T17:55:00Z"} and high noise. The simulation involved a
global mass shift, individual mass deviations, intensity variations, and
additional 'noise peaks.' Isotope patterns were also simulated using the
'get.isotopes.pattern' function within the 'rcdk' R package\[45\]. The
mass and abundance of isotopes were considered for the adduct type to
increase or decrease exact mass. The 'isotope peaks' were merged into
the MS^1^ list of compounds, and all spectra collections were formatted
into mgf or csv file for the continuing MCnebula and benchmark analysis.

**Evaluation method.** MCnebula and benchmark workflow was conducted for
all the three simulated datasets. SIRIUS 4 command-line interface
[(CLI)]{.deletion author="2003" date="2023-04-21T17:56:00Z"} (version
4.9.12) was applied for computation, and [filtered out]{.deletion
author="2003" date="2023-04-21T17:56:00Z"} MS/MS spectra with empty
fragmentation peaks [were filtered out]{.insertion author="2003"
date="2023-04-21T17:56:00Z"}. In total[,]{.insertion author="2003"
date="2023-04-21T17:56:00Z"} 7[,]{.insertion author="2003"
date="2023-04-21T17:56:00Z"}524 out of 8[,]{.insertion author="2003"
date="2023-04-21T17:56:00Z"}782 compounds were left for evaluation.
ClassyFire was used to assess the classification accuracy\[24\]. After
in[-]{.deletion author="2003" date="2023-04-21T17:56:00Z"} []{.insertion
author="2003" date="2023-04-21T17:56:00Z"}silico annotation, [we
obtained]{.deletion author="2003" date="2023-04-21T17:56:00Z"} structure
annotation, International Chemical Identifier Key (InChIKey), and other
metadata of these compounds [were obtained]{.insertion author="2003"
date="2023-04-21T17:56:00Z"}. Considering that ClassyFire only supports
chemical identities [those]{.deletion author="2003"
date="2023-04-21T17:56:00Z"} [with]{.insertion author="2003"
date="2023-04-21T17:56:00Z"} structures [that]{.insertion author="2003"
date="2023-04-21T17:56:00Z"} have been classified in its server
previously, [we used]{.deletion author="2003"
date="2023-04-21T17:57:00Z"} the first hash block of InChIKeys (InChIKey
planar, which represents the molecular skeleton) [was used]{.insertion
author="2003" date="2023-04-21T17:57:00Z"} to query the PubChem
[application programming interface (]{.deletion author="2003"
date="2023-04-21T17:55:00Z"}API[)]{.deletion author="2003"
date="2023-04-21T17:55:00Z"}
(https://pubchemdocs.ncbi.nlm.nih.gov/pug-rest) \[46\]. This
[process]{.insertion author="2003" date="2023-04-21T17:57:00Z"} provided
us with all the possible InChIKeys of isomerism (stereo, isotopic
substitution) \[47\]. [The]{.insertion author="2003"
date="2023-04-21T17:57:00Z"} []{.insertion author="2003"
date="2023-04-21T18:04:00Z"}[Classification]{.deletion author="2003"
date="2023-04-21T18:04:00Z"} [classification]{.insertion author="2003"
date="2023-04-21T18:04:00Z"} of small molecules depends on their
molecular skeleton[,]{.deletion author="2003"
date="2023-04-21T18:04:00Z"} [. Hence,]{.insertion author="2003"
date="2023-04-21T18:04:00Z"} [so]{.deletion author="2003"
date="2023-04-21T18:04:00Z"} chemical identities that share the same
InChIKey planar are identical in classification. The InChIKey list was
imported into ClassyFire to obtain chemical classification. In
[our]{.deletion author="2003" date="2023-04-21T18:04:00Z"}
[the]{.insertion author="2003" date="2023-04-21T18:04:00Z"} R script,
once any InChIKey of isomerism matched the classified data in the
database, [we turned off]{.deletion author="2003"
date="2023-04-21T18:04:00Z"} the acquisition status for this molecular
skeleton [was turned off]{.insertion author="2003"
date="2023-04-21T18:04:00Z"}. [In the end]{.deletion author="2003"
date="2023-04-21T18:04:00Z"}[Finally]{.insertion author="2003"
date="2023-04-21T18:04:00Z"}, [we collated, integrated, and
assigned]{.deletion author="2003" date="2023-04-21T18:04:00Z"} all these
chemical annotations [were collated, integrated, and
assigned]{.insertion author="2003" date="2023-04-21T18:04:00Z"} as
standard reference.

[Due to]{.deletion author="2003"
date="2023-04-21T18:04:00Z"}[Considering the]{.insertion author="2003"
date="2023-04-21T18:04:00Z"} differences in algorithms and classified
results, [we evaluated]{.deletion author="2003"
date="2023-04-21T18:04:00Z"} the MCnebula and benchmark methods [were
evaluated]{.insertion author="2003" date="2023-04-21T18:04:00Z"}
separately. [Since]{.deletion author="2003" date="2023-04-21T18:04:00Z"}
[Given that]{.insertion author="2003" date="2023-04-21T18:04:00Z"}
sub-structural classification was not available for the benchmark
method, [we excluded]{.deletion author="2003"
date="2023-04-21T18:05:00Z"} these classes [were excluded]{.insertion
author="2003" date="2023-04-21T18:05:00Z"} during the evaluation
analysis. Nevertheless, some compounds within the remaining classes may
still be classified into sub-structural classes. [We assigned
t]{.deletion author="2003" date="2023-04-21T18:05:00Z"}[T]{.insertion
author="2003" date="2023-04-21T18:05:00Z"}hree levels [were
assigned]{.insertion author="2003" date="2023-04-21T18:05:00Z"} for
evaluation[:]{.deletion author="2003" date="2023-04-21T18:05:00Z"} [,
including]{.insertion author="2003" date="2023-04-21T18:05:00Z"} 'True,'
'Latent,' and 'False.' 'True' indicated that the classified classes were
consistent with those of ClassyFire. 'Latent' indicated that the
classified classes were not consistent with ClassyFire, but their parent
classes at the 'class' level were consistent. 'False' indicated that the
classified classes were completely inconsistent with ClassyFire. Then,
the true positive (TP) was assigned as: 'True' + 'Latent'[;]{.deletion
author="2003" date="2023-04-21T18:05:00Z"} [, while]{.insertion
author="2003" date="2023-04-21T18:05:00Z"} the false positive (FP) was
assigned as 'False'.

T[o evaluate t]{.deletion author="2003" date="2023-04-21T18:05:00Z"}he
identification of classes or structures [was evaluated]{.insertion
author="2003" date="2023-04-21T18:05:00Z"} [, we]{.deletion
author="2003" date="2023-04-21T18:05:00Z"}[by]{.insertion author="2003"
date="2023-04-21T18:05:00Z"} [merged]{.deletion author="2003"
date="2023-04-21T18:05:00Z"} [merging]{.insertion author="2003"
date="2023-04-21T18:05:00Z"} the results with a standard reference by
InChIKey planar. For the evaluation of chemical structure
identification, [we considered]{.deletion author="2003"
date="2023-04-21T18:05:00Z"} a structure [was considered]{.insertion
author="2003" date="2023-04-21T18:05:00Z"} as 'True' if it matched the
chemical structure identified by InChIKey planar. However, this
evaluation neglected stereochemistry [due to]{.deletion author="2003"
date="2023-04-21T18:06:00Z"}[because of]{.insertion author="2003"
date="2023-04-21T18:06:00Z"} the limit of LC-MS/MS detection.

### [Other information]{.underline}

[More methodological details regarding the MCnebula assessment, handling
of samples in the study (serum and phytochemicals), data processing, and
acquisition of available data and codes are documented in the
supplemental file.]{.underline}

## Results and discussion

### Results

#### [Overview]{.underline}

[The MCnebula workflow was dedicated]{.underline}
[[to]{.underline}]{.deletion author="2003" date="2023-04-21T18:06:00Z"}
[[for the]{.underline}]{.insertion author="2003"
date="2023-04-21T18:06:00Z"} [[analyzing]{.underline}]{.deletion
author="2003" date="2023-04-21T18:06:00Z"} [[analysis
of]{.underline}]{.insertion author="2003" date="2023-04-21T18:06:00Z"}
[LC-MS/MS datasets [from the beginning, i.e. ]{.deletion author="2003"
date="2023-04-21T18:06:00Z"}starting from the raw data obtained from the
sample and going through the various stages of analysis to obtain a
complete analysis report (Fig. 2). The analysis process followed the
general MCnebula analysis templates[,]{.deletion author="2003"
date="2023-04-21T18:06:00Z"} from filtering]{.underline}
[[the]{.underline}]{.insertion author="2003"
date="2023-04-21T18:06:00Z"} [candidates of chemical formula, structural
formulae,]{.underline} [[and]{.underline}]{.insertion author="2003"
date="2023-04-21T18:06:00Z"} [chemical
classes]{.underline}[[,]{.underline}]{.deletion author="2003"
date="2023-04-21T18:06:00Z"} [[until]{.underline}]{.insertion
author="2003" date="2023-04-21T18:06:00Z"} [[to]{.underline}]{.deletion
author="2003" date="2023-04-21T18:06:00Z"}
[[the]{.underline}]{.insertion author="2003"
date="2023-04-21T18:06:00Z"} [[creating]{.underline}]{.deletion
author="2003" date="2023-04-21T18:06:00Z"} [[creation
of]{.underline}]{.insertion author="2003" date="2023-04-21T18:06:00Z"}
[visual Nebulae]{.underline}[[;]{.underline}]{.deletion author="2003"
date="2023-04-21T18:06:00Z"} [[.]{.underline}]{.insertion author="2003"
date="2023-04-21T18:06:00Z"} [[it]{.underline}]{.deletion author="2003"
date="2023-04-21T18:06:00Z"} [[It]{.underline}]{.insertion author="2003"
date="2023-04-21T18:06:00Z"} [also allowed for custom advanced
analysis[,]{.deletion author="2003" date="2023-04-21T18:06:00Z"} with
the help of chemical class focused Nebulae[,]{.deletion author="2003"
date="2023-04-21T18:06:00Z"} to perform statistic[al]{.insertion
author="2003" date="2023-04-21T18:06:00Z"} analysis,
feature[s]{.deletion author="2003" date="2023-04-21T18:06:00Z"}
selection, focus on critical metabolites (compounds) and their
structural characteristics, pathway enrichment,]{.underline}
[[and]{.underline}]{.insertion author="2003"
date="2023-04-21T18:07:00Z"} [querying compound synonyms[,
etc]{.deletion author="2003" date="2023-04-21T18:07:00Z"}.]{.underline}
[[We evaluated]{.underline}]{.deletion author="2003"
date="2023-04-21T18:07:00Z"} [[The]{.underline}]{.insertion
author="2003" date="2023-04-21T18:07:00Z"} [workflow of MCnebula in
function with other popular public available methods]{.underline} [[was
also evaluated]{.insertion author="2003" date="2023-04-21T18:07:00Z"}.
In terms of the evaluation of our chosen indicators[,]{.insertion
author="2003" date="2023-04-21T18:07:00Z"} which cover
identification]{.underline}[[,]{.underline}]{.deletion author="2003"
date="2023-04-21T18:07:00Z"} [[and]{.underline}]{.insertion
author="2003" date="2023-04-21T18:07:00Z"} [[classifying]{.deletion
author="2003" date="2023-04-21T18:07:00Z"}[classification]{.insertion
author="2003" date="2023-04-21T18:07:00Z"}[, etc.]{.deletion
author="2003" date="2023-04-21T18:07:00Z"}, MCnebula has a wider scope
of applicability[.]{.deletion author="2003" date="2023-04-21T18:07:00Z"}
(Tab. S1)[.]{.insertion author="2003"
date="2023-04-21T18:07:00Z"}]{.underline}

#### Method evaluation

**Classified accuracy.** [We used a]{.deletion author="2003"
date="2023-04-21T18:07:00Z"}[A]{.insertion author="2003"
date="2023-04-21T18:07:00Z"} public[ly]{.insertion author="2003"
date="2023-04-21T18:07:00Z"} available reference spectral library [was
used]{.insertion author="2003" date="2023-04-21T18:07:00Z"} to assess
the accuracy of [classifying]{.deletion author="2003"
date="2023-04-21T18:07:00Z"} [classification]{.insertion author="2003"
date="2023-04-21T18:07:00Z"} by MCnebula. The direct use of such a
reference spectral library may lead to over-fitting during the
evaluation. [We have taken the approach of simulating n]{.deletion
author="2003" date="2023-04-21T18:07:00Z"}[N]{.insertion author="2003"
date="2023-04-21T18:08:00Z"}oise [was simulated]{.insertion
author="2003" date="2023-04-21T18:08:00Z"} to eliminate this
consequence. [Simulating]{.deletion author="2003"
date="2023-04-21T18:08:00Z"} [Simulation of]{.insertion author="2003"
date="2023-04-21T18:08:00Z"} noise, [i.e.,]{.deletion author="2003"
date="2023-04-21T18:08:00Z"}[which involves the]{.insertion
author="2003" date="2023-04-21T18:08:00Z"} [adding]{.deletion
author="2003" date="2023-04-21T18:08:00Z"} [addition of]{.insertion
author="2003" date="2023-04-21T18:08:00Z"} invalid noisy data to the
reference spectrum or numerically shifting the existing data, also
simulates data acquisition similar to a real scenario[:]{.deletion
author="2003" date="2023-04-21T18:08:00Z"} [.]{.insertion author="2003"
date="2023-04-21T18:08:00Z"} [due to]{.deletion author="2003"
date="2023-04-21T18:08:00Z"}[Considering]{.insertion author="2003"
date="2023-04-21T18:08:00Z"} the different acquisition conditions, the
spectral data in the real case will be [more noisy]{.deletion
author="2003" date="2023-04-21T18:08:00Z"} [noisier]{.insertion
author="2003" date="2023-04-21T18:08:00Z"} compared [to]{.deletion
author="2003" date="2023-04-21T18:08:00Z"} [with]{.insertion
author="2003" date="2023-04-21T18:08:00Z"} the reference spectrum. By
adding noise to the reference spectral library, [we now have]{.deletion
author="2003" date="2023-04-21T18:09:00Z"} three datasets [become
available]{.insertion author="2003" date="2023-04-21T18:09:00Z"} for
evaluation (origin, medium noise[,]{.insertion author="2003"
date="2023-04-21T18:09:00Z"} and high noise dataset[) (]{.deletion
author="2003" date="2023-04-21T18:09:00Z"}[;]{.insertion author="2003"
date="2023-04-21T18:09:00Z"} commonly 7[,]{.insertion author="2003"
date="2023-04-21T18:09:00Z"}524 compounds [(]{.deletion author="2003"
date="2023-04-21T18:09:00Z"}[\[]{.insertion author="2003"
date="2023-04-21T18:09:00Z"}spectra[)).]{.deletion author="2003"
date="2023-04-21T18:09:00Z"} [\]).]{.insertion author="2003"
date="2023-04-21T18:09:00Z"} All three datasets were analyzed using
MCnebula. [Due to]{.deletion author="2003"
date="2023-04-21T18:09:00Z"}[Considering]{.insertion author="2003"
date="2023-04-21T18:09:00Z"} the richness of the compounds in the
reference spectra, for the origin dataset, [we obtained a total
of]{.deletion author="2003" date="2023-04-21T18:09:00Z"} 152 chemical
classes (each with a corresponding compound to be evaluated) [were
obtained]{.insertion author="2003" date="2023-04-21T18:09:00Z"}
[via]{.deletion author="2003" date="2023-04-21T18:09:00Z"} using
[the]{.insertion author="2003" date="2023-04-21T18:09:00Z"} ABC
selection algorithm. These 152 chemical classes include both chemical
classes refined on the basis of dominant structures and chemical classes
refined on the basis of substructures. [To facilitate c]{.deletion
author="2003" date="2023-04-21T18:09:00Z"}[C]{.insertion author="2003"
date="2023-04-21T18:09:00Z"}omparison with other methods[,]{.deletion
author="2003" date="2023-04-21T18:09:00Z"} [was facilitated]{.insertion
author="2003" date="2023-04-21T18:09:00Z"} [we]{.deletion author="2003"
date="2023-04-21T18:09:00Z"}[by]{.insertion author="2003"
date="2023-04-21T18:09:00Z"} [selected]{.deletion author="2003"
date="2023-04-21T18:10:00Z"} [selecting]{.insertion author="2003"
date="2023-04-21T18:10:00Z"} only chemical classes that are likely to be
dominant structures for evaluation. [There were]{.deletion author="2003"
date="2023-04-21T18:10:00Z"}[A total of]{.insertion author="2003"
date="2023-04-21T18:10:00Z"} 37 [of]{.insertion author="2003"
date="2023-04-21T18:10:00Z"} such chemical classes [that]{.deletion
author="2003" date="2023-04-21T18:10:00Z"} were selected for evaluation.
[To evaluate]{.deletion author="2003" date="2023-04-21T18:10:00Z"}
MCnebula [was evaluated]{.insertion author="2003"
date="2023-04-21T18:10:00Z"} [more]{.deletion author="2003"
date="2023-04-21T18:10:00Z"} objectively[, we]{.deletion author="2003"
date="2023-04-21T18:10:00Z"} [by]{.insertion author="2003"
date="2023-04-21T18:10:00Z"} [chose]{.deletion author="2003"
date="2023-04-21T18:10:00Z"} [choosing]{.insertion author="2003"
date="2023-04-21T18:10:00Z"} the molecular networking provided by GNPS
[(Global Natural Products Social Molecular Networking)]{.deletion
author="2003" date="2023-04-21T18:10:00Z"}, with the modules of
Feature-based molecular networking (FBMN) and MolNetEnhancer, as the
benchmark method to provide a visualized clustering analysis of mass
spectra data. GNPS is a typical and popular spectral library-based mass
spectrometry annotation method. [In]{.deletion author="2003"
date="2023-04-21T18:10:00Z"} [By]{.insertion author="2003"
date="2023-04-21T18:10:00Z"} principle, it first calculates spectral
similarity by conducting mirror match with public spectral library,
identifies compounds with the exact chemical structures, and then
determines the chemical class based on the annotated chemical structure.

[We uploaded t]{.deletion author="2003"
date="2023-04-21T18:10:00Z"}[T]{.insertion author="2003"
date="2023-04-21T18:10:00Z"}he three datasets [were uploaded]{.insertion
author="2003" date="2023-04-21T18:10:00Z"} to the GNPS
server[,]{.insertion author="2003" date="2023-04-21T18:10:00Z"} and
[then obtained]{.deletion author="2003" date="2023-04-21T18:10:00Z"} the
results [and used them for]{.deletion author="2003"
date="2023-04-21T18:11:00Z"}[obtained were]{.insertion author="2003"
date="2023-04-21T18:11:00Z"} [evaluation]{.deletion author="2003"
date="2023-04-21T18:11:00Z"}[evaluated]{.insertion author="2003"
date="2023-04-21T18:11:00Z"}. For origin dataset, GNPS resulted in [a
total of]{.deletion author="2003" date="2023-04-21T18:11:00Z"} 44
chemical classes (parallel to MCnebula, with at least 50 compounds per
chemical class). [There were]{.deletion author="2003"
date="2023-04-21T18:11:00Z"}[A total of]{.insertion author="2003"
date="2023-04-21T18:11:00Z"} 19 common classes [in total]{.deletion
author="2003" date="2023-04-21T18:11:00Z"}[were obtained]{.insertion
author="2003" date="2023-04-21T18:11:00Z"}. These classes were selected
to compare MCnebula and GNPS in parallel in terms of classified number,
stability, precision[,]{.insertion author="2003"
date="2023-04-21T18:11:00Z"} and recall. For the classified number (TP +
FP), MCnebula outperformed GNPS in three datasets (MCnebula: 199, 178,
160; GNPS: 162, 95, 81[) (]{.deletion author="2003"
date="2023-04-21T18:11:00Z"}[;]{.insertion author="2003"
date="2023-04-21T18:11:00Z"} Fig. 3a). For the stability of the
classifying after adding noise, MCnebula outperformed GNPS in two
dataset (MCnebula: 89.5%, 81.2%; GNPS: 59.3%, 49.9%[) (]{.deletion
author="2003" date="2023-04-21T18:11:00Z"}[;]{.insertion author="2003"
date="2023-04-21T18:11:00Z"} Fig. 3a). For the indicators of precision,
[to assess]{.deletion author="2003" date="2023-04-21T18:11:00Z"} the
performance of [classifying]{.deletion author="2003"
date="2023-04-21T18:11:00Z"}[classification was assessed]{.insertion
author="2003" date="2023-04-21T18:11:00Z"} [, it]{.deletion
author="2003" date="2023-04-21T18:11:00Z"}[by]{.insertion author="2003"
date="2023-04-21T18:11:00Z"} [combined]{.deletion author="2003"
date="2023-04-21T18:11:00Z"} [combining]{.insertion author="2003"
date="2023-04-21T18:11:00Z"} the level of the stability to calculate the
relative false rate, rather than the absolute false rate[,]{.deletion
author="2003" date="2023-04-21T18:11:00Z"} [.]{.insertion author="2003"
date="2023-04-21T18:11:00Z"} [then]{.deletion author="2003"
date="2023-04-21T18:11:00Z"} [Then,]{.insertion author="2003"
date="2023-04-21T18:11:00Z"} [it]{.deletion author="2003"
date="2023-04-21T18:11:00Z"} [th]{.insertion author="2003"
date="2023-04-21T18:11:00Z"}[is parameter]{.insertion author="2003"
date="2023-04-21T18:12:00Z"} []{.insertion author="2003"
date="2023-04-21T18:11:00Z"}was used to estimate precision. The relative
false rate [better]{.deletion author="2003" date="2023-04-21T18:12:00Z"}
[effectively]{.insertion author="2003" date="2023-04-21T18:12:00Z"}
simulated the actual application to LC-MS/MS analysis, [since]{.deletion
author="2003" date="2023-04-21T18:12:00Z"} [because]{.insertion
author="2003" date="2023-04-21T18:12:00Z"} the actual spectral data
contains [not only]{.deletion author="2003" date="2023-04-21T18:12:00Z"}
noise [but also]{.deletion author="2003"
date="2023-04-21T18:12:00Z"}[and]{.insertion author="2003"
date="2023-04-21T18:12:00Z"} many unknown compounds that cannot be
identified by spectral matching. In this context, MCnebula outperformed
the GNPS in [terms of]{.insertion author="2003"
date="2023-04-21T18:12:00Z"} the evaluation of the precision in three
datasets (MCnebula: 69.8%, 67.1%, 67.4%; GNPS: 48.1%, 51.2%, 52.4%)
(Fig. 3a). The recall was estimated using relative false rate as well.
As shown in Fig. 3a, MCnebula (82.2%, 81.6%, [and]{.insertion
author="2003" date="2023-04-21T18:12:00Z"} 81.6%) outperformed
[than]{.deletion author="2003" date="2023-04-21T18:12:00Z"} GNPS (51.2%,
52.7%, [and]{.insertion author="2003" date="2023-04-21T18:12:00Z"}
53.3%). In addition to the three indicators mentioned above, [we also
compared]{.deletion author="2003" date="2023-04-21T18:12:00Z"} MCnebula
and GNPS [were compared]{.insertion author="2003"
date="2023-04-21T18:12:00Z"} at the individual level for the 19 chemical
classes (Fig. 3b). Remarkably, MCnebula was more stable to noise than
GNPS.

**Identified accuracy.** [By]{.insertion author="2003"
date="2023-04-21T18:12:00Z"} [Using]{.deletion author="2003"
date="2023-04-21T18:13:00Z"} [using the]{.insertion author="2003"
date="2023-04-21T18:13:00Z"} MCnebula workflow, [for]{.insertion
author="2003" date="2023-04-21T18:13:00Z"} the origin dataset containing
8[,]{.insertion author="2003" date="2023-04-21T18:13:00Z"}057 compounds
(precursor ions m/z \< 800), all of these compounds were predicted with
chemical molecular formulae, [and of these,]{.deletion author="2003"
date="2023-04-21T18:13:00Z"}[in which]{.insertion author="2003"
date="2023-04-21T18:13:00Z"} 6[,]{.insertion author="2003"
date="2023-04-21T18:13:00Z"}610 compounds were predicted with chemical
structure. [Those]{.deletion author="2003" date="2023-04-21T18:13:00Z"}
[These]{.insertion author="2003" date="2023-04-21T18:13:00Z"} chemical
structure[s]{.insertion author="2003" date="2023-04-21T18:13:00Z"} were
evaluated for accuracy in a classified context. For the 37 chemical
classes (Fig. 3c), the average false rate of identification was
37[%;]{.deletion author="2003" date="2023-04-21T18:13:00Z"}
[%,]{.insertion author="2003" date="2023-04-21T18:13:00Z"}
[the]{.deletion author="2003" date="2023-04-21T18:13:00Z"}
[average]{.deletion author="2003" date="2023-04-21T18:14:00Z"}
[identified]{.deletion author="2003" date="2023-04-21T18:13:00Z"}
[156]{.insertion author="2003" date="2023-04-21T18:13:00Z"} compounds
[number was 156]{.deletion author="2003"
date="2023-04-21T18:13:00Z"}[were identified]{.insertion author="2003"
date="2023-04-21T18:13:00Z"} [in average]{.insertion author="2003"
date="2023-04-21T18:14:00Z"}. Among them, most of the identified false
rate were between 30% to 40%, [however,]{.deletion author="2003"
date="2023-04-21T18:14:00Z"}[but]{.insertion author="2003"
date="2023-04-21T18:14:00Z"} some classes were quite low, such as
'Long-chain fatty acids' or 'Lignans, neolignans and related compounds'.
The reliability of the predicted chemical structure can be assessed in
terms of a score. Tanimoto similarity provides such a score for each
predicted chemical structure [(it]{.deletion author="2003"
date="2023-04-21T18:14:00Z"}[by]{.insertion author="2003"
date="2023-04-21T18:14:00Z"} [provides]{.deletion author="2003"
date="2023-04-21T18:14:00Z"} [providing]{.insertion author="2003"
date="2023-04-21T18:14:00Z"} the matching degree of chemical
fingerprints with structures[)]{.deletion author="2003"
date="2023-04-21T18:14:00Z"}. When Tanimoto similarity sets the cutoff
value to 0.5, the average false rate of identification was
29.4[%;]{.deletion author="2003" date="2023-04-21T18:14:00Z"} [%,
139]{.insertion author="2003" date="2023-04-21T18:14:00Z"}[the average
identified]{.deletion author="2003" date="2023-04-21T18:14:00Z"}
compounds [number was 139]{.deletion author="2003"
date="2023-04-21T18:14:00Z"}[were identified in average]{.insertion
author="2003" date="2023-04-21T18:14:00Z"} (Fig. 3c). [Above we
evaluated t]{.deletion author="2003"
date="2023-04-21T18:15:00Z"}[T]{.insertion author="2003"
date="2023-04-21T18:15:00Z"}he accuracy of the identification of
compounds in each chemical class obtained by MCnebula. [It should be
noted that]{.deletion author="2003"
date="2023-04-21T18:15:00Z"}[Notably,]{.insertion author="2003"
date="2023-04-21T18:15:00Z"} MCnebula itself does not contain any module
for identification, [and]{.insertion author="2003"
date="2023-04-21T18:15:00Z"} it only [utilized]{.deletion author="2003"
date="2023-04-21T18:15:00Z"} [utilizes]{.insertion author="2003"
date="2023-04-21T18:15:00Z"} the top scoring candidate from the SIRIUS
predicted results for annotation. For [more]{.deletion author="2003"
date="2023-04-21T18:15:00Z"} [an extensive]{.insertion author="2003"
date="2023-04-21T18:15:00Z"} evaluation on identification[,]{.insertion
author="2003" date="2023-04-21T18:15:00Z"} [please refer to]{.deletion
author="2003" date="2023-04-21T18:15:00Z"}[more details can be found
in]{.insertion author="2003" date="2023-04-21T18:15:00Z"} the
publication and our previous related work^[22](\l),[50](\l)^.

#### Data analysis

**Serum metabolic analysis.** T[o illustrate t]{.deletion author="2003"
date="2023-04-21T18:15:00Z"}he application of MCnebula in metabolism
[was illustrated]{.insertion author="2003" date="2023-04-21T18:15:00Z"}
[, we]{.deletion author="2003"
date="2023-04-21T18:15:00Z"}[by]{.insertion author="2003"
date="2023-04-21T18:15:00Z"} re-[analyzed]{.deletion author="2003"
date="2023-04-21T18:15:00Z"} [analyzing]{.insertion author="2003"
date="2023-04-21T18:15:00Z"} the serum data from Wozniak et
al.[^42^](\l). The serum samples were collected from patients
in-hospital infected with [Staphylococcus aureus bacteremia (]{.deletion
author="2003" date="2023-04-21T18:15:00Z"}SaB[)]{.deletion author="2003"
date="2023-04-21T18:15:00Z"} or not and healthy volunteers. Overall, the
samples were divided into [1)]{.deletion author="2003"
date="2023-04-21T18:16:00Z"} control groups, [which]{.insertion
author="2003" date="2023-04-21T18:16:00Z"} [involving]{.deletion
author="2003" date="2023-04-21T18:16:00Z"} [include]{.insertion
author="2003" date="2023-04-21T18:16:00Z"} NN (non-hospital,
non-infected) and HN (hospital, non-infected)[; 2)]{.deletion
author="2003" date="2023-04-21T18:16:00Z"}[, and]{.insertion
author="2003" date="2023-04-21T18:16:00Z"} infection groups,
[involving]{.deletion author="2003" date="2023-04-21T18:16:00Z"} [which
include]{.insertion author="2003" date="2023-04-21T18:16:00Z"} HS
(hospital, survival), HM (hospital, mortality).

A total of 7[,]{.insertion author="2003" date="2023-04-21T18:16:00Z"}680
'features' were detected while running with LC-MS pre[-]{.insertion
author="2003" date="2023-04-21T18:16:00Z"}processing on the serum
dataset. After predicting the compounds by MS/MS spectra (with SIRIUS
software), subsequent analysis was performed using MCnebula.
[Of]{.deletion author="2003" date="2023-04-21T18:16:00Z"}
[Among]{.insertion author="2003" date="2023-04-21T18:16:00Z"} these,
6501 'features' were annotated with predicted molecular
formula[,]{.insertion author="2003" date="2023-04-21T18:16:00Z"} and
[further,]{.deletion author="2003" date="2023-04-21T18:16:00Z"}
3[,]{.insertion author="2003" date="2023-04-21T18:16:00Z"}449 'features'
were annotated with [the]{.insertion author="2003"
date="2023-04-21T18:16:00Z"} predicted chemical structure.
[By]{.insertion author="2003" date="2023-04-21T18:16:00Z"}
[Using]{.deletion author="2003" date="2023-04-21T18:16:00Z"} [using
the]{.insertion author="2003" date="2023-04-21T18:16:00Z"} ABC selection
algorithm, [we filtered out]{.deletion author="2003"
date="2023-04-21T18:16:00Z"} more than [one thousand]{.deletion
author="2003" date="2023-04-21T18:16:00Z"}[1,000]{.insertion
author="2003" date="2023-04-21T18:17:00Z"} chemical classes [were
filtered out]{.insertion author="2003" date="2023-04-21T18:17:00Z"} by
appl[ied of]{.deletion author="2003" date="2023-04-21T18:17:00Z"}[ying
the]{.insertion author="2003" date="2023-04-21T18:17:00Z"} 'inner
filter' module (see method section of ABC selection
algorithm[);]{.deletion author="2003" date="2023-04-21T18:17:00Z"}
[).]{.insertion author="2003" date="2023-04-21T18:17:00Z"} [further
filtered out]{.deletion author="2003" date="2023-04-21T18:17:00Z"} [A
total of]{.insertion author="2003" date="2023-04-21T18:17:00Z"} 508
chemical classes [were further filtered out]{.insertion author="2003"
date="2023-04-21T18:17:00Z"} while performing 'cross
filter'[;]{.deletion author="2003" date="2023-04-21T18:17:00Z"}
[.]{.insertion author="2003" date="2023-04-21T18:17:00Z"}
[for]{.deletion author="2003" date="2023-04-21T18:17:00Z"}
[For]{.insertion author="2003" date="2023-04-21T18:17:00Z"} the
[41]{.insertion author="2003" date="2023-04-21T18:17:00Z"} remaining
[41]{.deletion author="2003" date="2023-04-21T18:17:00Z"} chemical
classes, 19 chemical classes were manually filtered out,
[while]{.deletion author="2003" date="2023-04-21T18:17:00Z"} leaving
[the final]{.deletion author="2003" date="2023-04-21T18:17:00Z"} 22
chemical classes to make up the Nebula-Index, which [were]{.insertion
author="2003" date="2023-04-21T18:17:00Z"} further visualized as
Child-Nebulae. [It is worth mentioning that]{.deletion author="2003"
date="2023-04-21T18:17:00Z"}[Notably,]{.insertion author="2003"
date="2023-04-21T18:17:00Z"} the [527]{.insertion author="2003"
date="2023-04-21T18:17:00Z"} filtered out [527]{.deletion author="2003"
date="2023-04-21T18:17:00Z"} (508 + 19) chemical classes could be
re-added to the analysis. Herein, with the basic workflow of MCnebula,
Parent-Nebula and Child-Nebulae were obtained (Fig. S1, Fig. S2). [By
interrogating]{.deletion author="2003" date="2023-04-21T18:18:00Z"}[The
analysis of]{.insertion author="2003" date="2023-04-21T18:18:00Z"}
Child-Nebulae[, we had a basic]{.deletion author="2003"
date="2023-04-21T18:18:00Z"} [provided]{.insertion author="2003"
date="2023-04-21T18:18:00Z"} insight into the chemical classes contained
in the serum dataset. [To mine m]{.deletion author="2003"
date="2023-04-21T18:18:00Z"}[M]{.insertion author="2003"
date="2023-04-21T18:18:00Z"}ore information [was obtained]{.insertion
author="2003" date="2023-04-21T18:18:00Z"} from Child-Nebulae[:
we]{.deletion author="2003" date="2023-04-21T18:18:00Z"} [by]{.insertion
author="2003" date="2023-04-21T18:18:00Z"} [performed]{.deletion
author="2003" date="2023-04-21T18:19:00Z"} [performing]{.insertion
author="2003" date="2023-04-21T18:19:00Z"} a binary comparison of HS and
HM groups, ranking 'features' according to Q-value (adjusted
P-value[);]{.deletion author="2003" date="2023-04-21T18:20:00Z"}
[).]{.insertion author="2003" date="2023-04-21T18:20:00Z"}
[the]{.deletion author="2003" date="2023-04-21T18:20:00Z"}
[The]{.insertion author="2003" date="2023-04-21T18:20:00Z"} top 50
'features' were set as 'tracers' to mark them in Child-Nebulae (Fig. 4).
By combining the features selection algorithm about [the]{.insertion
author="2003" date="2023-04-21T18:20:00Z"} *Q*[-]{.deletion
author="2003" date="2023-04-21T18:20:00Z"} []{.insertion author="2003"
date="2023-04-21T18:20:00Z"}value, the chemical classes exhibited in
Child-Nebulae were reduced. The log2(Fold Change) (log2(FC))
quantification for the HM versus HS groups was visualized in
Child-Nebulae (Fig. S3). [In Fig. S3,]{.deletion author="2003"
date="2023-04-21T18:20:00Z"}[Th figure shows that]{.insertion
author="2003" date="2023-04-21T18:20:00Z"} the overall level of 'Bile
acids, alcohols and derivatives' (BAs) class and 'Acyl carnitines' (ACs)
(Fig. 5a and b) class increased remarkably, [while]{.deletion
author="2003" date="2023-04-21T18:20:00Z"} [whereas]{.insertion
author="2003" date="2023-04-21T18:20:00Z"} the overall level of
'Lysophosphatidylcholines' (LPCs) class decreased remarkably.
[Indeed,]{.deletion author="2003" date="2023-04-21T18:20:00Z"} BAs,
ACs[,]{.insertion author="2003" date="2023-04-21T18:20:00Z"} and LPCs
[were reported]{.deletion author="2003"
date="2023-04-21T18:20:00Z"}[are]{.insertion author="2003"
date="2023-04-21T18:20:00Z"} associated with liver dysfunction,
imbalance of intestinal microphylactic homeostasis, and mortality
risk^[42](\l),[51](\l),[52](\l)^.

[By]{.deletion author="2003" date="2023-04-21T18:20:00Z"} [Through
the]{.insertion author="2003" date="2023-04-21T18:20:00Z"} deep
annotation of Child-Nebula, all three classes of compounds have similar
structural parent nuclei, and their levels in the NN, HN, HS, and HM
groups are similar (Fig. 5c, Fig. S4). Subsequently, [we
performed]{.deletion author="2003" date="2023-04-21T18:21:00Z"} cluster
heat map analysis and pathway enrichment analysis [were
performed]{.insertion author="2003" date="2023-04-21T18:21:00Z"} on the
compounds of these three classes. As shown in the clustering heat map
(Fig. 6), the control group of ACs and BAs were remarkably separated
from the infection group, [which implied]{.deletion author="2003"
date="2023-04-21T18:21:00Z"}[indicating]{.insertion author="2003"
date="2023-04-21T18:21:00Z"} the infection relevance of ACs and BAs to
SaB. [In]{.deletion author="2003" date="2023-04-21T18:21:00Z"}
[By]{.insertion author="2003" date="2023-04-21T18:21:00Z"} contrast,
LPCs did not show remarkable SaB infection relevance or mortality
relevance[, probably owing to]{.deletion author="2003"
date="2023-04-21T18:21:00Z"} [possibly because of]{.insertion
author="2003" date="2023-04-21T18:21:00Z"} the general consistency of
this class of compounds for SaB disease. [We performed p]{.deletion
author="2003" date="2023-04-21T18:21:00Z"}[P]{.insertion author="2003"
date="2023-04-21T18:21:00Z"}athway enrichment analysis [was carried
out]{.insertion author="2003" date="2023-04-21T18:21:00Z"} for these
three classes of significant compounds (HS versus HM group, Q-value \<
0.05). The results of BAs showed that four compounds exhibited metabolic
pathways associated with 'Bile secretion', 'Cholesterol metabolism', and
'Primary bile acid biosynthesis' [etc]{.deletion author="2003"
date="2023-04-21T18:21:00Z"} (Fig. S5b). Among them, $beta$GCS
[was]{.deletion author="2003" date="2023-04-21T18:21:00Z"}
[is]{.insertion author="2003" date="2023-04-21T18:21:00Z"} a class of
compounds with the same parent nucleus. The results for LPCs
suggest[ed]{.deletion author="2003" date="2023-04-21T18:21:00Z"} that
compounds with similar parent nucleus structure of LPCs implied
association with a series of downstream pathways (Fig. S5c). The
significant compounds of ACs were not enriched in the pathway.
[But]{.deletion author="2003"
date="2023-04-21T18:21:00Z"}[However]{.insertion author="2003"
date="2023-04-21T18:21:00Z"}, [A]{.deletion author="2003"
date="2023-04-21T18:21:00Z"} [a]{.insertion author="2003"
date="2023-04-21T18:21:00Z"} fundamental role of ACs in tuning the
switch between the glucose and fatty acid metabolism was
reviewed[^53^](\l). Their function implemented via bi-directional
transport of acyl moieties [Between]{.deletion author="2003"
date="2023-04-21T18:21:00Z"} [between]{.insertion author="2003"
date="2023-04-21T18:21:00Z"} cytosol and mitochondria (Fig. S5a).

In [the]{.insertion author="2003" date="2023-04-21T18:21:00Z"} research
of Wozniak et al[.]{.insertion author="2003"
date="2023-04-21T18:22:00Z"}[^42^](\l), five ACs compounds were
identified. In addition, four top metabolites [(]{.deletion
author="2003" date="2023-04-21T18:22:00Z"}[such as]{.insertion
author="2003" date="2023-04-21T18:22:00Z"}
2-[Hexadecanoylthio]{.deletion author="2003"
date="2023-04-21T18:22:00Z"}[hexadecanoylthio]{.insertion author="2003"
date="2023-04-21T18:22:00Z"}-1-[Ethylphosphorylcholine]{.deletion
author="2003" date="2023-04-21T18:22:00Z"}
[ethylphosphorylcholine]{.insertion author="2003"
date="2023-04-21T18:22:00Z"} (HEPC[);]{.deletion author="2003"
date="2023-04-21T18:22:00Z"} [),]{.insertion author="2003"
date="2023-04-21T18:22:00Z"} sphingosine-1-phosphate (S1P[);]{.deletion
author="2003" date="2023-04-21T18:22:00Z"} [),]{.insertion author="2003"
date="2023-04-21T18:22:00Z"} decanoyl-carnitine[;]{.deletion
author="2003" date="2023-04-21T18:22:00Z"} [, and]{.insertion
author="2003" date="2023-04-21T18:22:00Z"} L-Thyroxine (T4[))]{.deletion
author="2003" date="2023-04-21T18:22:00Z"} [)]{.insertion author="2003"
date="2023-04-21T18:22:00Z"} were also identified. In our reanalysis,
all identifications were [in line]{.deletion author="2003"
date="2023-04-21T18:22:00Z"}[consistent,]{.insertion author="2003"
date="2023-04-21T18:22:00Z"} except for HEPC (see 'Data and code
availability' section for the report of serum dataset analysis). [In
our]{.deletion author="2003" date="2023-04-21T18:22:00Z"}[Based on
the]{.insertion author="2003" date="2023-04-21T18:22:00Z"} re-analysis,
'HEPC' was identified as 1-pentadecanoyl-sn-glycero-3-phosphocholine
(LPC15:0) or its stereoisomers. Indeed, HEPC and LPC15:0 are quite
similar in [terms of]{.insertion author="2003"
date="2023-04-21T18:22:00Z"} structure, but [they have]{.insertion
author="2003" date="2023-04-21T18:22:00Z"} distinct in
element[al]{.insertion author="2003" date="2023-04-21T18:22:00Z"}
[constitution]{.deletion author="2003" date="2023-04-21T18:22:00Z"}
[composition]{.insertion author="2003" date="2023-04-21T18:22:00Z"}
(corresponding to C~23~H~48~NO~5~PS and C~23~H~48~NO~7~P respectively).
[They were clearly distinct in terms of chemical
classification.]{.deletion author="2003" date="2023-04-21T18:23:00Z"}
HEPC belongs to 'Cholines' (level 5) from 'Organic nitrogen compounds'
(superclass) family, [whereas]{.deletion author="2003"
date="2023-04-21T18:24:00Z"} [while]{.insertion author="2003"
date="2023-04-21T18:24:00Z"} LPC15:0 belongs to
'Lysophosphatidylcholines' (level 5) from 'Lipids and lipid-like
molecules' family. As a part of [the]{.insertion author="2003"
date="2023-04-21T18:24:00Z"} MCnebula workflow, sulfur
[element]{.deletion author="2003" date="2023-04-21T18:24:00Z"} is
detectable for SIRIUS in isotopes pattern with high mass
accuracy[^37^](\l). However, for the MS/MS spectra of 'HEPC', [there
was]{.deletion author="2003" date="2023-04-21T18:24:00Z"} no candidate
formula [that]{.deletion author="2003" date="2023-04-21T18:24:00Z"}
[containing]{.deletion author="2003" date="2023-04-21T18:24:00Z"}
[contains]{.insertion author="2003" date="2023-04-21T18:24:00Z"} sulfur
element. Overall, [we identified]{.deletion author="2003"
date="2023-04-21T18:24:00Z"} more compounds [were identified]{.insertion
author="2003" date="2023-04-21T18:24:00Z"} with the MCnebula
workflow[,]{.insertion author="2003" date="2023-04-21T18:24:00Z"} and
many of the results were in line with the analysis of Wozniak et
al[^42^](\l). All [the]{.insertion author="2003"
date="2023-04-21T18:24:00Z"} identified compounds were collated in
Tab[.]{.deletion author="2003" date="2023-04-21T18:24:00Z"}
[le]{.insertion author="2003" date="2023-04-21T18:24:00Z"} S2 (filtered
with Tanimoto similarity \> 0.5 and de-duplicated with the first hash
block of InChIKey [(]{.deletion author="2003"
date="2023-04-21T18:24:00Z"}[\[]{.insertion author="2003"
date="2023-04-21T18:24:00Z"}molecular skeleton[)).]{.deletion
author="2003" date="2023-04-21T18:24:00Z"} [\]).]{.insertion
author="2003" date="2023-04-21T18:24:00Z"} The compounds (top 50 of
[ensemble feature selection \[]{.insertion author="2003"
date="2023-04-21T18:35:00Z"}EFS[\]]{.insertion author="2003"
date="2023-04-21T18:35:00Z"} and [Mann-Whitney U \[]{.insertion
author="2003" date="2023-04-21T18:36:00Z"}MWU[\]]{.insertion
author="2003" date="2023-04-21T18:36:00Z"}) that were not successfully
identified via spectral library matching by Wozniak et al. but were
identified by our MCnebula workflow for molecular formula or chemical
structure were additionally collated (Tab. S3).

**Herbal medicine analysis.** [We used]{.deletion author="2003"
date="2023-04-21T18:24:00Z"} MCnebula [was used]{.insertion
author="2003" date="2023-04-21T18:24:00Z"} to interpretate structure
diversity and chemical transformation during [the]{.insertion
author="2003" date="2023-04-21T18:24:00Z"} traditional processing of a
representative herbal medicine, *Eucommiae Cortex,* the peel of
*Eucommia ulmoides Oliv. (E. ulmoides)*[^54^](\l). After
[being]{.deletion author="2003" date="2023-04-21T18:24:00Z"}
[processed]{.deletion author="2003" date="2023-04-21T18:25:00Z"}
[processing]{.insertion author="2003" date="2023-04-21T18:25:00Z"} with
saline water, it [is]{.deletion author="2003"
date="2023-04-21T18:25:00Z"} [has long been used]{.insertion
author="2003" date="2023-04-21T18:25:00Z"} [commonly applied
to]{.deletion author="2003" date="2023-04-21T18:25:00Z"} [for
the]{.insertion author="2003" date="2023-04-21T18:25:00Z"} treat[ment
of]{.insertion author="2003" date="2023-04-21T18:25:00Z"} renal diseases
[for a long time]{.deletion author="2003" date="2023-04-21T18:25:00Z"}
in China[,]{.insertion author="2003" date="2023-04-21T18:25:00Z"} but
the chemical basis still remained to be explored. With the help of ABC
selection algorithm in MCnebula, [a total of]{.deletion author="2003"
date="2023-04-21T18:25:00Z"} 29 chemical classes representing the
richness of composition of *E. ulmoides* were obtained. Two groups of
quantification data were performed with binary comparison. The top 20
features (Top20) were selected using function 'select_features'
(\|Log2(Fold change)\| \> 0.3, Q-value \< 0.05, Tanimoto similarity \>
0.5) and were traced in Child-Nebulae (Fig. S6). [We used]{.deletion
author="2003" date="2023-04-21T18:25:00Z"} MCnebula [was
used]{.insertion author="2003" date="2023-04-21T18:25:00Z"} to draw the
mirrored match of MS/MS spectra and extracted ions chromatography (EIC)
plots of the Top20 (Fig. S7 and S8). According to Fig. S8, [we
speculated that]{.deletion author="2003" date="2023-04-21T18:25:00Z"}
the 'features' of ID 1642, 1785, and 2321 were newly generated
compounds[,]{.insertion author="2003" date="2023-04-21T18:26:00Z"}
because the peak area levels before the processing were almost zero
compared [to]{.deletion author="2003" date="2023-04-21T18:26:00Z"}
[with]{.insertion author="2003" date="2023-04-21T18:26:00Z"} those after
processing. Their chemical structures are [showed]{.deletion
author="2003" date="2023-04-21T18:26:00Z"} [shown]{.insertion
author="2003" date="2023-04-21T18:26:00Z"} in Fig. S7. Among them, the
'feature' of ID 1642 has a higher probability of correct identification
(Tanimoto similarity: 0.69). Based on Fig. S6, [we knew that]{.deletion
author="2003" date="2023-04-21T18:26:00Z"}[the]{.insertion author="2003"
date="2023-04-21T18:26:00Z"} 'feature' of ID 1642 belongs to 'Iridoids
and derivatives' (IAD), [while]{.insertion author="2003"
date="2023-04-21T18:26:00Z"} the others [were]{.deletion author="2003"
date="2023-04-21T18:26:00Z"} [belong to]{.insertion author="2003"
date="2023-04-21T18:26:00Z"} 'Dialkyl ethers' (DE; ID 1785) and
'Phenylpropanoids and polyketides' (PAP; ID 2321). [We annotated in
depth of t]{.deletion author="2003"
date="2023-04-21T18:26:00Z"}[T]{.insertion author="2003"
date="2023-04-21T18:26:00Z"}he Child-Nebulae of IAD, DE[,]{.insertion
author="2003" date="2023-04-21T18:26:00Z"} and PAP
[respectively]{.deletion author="2003" date="2023-04-21T18:26:00Z"}[were
annotated]{.insertion author="2003" date="2023-04-21T18:26:00Z"}. The
locations of the 'features' of ID 1642, 1785[,]{.insertion author="2003"
date="2023-04-21T18:26:00Z"} and 2321 in the Child-Nebulae were
interrogated (Fig. S9a, b, and c). Only the 'features' of ID 1642 had
neighboring 'features'[,]{.insertion author="2003"
date="2023-04-21T18:26:00Z"} and their identified chemical structures
(ID 2110 and ID 854) had similar parent nuclei. The 'features' of ID
2110 and ID 854 were identified with chemical structure (Tanimoto
similarity: 0.69 and 0.7 [respectively) (]{.deletion author="2003"
date="2023-04-21T18:27:00Z"}[;]{.insertion author="2003"
date="2023-04-21T18:27:00Z"} Fig. S9d, e, and f[,
respectively]{.insertion author="2003"
date="2023-04-21T18:27:00Z"}[);]{.deletion author="2003"
date="2023-04-21T18:27:00Z"} [).]{.insertion author="2003"
date="2023-04-21T18:27:00Z"} [their]{.deletion author="2003"
date="2023-04-21T18:27:00Z"} [Their]{.insertion author="2003"
date="2023-04-21T18:27:00Z"} levels of peak area [were]{.deletion
author="2003" date="2023-04-21T18:27:00Z"} decreased and
[then]{.insertion author="2003" date="2023-04-21T18:27:00Z"} increased
after the processing. Based on the chemical structures shown in
Fig[s]{.insertion author="2003" date="2023-04-21T18:27:00Z"}. S9d and e,
[we speculated that]{.deletion author="2003"
date="2023-04-21T18:27:00Z"} the compound of ID 2110 was partially
converted to the compound of ID 854 after the processing, which may
involve chemical changes such as dehydration and rearrangement. Such
speculation explained the alteration of the levels of peak area. In
addition, the increase[ment]{.deletion author="2003"
date="2023-04-21T18:27:00Z"} in the level of the compound ID 1642 (its
spectra were shown in Fig. S7 and S8) may also be associated with the
reduction of [the]{.deletion author="2003" date="2023-04-21T18:27:00Z"}
compound ID 2110.

The methods of MCnebula [that]{.insertion author="2003"
date="2023-04-21T18:27:00Z"} we have demonstrated for discovering
significant compounds and discovering chemical changes can be applied to
explore more compounds in Tab. S4[,]{.deletion author="2003"
date="2023-04-21T18:27:00Z"} [.]{.insertion author="2003"
date="2023-04-21T18:27:00Z"} [but we would not expand on this]{.deletion
author="2003" date="2023-04-21T18:27:00Z"}[However, a
detailed]{.insertion author="2003" date="2023-04-21T18:27:00Z"}
description [was not provided]{.insertion author="2003"
date="2023-04-21T18:28:00Z"} here.

### Discussion

The analysis of LC-MS/MS data is challenging because of its large
dataset and the potential information of the unknown compounds [as well
as]{.deletion author="2003" date="2023-04-21T18:28:00Z"}[and]{.insertion
author="2003" date="2023-04-21T18:28:00Z"} the limited of reference
spectral library. Researchers often [need to take]{.deletion
author="2003" date="2023-04-21T18:28:00Z"}[require]{.insertion
author="2003" date="2023-04-21T18:28:00Z"} much time [on]{.deletion
author="2003" date="2023-04-21T18:28:00Z"} [to]{.insertion author="2003"
date="2023-04-21T18:28:00Z"} map[ping]{.deletion author="2003"
date="2023-04-21T18:28:00Z"} the landscape of all the interesting
compounds from this "black box"[,]{.deletion author="2003"
date="2023-04-21T18:28:00Z"} and then move to next step in research
MCnebula could assist researchers in focusing on potential markers or
interesting compounds quickly by combining full-spectrum identification
with machine prediction, visualization of sub-nebulae in a
multi-dimensional view, and statistical analysis to track top 'features'
and find analogues. The ABC selection algorithm can summarize a
representative chemical class in a dataset and obtain the features to
that class[, so]{.deletion author="2003" date="2023-04-21T18:28:00Z"}
[to make]{.insertion author="2003" date="2023-04-21T18:28:00Z"} the
overall direction of the study [is]{.deletion author="2003"
date="2023-04-21T18:28:00Z"} unbiased. [Also]{.deletion author="2003"
date="2023-04-21T18:28:00Z"}[Moreover]{.insertion author="2003"
date="2023-04-21T18:28:00Z"}, it is an effective guarantee for
statistical analysis to produce top features for tracing analysis in
next step. The results of statistical analysis based on feature level
may cause bias [since]{.deletion author="2003"
date="2023-04-21T18:29:00Z"} [because of]{.insertion author="2003"
date="2023-04-21T18:29:00Z"} the loss of information, [and]{.insertion
author="2003" date="2023-04-21T18:29:00Z"} filtering on the basis of
chemical classes level can prevent the bias [in]{.deletion author="2003"
date="2023-04-21T18:29:00Z"} [to]{.insertion author="2003"
date="2023-04-21T18:29:00Z"} some [degree]{.deletion author="2003"
date="2023-04-21T18:29:00Z"}[extent]{.insertion author="2003"
date="2023-04-21T18:29:00Z"}. The Child-Nebula, which [was]{.insertion
author="2003" date="2023-04-21T18:29:00Z"} mapped on the basis of the
chemical classes obtained by the ABC selection algorithm, achieved the
[goal of visualizing]{.deletion author="2003"
date="2023-04-21T18:29:00Z"} [visualization of]{.insertion author="2003"
date="2023-04-21T18:29:00Z"} the huge untargeted dataset as a single
graph. [Above all, t]{.deletion author="2003"
date="2023-04-21T18:29:00Z"}[T]{.insertion author="2003"
date="2023-04-21T18:29:00Z"}he parameters of the ABC selection algorithm
were subjectively adjustable[,]{.insertion author="2003"
date="2023-04-21T18:29:00Z"} and they should be determined according to
the richness of the chemical class of the studied object. [The meaning
cannot be derived because the details are insufficient. Review and
revise this part as necessary to ensure complete and correct
information.]{.comment-start id="2" author="2003"
date="2023-04-21T18:32:00Z"}In general, our default parameters used to
acquire the chemical classes that are abundant in variety according to
the datasets and filtered out those that were too large or too small
classes in conceptual scope.[]{.comment-end id="2"}

For identification, spectral library matching is [still the]{.deletion
author="2003" date="2023-04-21T18:32:00Z"} main[ly]{.insertion
author="2003" date="2023-04-21T18:32:00Z"} [method]{.deletion
author="2003" date="2023-04-21T18:32:00Z"} [used]{.insertion
author="2003" date="2023-04-21T18:32:00Z"} for LC-MS/MS data because of
its high accuracy. The general [classifying]{.deletion author="2003"
date="2023-04-21T18:32:00Z"} [classification]{.insertion author="2003"
date="2023-04-21T18:32:00Z"} of compounds is also based on it,
[i.e.]{.deletion author="2003" date="2023-04-21T18:32:00Z"}[that
is]{.insertion author="2003" date="2023-04-21T18:32:00Z"}, the chemical
structure is first[ly]{.deletion author="2003"
date="2023-04-21T18:32:00Z"} identified by spectral
matching[,]{.deletion author="2003" date="2023-04-21T18:32:00Z"}
[.]{.insertion author="2003" date="2023-04-21T18:32:00Z"} [and
t]{.deletion author="2003" date="2023-04-21T18:32:00Z"}[T]{.insertion
author="2003" date="2023-04-21T18:32:00Z"}hen[,]{.insertion
author="2003" date="2023-04-21T18:32:00Z"} its chemical class is
evaluated based on the chemical structure. Considering the limit of
reference spectral library, [The classifying]{.deletion author="2003"
date="2023-04-21T18:32:00Z"} [classification]{.insertion author="2003"
date="2023-04-21T18:32:00Z"} technique[s]{.insertion author="2003"
date="2023-04-21T18:32:00Z"} [like]{.deletion author="2003"
date="2023-04-21T18:33:00Z"} [such as]{.insertion author="2003"
date="2023-04-21T18:33:00Z"} CANOPUS[^34^](\l)[, which was]{.insertion
author="2003" date="2023-04-21T18:33:00Z"} incorporated in
MCnebula[,]{.insertion author="2003" date="2023-04-21T18:33:00Z"}
bypassed the first step of identifying the chemical structure but
predicted the possible chemical class even if the exact chemical
structure was not known. MCnebula combined this cutting-edge technology
with ABC selection algorithm and achieve[d the]{.insertion author="2003"
date="2023-04-21T18:33:00Z"} visualization of Child-Nebulae, [which make
it possible to]{.deletion author="2003"
date="2023-04-21T18:33:00Z"}[thus allowing the]{.insertion author="2003"
date="2023-04-21T18:33:00Z"} [explore]{.deletion author="2003"
date="2023-04-21T18:33:00Z"} [exploration of]{.insertion author="2003"
date="2023-04-21T18:33:00Z"} unknown compounds [that]{.deletion
author="2003" date="2023-04-21T18:33:00Z"} beyond spectral library. [We
compared t]{.deletion author="2003"
date="2023-04-21T18:33:00Z"}[T]{.insertion author="2003"
date="2023-04-21T18:33:00Z"}he [classifying]{.deletion author="2003"
date="2023-04-21T18:33:00Z"} [classification]{.insertion author="2003"
date="2023-04-21T18:33:00Z"} method of MCnebula [was
compared]{.insertion author="2003" date="2023-04-21T18:33:00Z"} with
GNPS, [The meaning cannot be derived because the details are
insufficient. Review and revise this part as necessary to ensure
complete and correct information.]{.comment-start id="3" author="2003"
date="2023-04-21T18:34:00Z"}of which method relies on chemical structure
identification. []{.comment-end id="3"}When different levels of noise
were added, the number of classified compounds of GNPS decreased
remarkably compared with the stable performance of MCnebula. For the
actual acquired MS/MS spectra, they were not as good as the reference
spectra and contained some noise. [Indeed ,t]{.deletion author="2003"
date="2023-04-21T18:34:00Z"}[T]{.insertion author="2003"
date="2023-04-21T18:34:00Z"}he reality of MS/MS spectra is much closer
to the condition with noise. [It means]{.deletion author="2003"
date="2023-04-21T18:34:00Z"}[Therefore,]{.insertion author="2003"
date="2023-04-21T18:34:00Z"} MCnebula can resist noise interference
[in]{.deletion author="2003" date="2023-04-21T18:34:00Z"}
[to]{.insertion author="2003" date="2023-04-21T18:34:00Z"} some extent.
A[t the end of]{.deletion author="2003"
date="2023-04-21T18:34:00Z"}[fter]{.insertion author="2003"
date="2023-04-21T18:34:00Z"} the evaluation, [we examined]{.deletion
author="2003" date="2023-04-21T18:34:00Z"} the accuracy of the
identification [was examined]{.insertion author="2003"
date="2023-04-21T18:34:00Z"} by MCnebula. [It]{.deletion author="2003"
date="2023-04-21T18:34:00Z"} [The results]{.insertion author="2003"
date="2023-04-21T18:34:00Z"} confirmed that the accuracy of
identification fluctuated around 70%, which was the same as
SIRIUS[^22^](\l).

Serum metabolomics data was applied to illustrate that MCnebula can be
used for pathway analysis and biomarker discovery. Most of
[our]{.deletion author="2003" date="2023-04-21T18:34:00Z"}
[the]{.insertion author="2003" date="2023-04-21T18:34:00Z"} results were
consistent with [that]{.deletion author="2003"
date="2023-04-21T18:34:00Z"} [those]{.insertion author="2003"
date="2023-04-21T18:34:00Z"} of reference[^42^](\l). [The exciting thing
was that that we identified]{.deletion author="2003"
date="2023-04-21T18:35:00Z"}[Notably,]{.insertion author="2003"
date="2023-04-21T18:35:00Z"} more metabolites [that]{.deletion
author="2003" date="2023-04-21T18:35:00Z"} beyond the scope of spectral
library matching [were identified]{.insertion author="2003"
date="2023-04-21T18:35:00Z"}. Three of the four top metabolites
identified by Wozniak et al. were the same as our re-identification, but
only one metabolite was controversial. Wozniak et al. mentioned
[that]{.insertion author="2003" date="2023-04-21T18:35:00Z"}
AC[s]{.deletion author="2003" date="2023-04-21T18:35:00Z"} compounds had
correlation with SaB disease[,]{.insertion author="2003"
date="2023-04-21T18:35:00Z"} and AC[s]{.deletion author="2003"
date="2023-04-21T18:35:00Z"} compounds were [also]{.deletion
author="2003" date="2023-04-21T18:35:00Z"} re-identified in our study.
Wozniak et al. used a joint approach of [Ensemble Feature Selection
(]{.deletion author="2003" date="2023-04-21T18:35:00Z"}EFS[)]{.deletion
author="2003" date="2023-04-21T18:35:00Z"} and [Mann-Whitney U
(]{.deletion author="2003" date="2023-04-21T18:35:00Z"}MWU[)]{.deletion
author="2003" date="2023-04-21T18:36:00Z"} tests to screen top
metabolites[^42^](\l). When [we compared the]{.deletion author="2003"
date="2023-04-21T18:36:00Z"} 50 top 'features' [were]{.insertion
author="2003" date="2023-04-21T18:36:00Z"} obtained by the 'binary
comparison' method integrated in MCnebula with the top 50 metabolites
(top 50 of EFS and 50 of MWU) obtained by the joint method of W et al.,
[a total of]{.deletion author="2003" date="2023-04-21T18:36:00Z"} 37
overlapped metabolites were screened out, including the key metabolite
of L-Thyroxine in the reference study. Top 'features' were usually
different according to the feature selection algorithm. The reliability
of the 'binary comparison' method was verified again by our ranked
results [comparing]{.deletion author="2003" date="2023-04-21T18:36:00Z"}
[compared]{.insertion author="2003" date="2023-04-21T18:36:00Z"} with
those of Wozniak et al. In addition to the consistent parts,
[,]{.deletion author="2003" date="2023-04-21T18:36:00Z"} more
interesting results about other chemical classes associated with SaB
disease were revealed by MCnebula. [We discovered a]{.deletion
author="2003" date="2023-04-21T18:37:00Z"}[A]{.insertion author="2003"
date="2023-04-21T18:37:00Z"}dditional classes[, i.e.]{.deletion
author="2003" date="2023-04-21T18:37:00Z"} [such as]{.insertion
author="2003" date="2023-04-21T18:37:00Z"} 'Lysophosphatidylcholines'
(LPCs) and 'Bile acids, alcohols and derivatives' (BAs)[,
that]{.deletion author="2003" date="2023-04-21T18:37:00Z"} were not
concerned in previous study. [Acutally,]{.deletion author="2003"
date="2023-04-21T18:37:00Z"} LPCs have been extensively investigated in
the context of inflammation and atherosclerosis
development^[52](\l),[55](\l),[56](\l)^. In a recent review[^55^](\l),
the complex roles of LPCs in vascular inflammation were well described,
involving the context-dependent pro- or anti-inflammatory action, [as
well as the]{.insertion author="2003" date="2023-04-21T18:37:00Z"}
[impact]{.deletion author="2003" date="2023-04-21T18:37:00Z"}
[effect]{.insertion author="2003" date="2023-04-21T18:37:00Z"} in innate
immune cells and adaptive immune system[, etc]{.deletion author="2003"
date="2023-04-21T18:37:00Z"}. [The]{.insertion author="2003"
date="2023-04-21T18:37:00Z"} [Decreasing]{.deletion author="2003"
date="2023-04-21T18:37:00Z"} [decrease]{.insertion author="2003"
date="2023-04-21T18:37:00Z"} [level of]{.deletion author="2003"
date="2023-04-21T18:37:00Z"}[in]{.insertion author="2003"
date="2023-04-21T18:37:00Z"} LPCs was associated with wild range of
diseases of increasing mortality risk[^52^](\l). The investigation of
[spesis]{.deletion author="2003" date="2023-04-21T18:38:00Z"}
[sepsis]{.insertion author="2003" date="2023-04-21T18:38:00Z"} indicated
LPC[s]{.deletion author="2003" date="2023-04-21T18:38:00Z"}
concentrations in blood were [established]{.deletion author="2003"
date="2023-04-21T18:38:00Z"} [correlation]{.deletion author="2003"
date="2023-04-21T18:38:00Z"} [correlated]{.insertion author="2003"
date="2023-04-21T18:38:00Z"} with severe sepsis or septic
shock[^56^](\l). LPCs was [reported]{.deletion author="2003"
date="2023-04-21T18:38:00Z"} inversely correlated with mortality in
[sepsis]{.deletion author="2003" date="2023-04-21T18:38:00Z"} patients
[with sepsis]{.insertion author="2003"
date="2023-04-21T18:38:00Z"}[^57^](\l). BAs' disorder implied a liver
dysfunction and imbalance of intestinal microphylactic
homeostasis[^58^](\l). The chemical multiversity of BAs, which were
discovered in the BAs' child-nebula, were determined by the intestinal
microbiome and allowed [for a]{.deletion author="2003"
date="2023-04-21T18:51:00Z"}[the]{.insertion author="2003"
date="2023-04-21T18:51:00Z"} complex regulation of adaptive responses in
host. In [our]{.deletion author="2003" date="2023-04-21T18:51:00Z"} [the
present]{.insertion author="2003" date="2023-04-21T18:51:00Z"} study,
the level of BAs showed higher correlation with SaB infection than ACs.
The decreased level of LPCs suggested a mortality risk of SaB infection.
From LPCs to BAs, [steroids]{.deletion author="2003"
date="2023-04-21T18:51:00Z"} [steroid-]{.insertion author="2003"
date="2023-04-21T18:51:00Z"}related classes, 'Lineolic acids and
derivatives', and other fatty [acids]{.deletion author="2003"
date="2023-04-21T18:51:00Z"} [acid-]{.insertion author="2003"
date="2023-04-21T18:51:00Z"}related classes[,]{.deletion author="2003"
date="2023-04-21T18:51:00Z"} showed that liver [played]{.deletion
author="2003" date="2023-04-21T18:51:00Z"} [plays]{.insertion
author="2003" date="2023-04-21T18:51:00Z"} a central role in SaB
infection and mortality. Liver X receptors (LXRs) play[ed]{.deletion
author="2003" date="2023-04-21T18:51:00Z"} pivotal roles in the
transcriptional control of lipid metabolism[^59^](\l). [The simple
present tense is used for conditions that were true, are still true, and
will continue to be true.]{.comment-start id="4" author="2003"
date="2023-04-21T18:52:00Z"}LXRs modulate[d]{.deletion author="2003"
date="2023-04-21T18:51:00Z"} membrane phospholipid composition through
[the]{.insertion author="2003" date="2023-04-21T18:52:00Z"} activation
of lysophosphatidylcholine acyltransferase 3 (LPCAT3), which
[was]{.deletion author="2003" date="2023-04-21T18:52:00Z"}
[is]{.insertion author="2003" date="2023-04-21T18:52:00Z"} directly
related to LPCs[^60^](\l)[]{.comment-end id="4"}. The above classes
[showed]{.deletion author="2003" date="2023-04-21T18:52:00Z"}
[are]{.insertion author="2003" date="2023-04-21T18:52:00Z"}
[correlation]{.deletion author="2003" date="2023-04-21T18:52:00Z"}
[correlated]{.insertion author="2003" date="2023-04-21T18:52:00Z"} with
LXRs[^59^](\l). [Unfortunately]{.deletion author="2003"
date="2023-04-21T18:52:00Z"}[However]{.insertion author="2003"
date="2023-04-21T18:52:00Z"}, LXRs' specific role in SaB infection or
mortality has not been reported and [is]{.insertion author="2003"
date="2023-04-21T18:52:00Z"} beyond the scope of this research.

In herbal dataset analysis, MCnebula provided a quick annotation of
compounds and exploration of chemical changes in Child-Nebulae with a
scope of chemical classes. The main components of *E. ulmoides*
[were]{.deletion author="2003" date="2023-04-21T18:52:00Z"}
[include]{.insertion author="2003" date="2023-04-21T18:52:00Z"} lignans,
iridoids, phenolics, flavonoids, steroid[,]{.insertion author="2003"
date="2023-04-21T18:52:00Z"} and terpenoids[^61^](\l). In
[our]{.deletion author="2003" date="2023-04-21T18:52:00Z"} [the
present]{.insertion author="2003" date="2023-04-21T18:52:00Z"} study,
the chemical classes [that]{.deletion author="2003"
date="2023-04-21T18:53:00Z"} obtained by ABC selection algorithm
included 'Lignans, neolignans and related compounds'
(LNARC)[,]{.insertion author="2003" date="2023-04-21T18:53:00Z"}
[and]{.deletion author="2003" date="2023-04-21T18:53:00Z"} 'Iridoids and
derivatives' (IAD), [as well as]{.deletion author="2003"
date="2023-04-21T18:53:00Z"} 'Monoterpenoids'[,]{.insertion
author="2003" date="2023-04-21T18:53:00Z"} and 'Terpene
glycosides[.]{.insertion author="2003"
date="2023-04-21T18:53:00Z"}'[.]{.deletion author="2003"
date="2023-04-21T18:53:00Z"} The flavonoids were covered by
'Phenylpropanoids and polyketides' (PAP)^[24](\l)[,]{.insertion
author="2003" date="2023-04-21T18:53:00Z"}^ and phenolics may be found
in 'Methoxyphenols'. The flavonoids were similar to [the]{.deletion
author="2003" date="2023-04-21T18:53:00Z"} steroids and were not
retained in selected results as 'Flavonoides' and 'Steroids and steroid
derivatives', because they were not as abundant in *E. ulmoides* (bark)
as LNARC and IAD. Many of the compounds that [were]{.insertion
author="2003" date="2023-04-21T18:54:00Z"} identified in chemical
classes of LNARC and IAD (Tab. S1) [were]{.deletion author="2003"
date="2023-04-21T18:54:00Z"} [have been]{.insertion author="2003"
date="2023-04-21T18:54:00Z"} reported in previous research about
LC-MS/MS analysis of *E. ulmoides*^[62](\l),[63](\l)^. [We obtained
t]{.deletion author="2003" date="2023-04-21T18:54:00Z"}[T]{.insertion
author="2003" date="2023-04-21T18:54:00Z"}op features [have been
obtained]{.insertion author="2003" date="2023-04-21T18:54:00Z"} based on
statistical comparison of the changes in 'features' quantification
levels before and after processing. One of the compounds that changed
significantly or even was newly produced (ID: 1642) was traced in the
Child-Nebulae. [We hypothesized that]{.deletion author="2003"
date="2023-04-21T18:54:00Z"}[Therefore,]{.insertion author="2003"
date="2023-04-21T18:54:00Z"} it was related to two structurally similar
compounds by transformation. The application of MCnebula in the analysis
of plant-derived compounds was well illustrated [with]{.deletion
author="2003" date="2023-04-21T18:55:00Z"} [by]{.insertion author="2003"
date="2023-04-21T18:55:00Z"} this example, particular[ly]{.insertion
author="2003" date="2023-04-21T18:55:00Z"} for [the]{.insertion
author="2003" date="2023-04-21T18:55:00Z"} quick identification and
exploration of chemical changes. Notably, the reference spectral library
or database for plant-derived compounds was much more scarce compared
with reference spectral library for human-derived
metabolites[,]{.deletion author="2003" date="2023-04-21T18:55:00Z"}
[.]{.insertion author="2003" date="2023-04-21T18:55:00Z"} Although some
specific database of plant-derived compounds [was]{.deletion
author="2003" date="2023-04-21T18:55:00Z"} [have been
developed]{.insertion author="2003"
date="2023-04-21T18:55:00Z"}[constructed]{.deletion author="2003"
date="2023-04-21T18:55:00Z"}[^64^](\l), [there were lack of
enough]{.deletion author="2003"
date="2023-04-21T18:55:00Z"}[the]{.insertion author="2003"
date="2023-04-21T18:55:00Z"} fragmentation spectra for comprehensive
library match [remain insufficient]{.insertion author="2003"
date="2023-04-21T18:55:00Z"}. With the help of MCnebula, a rapid and
reliable resolution of complex compositions of plant-derived can be
achieved.

## Conclusion

The analysis of LC-MS/MS data is challenging because of its large
dataset[,]{.insertion author="2003" date="2023-04-21T18:55:00Z"} [and
much]{.deletion author="2003"
date="2023-04-21T18:55:00Z"}[voluminous]{.insertion author="2003"
date="2023-04-21T18:55:00Z"} information of the unknown
compounds[,]{.insertion author="2003" date="2023-04-21T18:55:00Z"} [as
well as]{.deletion author="2003"
date="2023-04-21T18:56:00Z"}[and]{.insertion author="2003"
date="2023-04-21T18:56:00Z"} the limited of reference spectral library.
Thus, [we established]{.deletion author="2003"
date="2023-04-21T18:56:00Z"} a framework called MCnebula [was
established]{.insertion author="2003" date="2023-04-21T18:56:00Z"} to
facilitate mass spectrometry data analysis by focusing on critical
chemical classes and visualization in multiple dimensions. MCnebula was
proposed and implemented in the R language with package of MCnebula. As
an integrated visualization method, MCnebula may be [more]{.deletion
author="2003" date="2023-04-21T18:56:00Z"} popular for researchers
without background of bioinformatics and computer science. According to
the results of method evaluation, MCnebula had a lower relative false
rate of classified accuracy[,]{.insertion author="2003"
date="2023-04-21T18:56:00Z"} and its accuracy of identification [was up
to]{.deletion author="2003"
date="2023-04-21T18:56:00Z"}[reached]{.insertion author="2003"
date="2023-04-21T18:56:00Z"} 70%. [In order to illustrate t]{.deletion
author="2003" date="2023-04-21T18:56:00Z"}[T]{.insertion author="2003"
date="2023-04-21T18:56:00Z"}he broad utility of MCnebula[,]{.deletion
author="2003" date="2023-04-21T18:56:00Z"} [was illustrated]{.insertion
author="2003" date="2023-04-21T18:56:00Z"} [we]{.deletion author="2003"
date="2023-04-21T18:56:00Z"} [by]{.insertion author="2003"
date="2023-04-21T18:56:00Z"} investigated a human-derived serum dataset
for metabolomics analysis. The results indicated that 'Acyl carnitines'
were screened out by tracing structural classes of
biomarkers[,]{.insertion author="2003" date="2023-04-21T18:56:00Z"}
which was consistent with the reference. [We also investigated
a]{.deletion author="2003" date="2023-04-21T18:59:00Z"}[A]{.insertion
author="2003" date="2023-04-21T18:59:00Z"} plant-derived dataset of
herbal *E. ulmoides* [was also investigated]{.insertion author="2003"
date="2023-04-21T18:59:00Z"} to achieve a rapid unknown compound
annotation and discovery. MCnebula has a great potential in the field of
chemistry and biology. In the future, we hope that fields of application
of MCnebula could expand to agriculture, food science, [and]{.insertion
author="2003" date="2023-04-21T18:59:00Z"} medicine [and so
on]{.deletion author="2003" date="2023-04-21T18:59:00Z"}.

**Acknowledgements**

This work was financially supported by the National Natural Science
Foundation of China (Nos.81973481 and 82274101), Zhejiang Province
Traditional Chinese Medicine Science and Technology Project (Nos.
LZ22H280001 and 2022ZQ033).
