# Figure legend

## Figure 1-6

&ensp;&ensp;
**Fig. {@fig:start}{nolink=True} | Overview of MCnebula algorithm.**
(**a**) The data preprocessing of MCnebula algorithm consists of two main parts.
The first part, **LC-MS processing**, from which feature detection is performed and feature table as well as MS/MS list (MGF file) are output.
The secound part, **Sirius computation workflow**, herein, above all SIRIUS and ZODIAC are utilized to establish fragmentation trees, then CSI:FingerID were utilized to predict fingerprints upon fragmentation trees and followed by database retrieve to match appropriate structures. Subsequently, the fingerprints are used to predict compound classes via CANOPUS as well.
The Posterior probability of classification prediction (PPCP) dataset obtained herein.
For the sake of assessing MS/MS spectrum similarity via nomalized fragmentation tree alignment similarity (NFTAS), SIRIUS standalone CLI tool is excuted to compute fragmentation tree alignement similarity (FTAS) among MS/MS spectrum.
To generate network file of parent-chemical nebula, **NFTAS processing** is performed.
Owing to the heterogeneity of FTAS matrix, the matrix were nomalized firstly, and then reformated as network file.
(**b**) To generate Chem-Index, **Classes filter** is performed.
SIRIUS 4 summary files and (PPCP) dataset are collated.
The summary files are used to obtain PPCP data for the five levels of classification of compound identification results from the total PPCP dataset.
As shown in matrix of bar plot, five levels classification of PPCP data are available for each feature.
Since not all predictions have sufficient confidence, a PPCP threshold is allowed to be set to filter the classes.
For each feature, a specific category is defined, termed Access Class.
Access Class is defined from classes of five levels, with class priority: $P_{Level 5} \gt P_{Subclass} \gt P_{Class} \gt P_{Superclass}$, whereas the most specific class has no priority.
In order of priority, for each feature, while the PPCP reached the threashold, the class will served as Access Class.
After all the Access Class obtained, these classes will be further filtered as Chem-Index via retrieving PPCP datacet and counting the number of features of which PPCP of the class reached the threshold.
Features number limitation are set to filter the classes with too subtile or too large scope for better clustering and visualization.

&ensp;&ensp;
**Fig. {@fig:eu_nebulae}{nolink=True}| Visualization of multi-chemical nebulae characterizes the compound classification distribution of complex chemcial composition of *E. ulmoides*.**
The **parent-chemical nebula** is visualized in network layout algorithm of [layout_with_mds](https://cran.microsoft.com/web/packages/igraph/igraph.pdf).
The nodes map all the features (compounds) predicted via SIRIUS (m/z $\leq$ 800 Da).
The layout algorithm makes the nodes with edges, which were generated upon NFTAS ($\geq$ 0.4), distributed in the inner part of the parent-chemical nebula, whereas the nodes without edges are scattered in the outer ring.
The color of nodes maps compound superclasses summaried by CANOPUS (based on SIRIUS and ZODIAC top score formula).
The size of nodes maps Tanimoto similarity of the top score structure retrieved by CSI:FingerID.
Of note, the maps from classification or structure do not necessarily originate from the same molecular formula.
All the **child-chemical nebulae** are visualized in network layout algorithm of [layout_with_fr](https://cran.microsoft.com/web/packages/igraph/igraph.pdf).
These child-chemical nebulae, which were faceted as network matrix upon Chem-Index and posterior probability of classification prediction (PPCP) ($\geq$ 0.5) of features (nodes), make up multi-chemical nebulae.
The layout algorithm herein makes the nodes with edges distributed as some clusters, whereas the nodes without edges are scattered as a lunar shape.
The edges were also generated upon NFTAS ($\geq$ 0.4). 
Similar to the parent-chemcial nebulae, the size of nodes maps Tanimoto similarity of the structure retrieved by CSI:FingerID, whereas the color of nodes maps Access Class.
The same, the maps from classification or structure do not necessarily originate from the same molecular formula.
The text labels of multi-chemcial nabulae illustrate the Chem-Index.

&ensp;&ensp;
**Fig. {@fig:eu_focus}{nolink=True} | Visualization of child-chemcial nebulae as well as Iridoids (Iridoids and derivatives) and lignans (Lignans, neolignans and related compounds) facilitates a focal analysis.**
Both the child-chemical nebulae are visualized in network layout algorithm of [layout_with_fr](https://cran.microsoft.com/web/packages/igraph/igraph.pdf).
The layout algorithm herein makes the nodes with edges distributed as some clusters, whereas the nodes without edges are scattered as a lunar shape.
The edges were generated based on NFTAS ($\geq$ 0.4).
The nodes were clustered from parent-chemical nebula upon posterior probability of classification prediction (PPCP) ($\geq$ 0.5).
The size of nodes maps Tanimoto similarity of the top score structure retrieved by CSI:FingerID, whereas the color of nodes maps Access Class.
The Access Classes difined by MCnebula algorithm upon CANOPUS classification summary and PPCP.
Note that Access Class does not imply a true classification of the structure.
The 'Undifined' of Access Class means the five levels of PPCP do not meet the threshold according to classes priority.
The visualization of the nodes integrates the compound structure of *in silico* prediction as well as PPCP dataset.
The highest score matching structure of CSI:FingerID is mapped to the center of the nodes (the 2D structures were drawn via [Molconverter](https://docs.chemaxon.com/display/docs/molconvert.md)), and the ring-bar plot at the edges of the nodes visualized the PPCP for all Chem-Index.
In the zoomed-in node (feature ID:527), the characters mapped in each bar plot illustrate the absolute index of the class in CANOPUS.
Of note, the maps from classification or structure do not necessarily originate from the same molecular formula.

&ensp;&ensp;
**Fig. {@fig:step}{nolink=True} | Posterio probability of classification prediction (PPCP) and nomalized fragmentation tree alignment similarity (NFTAS) impact phase I or phase II clustering and morphology of child-chemical nebula**.
For PPCP and NFTAS, disparate thereshold setting impact clustering and morphology of child-chemical nebula of lignans in *E. ulmoides* were inspected. 
(**a-b**) All the networks (child-chemical nebulae) are visualized in layout algorithm of [layout_with_fr](https://cran.microsoft.com/web/packages/igraph/igraph.pdf). 
The nodes of high transparency imply no edges connneted, whereas the high centrality degree imply the nodes connected by more edges.
(**a**) Disparate PPCP thereshold setting impact phase I clustering, whereas the NFTAS threshold is fixed (NFTAS $\geq$ 0.4).
In general, the higher the PPCP threshold, the higher the confidence level of the clustering.
(**b**) Disparate NFTAS thereshold setting impact phase II clustering, whereas the PPCP threshold is fixed (PPCP $\geq$ 0.5).
Lower NFTAS threshold mean that more similarity among MS/MS spectrums are revealed, however, is more difficult to visualize.

&ensp;&ensp;
**Fig. {@fig:trans}{nolink=True} | Combine MCnebula with CSI:FingerID to investigate the underlying transformation patterns of *E. ulmoides* compounds (lignans and iridoids) during stir-frying with saline water.**
Child-chemical nebulae of lignans (Lignans, neolignans and related compounds) and iridoids (Iridoids and derivatives) are rebuilt to uncover more structure modification relation.
(**a-b**) For the child-chemical nebulae, the central nodes (source nodes) map the picked representative differential features, connected to the nodes (target nodes) of the outer ring.
The nodes of the outer ring are determined on Tanimoto similarity ($\geq$ 0.5) and PPCP ($\geq$ 0.9) and also with an opposite content (peak area) alteration of decrease or increase to the source nodes.
The color of the nodes map the difference area of the peaks before and after stir-frying with saline water, i.e., $\pm \ log_{2}(delta\ area)=log_{2}(\left| P_{pro-eucommia}-P_{raw-eucommia} \right|)$.
($P$: average peak area for a group; Pro-Eucommia: group of *E. ulmoides* after stir-frying with saline water; Raw-Eucommia: group of *E. ulmoides* before stir-frying with saline water).
The edge width maps the NFTAS between nodes.
As for the 2D structure matrix, each row lists 10 structural candidates of the top score molecular formula corresponding to the compound (feature), and the dotted line guides the source feature. 
The connection of structural candidates between two rows indicates a structural modification relevance.

&ensp;&ensp;
**Fig. {@fig:route}{nolink=True} | End-to-end analysis of MCnebula algorithm from as-prepared samples to multi-chemcial nebulae.**
First, The data (.RAW) of prepared sample which consist of complex chemical composition are obtained via LC-MS instrument.
The data (.RAW) is then converted to get the data of m/z extensible markup language (mzML) , followed by feature detection of LC-MS processing.
Feature table and MS/MS list (MGF file) are obtained.
Afterwards, command line interface (CLI) is recommended for consecutively analysis using SIRIUS 4 and MCnebula script, yet the compound idenfication of SIRIUS workflow is also support for graphical user interface (GUI).
SIRIUS computation workflow involves compound idenfication and fragmentation tree alignment similarity (FTAS) computation.
Subsequently, MCnebula is excuted to obtain network files of multi-chemcial nebulae.
A variety of annotation files can be mapped into multi-chemcial nebulae to facilitate analysis.

## Extended data figure 1-7

&ensp;&ensp;
**Extended Data Fig. {@tbl:rat_nebulae}{nolink=True} | Visualization of multi-chemical nebulae characterizes the compound classification distribution of complex chemcial composition of rat fecal metabolome.**
The **parent-chemical nebula** is visualized in network layout algorithm of [layout_with_kk](https://cran.microsoft.com/web/packages/igraph/igraph.pdf).
The nodes map all the features (compounds) predicted via SIRIUS (m/z $\leq$ 800 Da).
The layout algorithm herein makes the nodes which possessing great amount of edges distributed in the inner part of the parent-chemical nebula, whereas the nodes with less edges are scattered in the outer ring.
Edges were generated upon NFTAS ($\geq$ 0.4).
The color of nodes maps compound superclasses summaried by CANOPUS (based on SIRIUS and ZODIAC top score formula).
The size of nodes maps Tanimoto similarity of the top score structure retrieved by CSI:FingerID.
Of note, the maps from classification or structure do not necessarily originate from the same molecular formula.
All the **child-chemical nebulae** are visualized in network layout algorithm of [layout_with_fr](https://cran.microsoft.com/web/packages/igraph/igraph.pdf).
These child-chemical nebulae, which were faceted as network matrix upon Chem-Index and posterior probability of classification prediction (PPCP) ($\geq$ 0.5) of features (nodes), make up multi-chemical nebulae.
The layout algorithm of 'fr' makes the nodes with edges distributed as some clusters, whereas the nodes without edges are scattered as a lunar shape.
Edges were generated upon NFTAS ($\geq$ 0.4).
Similar to the parent-chemcial nebulae, the size of nodes maps Tanimoto similarity of the structure retrieved by CSI:FingerID, whereas the color of nodes maps Access Class.
The same, the maps from classification or structure do not necessarily originate from the same molecular formula.
The text labels of multi-chemcial nabulae illustrate the Chem-Index.

&ensp;&ensp;
**Extended Data Fig. {@tbl:fbmn}{nolink=True} | Global natural products community (GNPS) feature-based molecular networking (FBMN) of *E. ulmoides* dataset allocated with superclass of CANOPUS summrary**
The network of FBMN is visualized in network layout algorithm of [layout_tbl_graph_stress](https://cran.microsoft.com/web/packages/ggraph/ggraph.pdf).
The nodes map all the features (compounds) predicted via SIRIUS (m/z $\leq$ 800 Da).
For morphology parameters of FBMN, the 'Advanced Network Options' are set in default (Min Pair Cos = 0.7; Minimum Matched Fragment Ions = 6; Maximum shift between precursors = 500; Network TopK = 10; Maximum Connected Component Size = 100).
The color of nodes maps compound superclasses summaried by CANOPUS (SIRIUS and ZODIAC top score formula).
The size of nodes maps Tanimoto similarity of the top score structure retrieved by CSI:FingerID.
Of note, the maps from classification or structure do not necessarily originate from the same molecular formula.
Overall, the lignans (Lignans, neolignans and related compounds) are scattered all over the network

&ensp;&ensp;
**Extended Data Fig. {@tbl:eu_focus_s}{nolink=True} | Specific cases of MCnebula phase I clustering of lignans (Lignans, neolignans and related compounds) of *E. ulmoides* dataset.**
The features (ID: 1746 and ID: 2081) in child-chemcial nebula of lignans are illustrated with extracted ion chromatogram (EIC) and MS/MS spectrum.
In **MS/MS spectrums** plots, the structures, which were retrieved by CSI:FingerID, were drawn with 'Isomeric SMILES' of PubChem data record (Pubchem ID: 174003).
Note that MS/MS spectrum is fail in unequivocally ascertaining the molecular scaffold (i.e. geometrical isomers, position isomers) and 3D structure.
The mirrored MS/MS plots illustrate the output MS/MS data (black bar plot) of MZmine2 (raw MS/MS spectrums mainly subjected to a Merge algorithm, i.e., the same MS/MS spectrums of feature are merged across samples. Details were described in Method section) and 
the [matched peaks of SIRIUS](https://boecker-lab.github.io/docs.sirius.github.io/prerequisites/#spectral-quality) (red bar plot) while establishing fragmentation tree.
The dot above the bar implies a matching correlation.
In **EIC spectrum** plots, the peak shapes of features in *E. ulmoides* dataset of two groups with three parellel prepared samples are illustrated (Pro_Eucommia: group of *E. ulmoides* after stir-frying with saline water; Raw_Eucommia: group of *E. ulmoides* before stir-frying with saline water).
The **Child-chemcial nebula** is in line with that of Fig. {@fig:eu_focus}{nolink=True}:
The child-chemical nebulae are visualized in network layout algorithm of [layout_with_fr](https://cran.microsoft.com/web/packages/igraph/igraph.pdf).
The layout algorithm makes the nodes with edges distributed as some clusters, whereas the nodes without edges are scattered as a lunar shape.
The edges were generated based on NFTAS ($\geq$ 0.4).
The nodes were clustered from parent-chemical nebula upon posterior probability of classification prediction (PPCP) ($\geq$ 0.5).
The size of nodes maps Tanimoto similarity of the top score structure retrieved by CSI:FingerID, whereas the color of nodes maps Access Class.
The Access Classes difined by MCnebula algorithm upon CANOPUS classification summary and PPCP.
Note that Access Class does not imply a true classification of the structure.
The 'Undifined' of Access Class means the five levels of PPCP do not meet the threshold according to classes priority.
The visualization of the nodes integrates the compound structure of *in silico* prediction as well as PPCP dataset.
The highest score matching structure of CSI:FingerID is mapped to the center of the nodes (the 2D structures were drawn via [Molconverter](https://docs.chemaxon.com/display/docs/molconvert.md)), and the ring-bar plot at the edges of the nodes visualized the PPCP for all Chem-Index.
In the zoomed-in node (feature ID:527), the characters mapped in each bar plot illustrate the absolute index of the class in CANOPUS.
Of note, the maps from classification or structure do not necessarily originate from the same molecular formula.

&ensp;&ensp;
**Extended Data Fig. {@tbl:gnps_mc}{nolink=True} | Combining MCnebula phase I clustering and Chem-Index with network of global natural products community (GNPS) feature-based molecular networking (FBMN) of *E. ulmoides* dataset.**
The edges of **parent-chemical nebula** is mainly generated via FBMN workflow (Min Pairs Cos = 0.6808; Minimal Matched Fragment Ions: 6; no restrictions on other 'Advanced Network Options').
The parent-chemical nebula is visualized in network layout algorithm of [layout_with_mds](https://cran.microsoft.com/web/packages/igraph/igraph.pdf).
The nodes map all the features (compounds) predicted via SIRIUS (m/z $\leq$ 800 Da).
The layout algorithm makes the nodes with edges distributed in the inner part of the parent-chemical nebula, whereas the nodes without edges are scattered in the outer ring.
The color of nodes maps compound superclasses summaried by CANOPUS (upon SIRIUS and ZODIAC top score formula).
The size of nodes maps Tanimoto similarity of the top score structure retrieved by CSI:FingerID.
Of note, the maps from classification or structure do not necessarily originate from the same molecular formula.
All the **child-chemical nebulae** are visualized in network layout algorithm of [layout_with_fr](https://cran.microsoft.com/web/packages/igraph/igraph.pdf).
These child-chemical nebulae, which were faceted as network matrix upon Chem-Index and posterior probability of classification prediction (PPCP) ($\geq$ 0.5) of features (nodes), make up multi-chemical nebulae.
The layout algorithm herein makes the nodes with edges distributed as some clusters, whereas the nodes without edges are scattered as a lunar shape.
Similar to the parent-chemcial nebulae, the size of nodes maps Tanimoto similarity of the structure retrieved by CSI:FingerID, whereas the color of nodes maps Access Class.
The same, the maps from classification or structure do not necessarily originate from the same molecular formula.
The text labels of multi-chemcial nabulae illustrate the Chem-Index.

&ensp;&ensp;
**Extended Data Fig. {@tbl:compare_cluster}{nolink=True} | Evaluation of CS-MS (Min Pair Cos and Minimum Matched Fragment Ions) and MCnebula phase II clustering with three different skeletons classes compounds.**
For evaluation, *E. ulmoides* dataset is processed via feature-based molecular networking (FBMN) and MCnebula workflow, respectly, and the edges number of parent network or parent-chemical nebula are controlled to be approximately equal via parameters of CS-MN or normalized fragmentation tree alignment similarity (NFTAS).
Lignans (Lignans, neolignans and related compounds), iridoids (Iridoids and derivatives) and long-chain fatty acids are picked and clustered (PPCP $\geq$ 0.5) for evaluation.
(**a**) Clustering via MCnebula (NFTAS $\geq$ 0.4; edges number of parent-chemcial nebula is 21177).
(**b**) Clustering via FBMN (Min Pairs Cos $\geq$ 0.6808; edges number of parent network is 21181).
(**c**) Clustering via MCnebula (NFTAS $\geq$ 0.3; edges number of parent-chemical nebula is 125842).
(**d**) Clustering via FBMN (Min Pairs Cos $\geq$ 0.5074; edges number of parent network is 125798).
(**a-d**) All the network visualized in network layout algorithm of [layout_with_fr](https://cran.microsoft.com/web/packages/igraph/igraph.pdf).
The size of nodes maps Tanimoto similarity of the top score structure retrieved by CSI:FingerID.
Of note, the maps from classification or structure do not necessarily originate from the same molecular formula.

&ensp;&ensp;
**Extended Data Fig. {@tbl:violin}{nolink=True} | Features (compounds) peak area distribution for each class in Chem-Index of *E. ulmoides* dataset.**
Theres compounds of each classes are filtered according to posterior probability of classification prediction (PPCP) ($\geq$ 0.5) and Tanimoto similatiy ($\geq$ 0.5) of structure match. 
Their peak area are stated as $y=log_{10}(P_{peak\ area})$.
Of note, if $P_{peak\ area}=0$, the value would be counted as $y=0$.
(**a**) Violin plots and box plots of features peak area distribution for each class in Chem-Index. 
(**b**) Density plots of compounds (features) peak area distribution for picked classes.

&ensp;&ensp;
**Extended Data Fig. {@tbl:stat}{nolink=True} | Statistic analysis and mass spectrometry inspection for compounds (features) of lignans (Lignans, neolignans and related compounds) and iridoids (Iridoids and derivatives) of *E. ulmoides* dataset.**
Theres compounds of lignans and iridoids are filtered according to posterior probability of classification prediction (PPCP) ($\geq$ 0.5) and Tanimoto similatiy ($\geq$ 0.5) of structure match.
(**a**) Ring bar plot of features fold change ($y=log_{2}(P_{pro-eucommia}/P_{raw-eucommia})$) of *E. ulmoides* dataset.
The lables annotated the features with $\left| y \right| \geq$ 1.
(**b**) The peak shapes of the features ($\left| y \right| \geq$ 1) were inspected and filtered for extracted ion chromatogram (EIC) plot.
A total of 12 features were picked.
In EIC plots, the peak shapes of features in *E. ulmoides* dataset of two groups with three parellel prepared samples are illustrated.
($P$: average peak area for a group; Pro-Eucommia: group of *E. ulmoides* after stir-frying with saline water; Raw-Eucommia: group of *E. ulmoides* before stir-frying with saline water).
(**c**) The MS/MS spectrums of the picked features are inspected.
In **MS/MS spectrums** plots, the structures, which were retrieved by CSI:FingerID, were drawn with 'Canonical SMILES' or 'Isomeric SMILES' of PubChem data record.
Note that MS/MS spectrum is fail in unequivocally ascertaining the molecular scaffold (i.e. geometrical isomers, position isomers) and 3D structure.
The mirrored MS/MS spectrum plots illustrate the output MS/MS data (black bar plot) of MZmine2 (raw MS/MS spectrums mainly subjected to a Merge algorithm, i.e., the same MS/MS spectrums of feature are merged across samples. Details were described in Method section) and the [matched peaks of SIRIUS](https://boecker-lab.github.io/docs.sirius.github.io/prerequisites/#spectral-quality) (red bar plot) while establishing fragmentation tree.
The dot above the bar implies a matching correlation.
(**d**) Heatmap of the picked features.
Note that Access Class does not imply a true classification of the structure.

# **Figure**

![Index](){#fig:start}

![Index](){#fig:eu_nebulae}

![Index](){#fig:eu_focus}

![Index](){#fig:step}

![Index](){#fig:trans}

![Index](){#fig:route}

# **Extended**

A B
- -
0 1

Table: test {#tbl:rat_nebulae}

A B
- -
0 1

Table: test {#tbl:fbmn}


A B
- -
0 1

Table: test {#tbl:eu_focus_s}


A B
- -
0 1

Table: test {#tbl:gnps_mc}


A B
- -
0 1

Table: test {#tbl:compare_cluster}


A B
- -
0 1

Table: test {#tbl:violin}


A B
- -
0 1

Table: test {#tbl:stat}

