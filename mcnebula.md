
# **MCnebula: A multidimentional clustering visualization method for fast analysis of complex chemical composion**

# **Abstract**

&ensp;&ensp;
In LC-MS analysis, complex chemical compositions make the annotation time-consuming and complicated due to the large amount data.
Here, we developed a clustering analysis method, termed MCnebula algorithm, for fast structural similarity clustering and orientation analysis of compounds.
MCnebula algorithm eminently achieves clustering and visualizes them as multiple networks, rendering the switching analysis between overall and localized complex chemical compositions available.
We refer to these multiple networks as multi-chemical nebulae.
Compared to the popular clustering analysis method, GNPS molecular networking, which clusters by MS/MS spectral similarity, MCnebula is more proficient in clustering compounds in multiple dimensions according to compound taxonomy.
Additionally, an integrated analytical workflow is encapsulated in MCnebula algorithm, involving preprocessing of mass spectrometry data, identification of compound structures and prediction of classification, etc.
MCnebula can be used in a wide range of analysis of complex chemical compositions from known or unknown provenance.
In this study, we illustrate, evaluate and demonstrate the analytical workflow and application of MCnebula with either a plant-derived *Eucommia ulmoides Oliver* dataset or an animal-derived rat fecal metabolome.

# **Introduction**
&ensp;&ensp;
The analysis and identification of complex chemical components has long been a challenge for the chemical academia.
This dilemma is commonly faced in the composition analysis or application mechanism investigation of unknown or identified natural products.
Tandem mass spectrometry (MS/MS) is a modern and rapidly developing technique for analyzing the chemical composition of material mainly by interpreting MS/MS fragmentation spectrum.
Nowadays, molecular networking (MN) in [global natural products community](https://gnps.ucsd.edu/) (GNPS) is a popular method for MS/MS spectrum annotation.
Principally, after feature detection, MN map features which contain MS/MS spectrum to nodes hence propagating annotations via spectral network similarity[@2017g;@2018d].
Nevertheless, the overriding issues that must be faced in parsing complex chemical compositions currently cannot be rapidly addressed via MN, as MS/MS spectral similarity occasionally do not reflect structural similarity.
Some article sopported this view[@2021a].
These issues involves, but are not limited to, among the complex chemical components:
**a**) what are the main components;
**b**) what are the main classes upon chemical taxonomy;
**c**) what are the major compounds contained in each main class and how they are distributed;
**d**) the basic structure of the parent nucleus of the same main class of chemical components;
**e**) where the experimenter needs to start to parse those chemical composition, etc.

&ensp;&ensp;
To address the above issues, we constructed a new molecular network pattern termed multi-chemical nebula.
In a nutshell, for liquid chromatograph-mass spectrometer (LC-MS), multi-chemical nebulae capture the main classes in a complex chemical composition based on chemical taxonomy, thereby generating an index to create multiple subnetworks, i.e., child-chemical nebulae.
If the features (compounds), deconvelutioned by feature detection, meet the taxonomic foundation, then they would be mapped for deep clustering.
Subsequently, extensive MS/MS spectral annotations were visualized and propagated through multi-chemical nebulae.
We term the algorithm that encompasses the above-mentioned multi-chemical nebulae pattern as MCnebula.
The MCnubula algorithm is divided into two stages, data preprocessing and formation of multi-chemical nebulae, of which the latter is its own algorithm.
In the data preprocessing stage, MCnebula combines the feature detection of LC-MS[@2010], as well as current sophisticated compound *in silico* prediction of SIRIUS computation workflow[@2019].
Overall, the main chemical composition capture of MCnebula is computationally based on CANOPUS (integrated in SIRIUS)[@2021a], while ClassyFire is the practical theoretical provenance[@2016].
For each feature, we performed *in silico* prediction with CANOPUS to obtain the posterior probability of classification prediction (PPCP) for 2497 compound classes.
In deed, it is tough to manually apply to component parsing for multidimensional PPCP dataset derived from a large quantity of features.
Herein, MCnebula algorithm is designed to cluster features in a multidimensional manner into various child-chemical nebulae based on PPCP in combination with ClassyFire five levels of compound classes.
The five levels of classes (most specific class, level 5, subclass, class, superclass) of these features, after SIRIUS workflow, has been summaried by CANOPUS.
This CANOPUS summary based on top score molecular formula.
We defined a specific category in complex chemical composion based on PPCP and the above classes, termed Access Class.
The number of Access Classes is further filtered and used as an index, termed Chem-Index, for establishing multi-chemical nebulae.
After evaluation, in this version of MCnebula, we consider that Chem-Index basically reflects the main characteristics of the complex chemical composition. 
In the future, the algorithm of generating Chem-Index, after being systematic optimized, multi-chemical nebulae will possibly become an advanced visualization profile for characterizing the overall properties of complex chemical components, a kind of fingerprinting.

&ensp;&ensp;
The clustering in MCnebula algorithm does not depend merely on PPCP; the second phase of clustering in child-chemical nebulae are achieved with MS/MS spectral similarity.
We considered that there may be more features in the child-chemical nebulae of which the classes covered an extensive scope of compounds, hence edges generated upon MS/MS similarity can be added as supplementary information to assist MS/MS spectral annotate.
Nevertheless, the MS/MS similarity algorithm in MCnebula is not computed in terms of cosine similarity and minimum number of fragmentation matches (abbreviated as CS-MN) as the MN of GNPS[@2020b].
As has been refered, the limitations of CS-MN may lead to inaccurate MS/MS similarity evaluation owing to low signal-to-noise ratio[@2020b], whereas SIRIUS is superior in handling noise in spectum via establishing fragmentation tree[@2011;@2017].
Therefore, a specific MS/MS similarity algorithm, termed nomalized fragmentation tree alignment similarity (NFTAS) is adopped.
Since the MS/MS fragmentation trees has been built in SIRIUS workflow, thereby a [SIRIUS standalone CLI tool](https://boecker-lab.github.io/docs.sirius.github.io/cli-standalone/#similarity-tool) is used to compute fragmentation tree alignment similarity (FTAS), followed by a nomalization addressing homogeneity issues to abtain NFTAS.
NFTAS matrix is then reformatted to construct edges in multi-chemical nebulae.

&ensp;&ensp;
The above MCnebula algorithm, except for data preprocessing, is provisionally implemented in a bash script.
Users can follow the steps of the MCnebula workflow to process LC-MS dataset of complex chemical compositions and obtain network files of multi-chemical nebulae (TSV files) as well as numerous annotation lists.
Subsequently, visualization is available for the output files with the help of Cytoscape or ggraph:ggplot2 package of R or other tools[@2003;@2011a].
The visualized multi-chemical nebulae contain a large amount of annotation, and structurally similar compounds achieved deep clustering.
Overall observation, the multi-chemical nebulae illustrate the compound distribution characteristics of complex chemical composition; locally, the child-chemical nebulae facilitate MS/MS spectral annotated propagation.
In this study, we illustrate, evaluate and apply MCnebula algorithm with two datasets, involving plant-derived *Eucommia ulmoides Oliver* (*E. ulmoides*) bark extract and animal-derived rats fecal metabolites.

# **Results**

## **Overviell of MCnebula**

&ensp;&ensp;
LC-MS dataset are available through the MCnebula workflow to create multi-chemical nebulae.
Herein, we use the *E. ulmoides* LC-MS dataset (untargeted MS/MS) to illustrate the workflow of MCnebula, and the main stage are depicted as following (Fig. {@fig:start}{nolink=True}a and {@fig:start}{nolink=True})b:  

+ Processing mass spectrometry data with popular tools such as MZmine2 or OpenMS[@2010a;@2016e].
The [workfow of using MZmine2 or OpenMS to export formatted file](https://www.youtube.com/channel/UCIbW_ZFSADRUQ-T5nmgU4VA/featured) has been briefly introduced.
While the advanced feature detection is needed, the steps are essentially similar to the [Feature-based molecular networking](https://ccms-ucsd.github.io/GNPSDocumentation/featurebasedmolecularnetworking-with-mzmine2/) (FBMN) preprocessing workflow[@2020d].
If formatting is available, other mass spectrometry data processing tools can also be utilized.
Nevertheless, it is of note that the MS/MS spectuml summary file obtained must meet the subsequent [SIRIUS prerequisites](https://boecker-lab.github.io/docs.sirius.github.io/prerequisites/).
This stage belongs to data preprocessing of MCnebula algorithm.
+ Performing SIRIUS computation workflow. 
This stage is a part of data preprocessing of MCnebula algorithm as well, and consists of two steps:
**a**) Compound identification via SIRIUS 4[@2019], involving SIRIUS and ZODIAC establish fragmentation trees, CSI:FingerID predict fingerprints and retrieve database, CANOPUS predict compound classification upon fingerprints.
**b**) FTAS matrix computation via [SIRIUS standalone CLI tools](https://boecker-lab.github.io/docs.sirius.github.io/cli-standalone/#similarity-tool)[@2012b].
+ MCnebula processing. A stage of creating multi-chemical nebulae, and the main body are:
**a**) MCnebula excutes the normalization of FTAS matrix as NFTAS matrix and followed by reformating so that the output list can be applied to generate parent-chemical nebulae.
**b**) as illustrated in Figure {@fig:start}{nolink=True}b, MCnebula integrates the compound prediction dataset of CANOPUS, i.e., PPCP dataset, thereby implements an unsupervised-like algorithm to filter 2497 compound classes to establish Chem-Index.
Chem-Index aims at characterizing the main properties of complex chemical compositions.
**c**) employ Chem-Index to generate network files of multi-chemical nebulae. 

&ensp;&ensp;
Figure {@fig:eu_nebulae}{nolink=True} illustrates the visualized multi-chemical nebulae of *E. ulmoides* dataset, involving parent-chemical nabula and child-chemical nabulae.
In parent-chemical nebula, the nodes map all the features predicted by SIRIUS (m/z $\leq$ 800 Da). 
The layout algorithm herein makes the nodes with edges, which were generated upon NFTAS ($\geq$ 0.4), distributed in the inner part of the chemical nebula, whereas the nodes without edges are scattered in the outer ring.
The color of nodes which mapped compound superclasses allow a preliminary observation of chemical characteristics of *E. ulmoides*.
Among them, lignans are the prominent group of components, and indeed, it is widely reported and confirmed as one of the main components[@2021k].
In contrast to the huge hairball networking status of parent-chemical nebula that is helpless to visualize, the child-chemical nebulae embrace much richer information.
The Child-chemical nebulae distributes features into diverse networks based on the established Chem-Index and PPCP, presenting the first stage clustering of MCnebula.
Note that the same feature is likely to occur in diverse child-chemical nebulae, as the same compound can belong to multiple classes based on distinct chemical functional groups or skeletal structures.
For example, lignan glycosides occurs under the index of both "lignan glycosides", "lignans, neolignans and related compounds", and also possibly under the index of "glycoside compounds" (this index was filted owing to feature number limitation set).
It can be considered that the clustering algorithm in the first stage of MCnebula implements a multidimensional clustering, which is extremely diverse from the single dimensional clustering algorithm implemented in GNPS MN with CS-MN and other network morphological parameters[@2020b].
The latter tends to focus on one structural characteristic between compounds, such as backbone structure, whereas neglecting the relations between other molecular properties, such as functional group modifications.
Next argument, the color of the nodes maps instead of the superclass, but the Access Class. 
Note that a feature in a child-chemical nebula does not necessarily establish that it is a compound of this class, despite CANOPUS prediction has been reported with average accuracy of 99.7% in cross-validation[@2021a].
The miscellaneous colors in a child-chemical nebulae imply to some extent the uncertainty of the prediction but it is also atribute to that these compounds belong to more than one classes.
Therefore, the next phase of clustering is required.
Similar to parent-chemical nebula, the edges in child-chemical nebulae maps the MS/MS spectrum similarity with NFTAS algorithm, facilitating the propagation of MS/MS spectrum annotations.
Generating edges via NFTAS instead of CS-MN is considered that upon establishing fragmentation tree, the noise in MS/MS spectrum would be filtered[@2017].

&ensp;&ensp;
Fast analysis of complex chemical compositions is availably achieved with MCnebula.
Complex chemical compositions are generally mixtures of a large variety of unknown compounds, and the challenge of analysis is that the miscellaneous system make comprehensive analysis elusive.
The MCnebula implementation of multi-chemical nebulae reveals the overall characteristics of the complex chemical composition and makes further focused analysis available, as an integrated analysis pattern that unifies the whole and the parts.
For example, since the multi-chemical nebulae has shown the distribution characteristics of the compounds of *E. ulmoides* in chemical taxonomy, we focused on two components, lignans and iridoids, for further analysis.
As illustrated in Figure {@fig:eu_focus}{nolink=True}, the visualization of child-chemical nebulae integrate the compound structure of *in silico* prediction as well as PPCP dataset.
The highest score matching structure of CSI:FingerID based on MS/MS spectum is mapped to the center of the node[@2012c], and the ring-bar plot at the edges of the nodes visualized the PPCP for all Chem-Index.
Of note, the visualization of PPCP is of great interest, for the annotation provides suggestive information for those compounds of which the structure *in silico* prediction are not reliable according to network structure similarity propagation (e.g., the feature of ID: 2235).
Furthermore, this allows a strong association formed among each child-chemical nebula with the others, as the groups of the ring bar plot in line with Chem-Index.
As Multi-chemical nebulae were generated upon Chem-Index, While the PPCP above the threshold for a class means that the node occurs in the corresponding child-chemical nebula as well.

## **Evaluation of MCnebula**

&ensp;&ensp;
In the following, to demonstrate the effectiveness of MCnebula, we evaluated MCnebula Phase I clustering, Phase II clustering, and the algorithm for obtaining Chem-Index with either *E. ulmoides* or rats fecal metabolomics dataset.

&ensp;&ensp;
**Phase I clustering: cluster features via PPCP dataset.** 
We attempted to compare such clustering algorithm with the clustering algorithm of GNPS MN, as it is an widely popular method for facilitating MS/MS annotations.
In fact, the limitation of the MN algorithm have been argued with illustrations in the article of CANOPUS[@2021a], i.e., via CANOPUS a structurally similar flavonoids appearing outside the clustering network was found.
This proves the superiority of clustering with PPCP instead of CS-MN based algorithm.
As has been illustrated in Figure {@fig:eu_focus}{nolink=True}, *in silico* prediction demonstrated the compounds in child-chemical nebulae of lignans habour similar carbon skeleton structures of ligans which have been reviewed[@2020l].
These compounds were clustered via MCnebula, whereas feature-based MN (FBMN) were performed with *E. ulmoides* dataset, they are scattered all over the network (Extended data Fig. {@tbl:fbmn}{nolink=True}).
In a sense, GNPS MN or FBMN algorithms provide a large number of parameters (e.g., Network TopK, Minimum Cluster Size) to allow the experimenter to flexibly shape the MN[@2020b], and in addition, GNPS provides many advanced tools (e.g., MolNetEnhancer[@2019a]) to enhance the MN, so that an unbiased evaluation of both MN and MCnebula algorithms is almost impossible. 
Nevertheless, GNPS MN or FBMN is highly flawed in terms of the effectiveness of the underlying clustering alone, as compounds with similar structures or the same class are frequently dispersed into distinct clusters.
This sometimes makes the analysis time-consuming.
As for the phase I clustering, like MN, child-chemical nebulae can be altered by modifying the PPCP parameters.
Figure {@fig:step}{nolink=True}a illustrated the morphology of the child-chemical nebula of lignans at disparate PPCP threshold.
In general, the higher the PPCP threshold, the higher the confidence level of the clustering.
We anticipate that CANOPUS will have differential predicted performance in distinct LC-MS datasets, thus the PPCP threshold in MCnebula could be manually adjusted. 

&ensp;&ensp;
Something intriguing occurs when we compare the clustering results of MCnebula with the CANOPUS summary (Extended Data Fig. {@tbl:eu_focus_s}{nolink=True}).
The CANOPUS summariy is inferred from the top score molecular formula.
However, the PPCP dataset in which phase I clustering were performed, are collated according to top score structure (identificated by CSI:FingerID).
The molecular formula of top score structure occasionally diverse from the top score molecular formula.
In the evaluation, they are both utilized for annotation.
For example, Both features of ID: 1746 and 2081, a couple of isomeric compounds deconvoluted by feature detection, seems inconsistent in Access Class (defined upon CANOPUS summary) and child-chemical nebula index.
Based on the structure prediction results, we noticed that they are not only lignans but also carbohydrate conjugates.
However, if cluster with CANOPUS summary, they would not be detected.
Further, we analyzed the feature of ID: 2081.
We noticed that the prediction of CANOPUS is based on the molecular formula "C24H46N2O18S" (Sirius Score: 113.84; No structure candidate), however, the structure prediction of CSI:FingerID is based on "C32H42O16" (Sirius score: 112.26; CSI:FingerID score: -65.66).
The compounds was identified with no library match.
The prediction of CSI:FingerID seems more plausible according to clustering structure similarity propagation as well as that this structure is a lignans which has been reported[@2020l].
Numerous similar examples could be found in other child-chemical nebulae, according to the contradiction of Access Class and the index of child-chemical nebulae.
In this perspective, via combining the highest score structure and classification prediction based on the highest score molecular formula, MCnebula facilitates the penetration of complicated data formed by SIRIUS compound identification workflow.
In addition, due as visualization, the clustering algorithm of MCnebula built on PPCP has higher fault freedom performance than the inference of CANOPUS.  

&ensp;&ensp;
Collectively, MCnebula better clustering than GNPS MN, and in addition, facilitates the data perspective of CANOPUS prediction results, occasionally showing better classification inference than CANOPUS summary.  

&ensp;&ensp;
**Phase II clustering: connecting nodes (features) with edges based on MS/MS spectum similarity.**
MCnebula measures MS/MS spectuml similarity in terms of NFTAS.
MS/MS spectum inevitably contain noise peaks, yet by constructing fragmentation trees, the spectum are considered to be capable of filtering the noise[@2017].
Due to the inhomogeneity of the FTAS scores, MCnebula performs normalization.
Figure {@fig:step}{nolink=True}b illustrate the morphological variation of the Child-chemical nebula under distinct NFTAS.
To evaluate the clustering properties of NFTAS, we processed the features of *E. ulmoides* dataset in MCnebula and GNPS FBMN workflows, respectively, and compared the visualized networks.
To control the variables, in the FBMN workflow, we impose no restrictions on the other network morphology parameters (including Maximum shift between precursors, Network Topk, Maximum Connected Component Size), while Min Pairs Cos is adjusted to 0.6808 ( initially 0.4; the number of edges was restricted after later filtering), and Minimal Matched Fragment Ions was set to 6 (the default parameter).
In MCnebula, NFTAS is set to 0.4.
Ultimately, the visualized parent network of FBMN and MCNebula habour consistent number of nodes (identified via SIRIUS 4), and almost the same number of edges (21181 and 21177 respectively.).
Further, both parent networks faceted as multi-chemical nebulae with phase I clustering algorithm (Fig. {@fig:eu_nebulae}{nolink=True} and Extended Data Fig. {@tbl:gnps_mc}{nolink=True}).
We note that due to the limitations of the MS/MS spectuml similarity algorithm, Child-chemical nebulae from either FBMN or MCnebula are incapable of preferentially connecting structurally similar compounds to each other.  

&ensp;&ensp;
Subsequently, we picked three classes of compounds with significant carbon skeleton discrepancies, combined the nodes, and investigated the discrimination capability of the MS/MS similarity algorithm of FBMN and the NFTAS algorithm of MCnebula for these compounds (Extended Data Fig. {@tbl:compare_cluster}{nolink=True}a and {@tbl:compare_cluster}{nolink=True}b).
Then, the similarity threshold for creating edges was pulled down to increase the number of edges, i.e., Min Pairs Cos from 0.6808 to 0.5074, NFTAS from 0.4 to 0.3; edges number are 125798 and 125842 respectively (Extended Data Fig. {@tbl:compare_cluster}{nolink=True}c and {@tbl:compare_cluster}{nolink=True}d).
The outcomes indicated that both algorithms significantly distinguished long-chain fatty acids but incompletely distinguished between iridoids and lignans.
This also demonstrates the limitations of the clustering algorithm based on MS/MS spectuml similarity.
Nevertheless, the MS/MS spectuml similarity algorithm will still be an essential complement when constructing associations between compounds under diverse classes or sweeping classes.
In addition, we anticipate that the NFTAS algorithm will have more prominent performance in MS/MS spectum with low signal-to-noise ratio.  

&ensp;&ensp;
**Chem-Index obtaining: capture the characteristic classes of complex chemical composition.**
The main small molecule compounds of *E. ulmoides* involves lignans, iridoids, phenolics, terpenoids, flavonoids, terpenoids, fatty acids and amino acids[@2018c]. 
In deed, the multi-chemical nebulae of *E. ulmodes* dataset illustrates a range of lignans, iridoids and it's glycosides, monoterpenes, triterpenes, various fatty acids, amino acids.
Flavonoids are covered in "Phenylpropanoids and polyketides", phenols are covered in "Benzenediols" or "Benzoic acid esters" (*E. ulmoides* bark possess less phenolic compounds than leaves[@2021k]), whereas Steroids were filtered owing to the limitation of feature number (50 $\leq$ n $\leq$ 500), but the steroids present in case the threshold is set anew (e.g., 30 $\leq$ n $\leq$ 500).  

&ensp;&ensp;
The chemical components of rat fecal metabolites were inspected as well.
The rats were fed a Co60-irradiated experimental rat maintenance diet consisting mainly of crude protein, crude fat, crude fiber, and a variety of amino acids, etc.
These feed components, together with the *E. ulmoides* extract, are digested and metabolized into feces.
Intestinal bacteria are engaged in this procedure as well.
Feces commonly comprise undigested food residues, intermediate or end products of digestion, connective tissue, secretions from the digestive tract, epithelial cells and bacteria, and bacterial metabolites.
Extend Data Figure {@tbl:rat_nebulae}{nolink=True} dipicts the classes of small molecule metabolites of the rats feces.
Of these, the chemical nebulae of lignans, triterpenoids, phenols, steroids, etc. may be or involve compounds from *E. ulmodes*, which undergo or not undergo gastrointestinal metabolism.
While pharmacokinetic investigations are in demand, the quantitative or annotated matrix of features derived from the analysis of LC-MS processing tools such as MZmine2 are available through Cytoscape or other visualization tools to decorate the chemical nebulae hence present nested statistical plots in line with FBMN[@2021i].  

&ensp;&ensp;
All taken togather, MCnebula basically captured the main classes of compounds in complex chemical compositions and hence faceted complex parent-chemical nebulae into multi-chemical nebulae; compounds in Child-chemical nebulae possess a high degree of structural similarity; edges generated in child-chemical nebulae depend on a noise-filtered NFTAS.

## **Data analysis with MCnebula**

&ensp;&ensp;
**Analysis with *E. ulmoides dataset*.**
*E. ulmoides*, as a traditional Chinese medicine (TCM), after being processed with saline water, has been applied to the treatment of renal diseases for a long history.
The chemical composition of *E. ulmoides* (bark) is significantly altered when moistened with saline water and stir-fried.
It is essential to uncover the principles of chemical composition alteration during stir-frying with saline water for guiding the clinical application of TCM.
However, due to the exceedingly complex chemical composition of TCM, including *E. ulmoides*, this is a challenging job.
We have shown in the previous section that MCnebula is capable of implementing deep clustering based on compound classes.
This provides the possibility of fast vari-focal analysis of specific classes of compounds in complex chemical compositions.
Subsequently, we will demonstrate, in the case of *E. ulmoides* as an example, how MCnebula could be utilized to investigate the patterns of alteration of complex chemical composition after special manipulation, i.e., stir-frying with saline water.  

&ensp;&ensp;
In MZmine2, LC-MS datasets of *E. ulmoides* pre- and post-processed with saline water (Raw-Eucommia and Pro-Eucommia) were manipulated and the alignment algorithm was adopted to merge the features into one feature list.
After SIRIUS computation workflow and MCnebula workflow, the overview of the main chemical composition of *E. ulmoides* was illustrated (Fig. {@fig:eu_nebulae}{nolink=True}). 
In addition, the node matrix of the multi-chemical nebulae could be combined with the feature quantification table to view the alteration of the content distribution of numerous classes of Raw- and Pro-Eucommia (Extended Data Fig. {@tbl:violin}{nolink=True}). 
For example, we were particularly interested in the lignans and iridoids components of *E. ulmoides* as previous review has reported their essential role[@2021k]. 
From Extended Data Figure {@tbl:violin}{nolink=True}b we observed that there seems to be a significant alteration in the lignan glycosides content of Pro-Eucommia compared to Raw-Eucommia.
Following this, with MCnebula, we instantly and precisely focused our research on lignans and iridoids.  

&ensp;&ensp;
Looking through these visualized structures (Fig. {@fig:eu_focus}{nolink=True}), it is noticeable that both lignans and iridoids compounds have consistent several parent nuclei.
In deed, the characteristics of these structures are in general line with those depicted in previous reports for lignans and iridoids of *E. ulmoides* [@2020l].
We assumed that unidirectional or even multidirectional transformations between these compounds probably occurred during the stir-frying with saline water of *E. ulmoides*.  

&ensp;&ensp;
To investigate the underlying transformation patterns, we screened the chemical nebulae of lignans and iridoids for the features with the most significant alteration in peak area, i.e., sorting the features by fold change (FC) (| Area~Pro-Eucmmia~ / Area~Raw-Eucmmia~ |) (Extended Data Fig. {@tbl:stat}{nolink=True}a). 
The features with | log~2~(FC) | > 1 were picked.
Then we checked the peak shapes of the features obtained by deconvolution in MZmine2 and 12 features were picked (Extended Data Fig. {@tbl:stat}{nolink=True}b, {@tbl:stat}{nolink=True}c and {@tbl:stat}{nolink=True}d illustrated the peak shapes in extracted ion chromatograms (EIC), MS/MS spectum, heatmap of peak area, respectively).
The peak area of these features is significantly increased or decreased, and this part of the alteration may be derived from other compounds with little relative change, as manifested by FC, but great absolute change (AC), i.e., | Area~Pro-Eucmmia~ - Area~Raw-Eucmmia~ |.
To trace the origin of these characteristic changes, we reconstructed the lignans and iridoids chemical nebulae by resetting the NFTAS and PPCP threshold. Besides, the increase or decrease in the compound content (peak area) alteration were taken into account as well.  

&ensp;&ensp;
As illustrated in Figure {@fig:trans}{nolink=True}a and {@fig:trans}{nolink=True}b, we combined the visualized chemical nebulae and the candidate structures predicted by CSI:FingerID.
In the network graph on the left, the central nodes represent the features picked above (2 features were filtered due to the absence of edges), connected to the nodes of the outer ring.
The nodes of outer ring are picked upon Tanimoto similarity ($\geq$ 0.5) and PPCP ($\geq$ 0.9) and also with an opposite content alteration of decrease or increase to the source node.
Note that considering the multi-directional transformations occurring among the compounds, we do not restrict the connected nodes of AC in content being equal.
On the right side of the network graph, each row lists 10 structural candidates corresponding to the compound represented by a feature, and the dotted line guides the source feature (compound). 
The connection of structural candidates between two rows indicates a structural modification relevance.
Although we can manually pick the structure corresponding to each feature based on network structural similarity propagation, there are many isomorphisms that are still indistinguishable by mass spectra, so here we list 10 candidates for their structures.
With a comprehensive perspective on these structure candidates and the structural characteristics of other compounds, we summarized:  

+ For lignans (Fig. {@fig:trans}{nolink=True}a), 
**a**) the phenolic hydroxyl groups may undergo electrophilic substitution (first and second rows);
**b**) the phenolic hydroxyl groups may undergo glycosidogenic reactions (third and fourth rows);
**c**) the phenolic hydroxyl-linked disaccharides may be hydrolyzed to monosaccharides (fifth and sixth rows).  
+ For iridoids (Fig. {@fig:trans}{nolink=True}b),
**a**) the iridoid esters may undergo hydrolysis to form iridoids (first and second rows);
**b**) the iridoids may deionize a water to form an alkene bond (third and fourth rows);
**c**) the iridoids may deionize two waters to form an alkene bond and a carbonyl group, respectively (fifth and sixth rows).  

&ensp;&ensp;
In the above speculation, some reactions for the compounds of *E. ulmoides* are seemingly plausible under high temperature conditions, such as the dehydration of iridoids to form unsaturated bonds. However, some are unexpected, such as the glycosidogenic reaction of lignans.
In general, aldoses or ketoses are regarded to react with alcohols catalyzed by acids to form glycosides.
We suggest that a circumstance of complex mixture was formed during the stir-frying of *E. ulmodes* with saline water:
The small amount of saline water leached out some soluble components of *E. ulmoids*, such as phenolic acids, which may bring about a local acidic environment.
The hyperthermia made the interactions among molecules more active, then under the role of multiple factors, the phenolic hydroxyl groups of lignans and the monosaccharides (widely present in plant tissues) underwent glycosidogenic reactions.
Overall, various chemical reactions become unpredictable within the complex mixture environment. 
However, the demonstration of the speculations is beyond the scope of this article, so it would not be discussed.  

&ensp;&ensp;
Taken togather, with MCnebula, we achieved a rapid analysis of the alterations in the chemical composition of *E. ulmoides* (mainly lignans and iridoids, these were collated in Extended Data Table 1) before and after stir-frying with saline water mainly through the following stages:
**a**) compound classes of interest in *E. ulmoides* are focused via obtaining Chem-Index;
**b**) the eligible features are highly clustered via MCnebula phase I clustering;
**c**) the transformation patterns of compounds in *E. ulmoides* during stir-frying with saline water were investigated via MCnebula phase II clustering.

&ensp;&ensp;
**Analysis with rat fecal metabolome.**  
&ensp;&ensp;
......

# **Methods**

## **MCnebula algorithm**

&ensp;&ensp;
**Data preprocessing.**
MCnebula builds on the feature detection of untargeted mass spectrometry data and SIRIUS compound identification. 
In brief, after feature detection of the untargeted mass spectrometry data (via MZmine2), feature table and MS/MS list (MGF file) (via SIRIUS export module) are exported;
SIRIUS (version 4.8.2) executes SIRIUS (compute fragmentation trees), ZODIAC, CSI:FingerID, and CANOPUS in sequence utilizing the MS/MS lists as input, followed by [SIRIUS standalone CLI tool](https://boecker-lab.github.io/docs.sirius.github.io/cli-standalone/#similarity-tool) computing FTAS to obtain similarity score matrix (TSV file).
In the end, MCnebula executes the workflow using the SIRIUS project and the similarity score matrix as input.
The overview are as follows:  

+ Convert raw mass spectrometry data (.RAW) to m/z extensible markup language (mzML) via MSconvert Proteowizard[@2011b; @2012d].
+ Excute feature detection via MZmine2 (version 2.53).
    1. Mass detetion of MS level 1 and MS level 2.
    2. Perform Automated Data Analysis Pipeline (ADAP) chromatogram builder[@2017f].
    3. ADAP chromatogram deconvolution.
    4. Detect isotopic peaks.
    5. Align detected peaks.
    6. Perform gap filling algorithm.
    7. Filter peak lists row via availability of MS/MS spectum.
    8. Export feature lists as CSV file.
    9. Export MS/MS spectrum as MGF via SIRIUS export module.
+ Excute SIRIUS compound idenfication workflow.
    1. Compute fragmentation trees via SIRIUS.
    2. Re-rank molecular formula candidates via ZODIAC.
    3. Predict compound structure via CSI:FingerID.
    4. Predict compound classes via CANOPUS.  

&ensp;&ensp;
The above is the basic procedure of data preprocessing.
Nevertheless, in practice, details have been done to reduce the risk of false negative or false positive detection in feature detection and error report in *in silico* prediction.
While performing feature detection in MZmine2, for multiple groups of the LC-MS dataset, we performed the alignment algorithm separately for each group, followed by a first filtering of the feature list rows, filtering out most of the false positive features (e.g., for the group of three parallel samples, the feature was detected in at least two samples);
then performed the gap filling algorithm for re-searching for false negative features, followed by a second filtering of the feature list rows (e.g. for a group of three parallel samples, the feature is detected in at least three samples).
After each group has completed the above iterations, we performed the alignment algorithm on the aligned lists of all groups, merging them into one feature list;
finally, the gap filling algorithm was performed.
Considering the inter-group variability, no further filtering was done in feature list rows.
The optimization algorithm for feature detection is as follows:  

+ Feature detection via MZmine2  
    …  
    4. Detect isotopic peaks.
    5. Perform alignment and gap filling algorithm for each group (n~1~, n~2~, n~3~… n~x~).
        + Alignment for group n~x~.
        + First feature list rows filter for group n~x~.
        + Gap filling algorithm for group n~x~.
        + Secound feature list rows filter for gorup n~x~.
        + Alignment for all group.
        + Gap filling.
    6. Group MS2 scans with features (for mzML dataset convert from Waters QTOF/MS.RAW).
    7. Filter peak lists row via availability of MS/MS spectum.  
    …  

&ensp;&ensp;
While outputting the MS/MS list, all the MS/MS data belonging to the same feature were merged.
For SIRIUS, experimenters were advised to provide a rich fragmentation spectrum, i.e., noise filtering is not recommended
([SIRIUS Spectral Quality](https://boecker-lab.github.io/docs.sirius.github.io/prerequisites/#spectral-quality)).
However, when all MS/MS belonging to the same FEATURE are merged without filtering, errors are reported when using CSI:FingerID to predict compound structures, which may be: Request Entity Too Large. 
In particular, when batch processing large amounts of LC-MS data or LC-MS data containing large amounts of noise.
Therefore, the parameter of "Peak count threshold" was set for merging MS/MS spectrum in MZmine2 (for example, set to 50% for merging more than ten samples).
For this, after merging, all peaks which occur in less than threshold of frequency were removed.
When the MS/MS list (MGF file) has been output, we rewrited this file.
Because we noticed that the precursor ions of about 1/4 of the features in the MS/MS list may be recorded as "CHARGR=-0", and then, when processing this MS/MS list with SIRIUS, the adduct type of these precursor ions possibly be re-determined as "[M+?]+" (in negative ion mode).
This is impossible.
A similar situation occurs for data processing in the positive ion mode.
Therefore, we rewrite "CHARGE=-0" to "CHARGE=-1", as SIRIUS only supports single charge ions.  

&ensp;&ensp;
When identifying compounds via SIRIUS, we set the threshold (m/z &lt; 800 Da) because the time and random access memory (RAM) of machine required to compute larger molecular compounds with SIRIUS, ZODIAC increases geometrically.
After the *in silico* prediction of SIRIUS workfow, we excute SIRIUS standalone CLI tool to obtain FTAS matrix.  

&ensp;&ensp;
**MCnebula processing.** 
MCnebula runs in the SIRIUS project space.
In a nutshell, first of all, MCnebula collates the highest score structure predicted by CSI:FingerID as structure annotation (Stru-anno) for each feature.
Note that the molecular formulae on which CSI:FingerID predictions are based have been re-ranked by ZODIAC, hence the molecular formulae of the structures with the highest score are also those with the top ZODIAC scores yet not necessarily the highest score.  

&ensp;&ensp;
Subsequently, the molecular formula of the highest scoring structure was adopted as the reference, the CANOPUS predicted PPCP dataset (2497 compound classes[@2021a]) for each feature was collated accordingly.
In the CANOPUS summary file, the compound classes prediction results for each feature are written based on five levels classification of ClassyFire (most specific class, level 5, subclass, class, superclass) [@2016].
Theoretically, predicting the subtiler the classification, the higher the quality of the spectrum for MS/MS and the more difficult the prediction.
Moreover, focusing on subtiler classes is not necessarily conducive to analysis. 
In addition, we noticed that the classifications that require focus in research are scattered across the levels.
Therefore, we defined a special category, termed Access Class, mainly derived from the five levels of CANOPUS summary.
In general, for the classification prediction of CANOPUS, the higher the PPCP, the higher the confidence possibly be[@2021a].
For each feature of compound classification, only one class is taken as Acess Class among 5 levels, hence we define a threshold to filter the low PP prediction of classes:

$$
T_{pp}=x, x \in (0,1)
$$

Further, as illustrated in Figure {@fig:start}{nolink=True}b, we set a priority to pick class in sequence:  

$$
P_{level5} \gt P_{subclass} \gt P_{class} \gt P_{superclass}
$$

In this way, we get the Access Class, and then merge it with the CANOPUS 5 levels of classification summary into one table, and acquire PPCP of those classes as classification annotation (Class-anno).  

&ensp;&ensp;
Thirdly, the FTAS matrix is computed to obtain the network file (TSV file) of the parent-chemical nebula. 
Remark that the scores of the raw FTAS matrix is not homogeneous[@2012b], as reflected by the case that the fragmentation trees built from the MS/MS spectrum of each feature, even if aligned with themselves, have inconsistent scores owing to the dissimilar depth and branches of the distinct fragmentation trees.
Therefore, normalization is performed.
To enable the NFTAS scores to be utilized as the mapping of the MS/MS similarity for the edges in network, as the cosine similarity adoped by GNPS[@2020b], we let each FTAS score, derived from two fragmentation trees, be divided by its own FTAS score, respectively.
The average of the two is taken as the NFTAS.
Overall, the normalization of the matrix is:

$$
M_{raw}
\left[
\begin{matrix}
r_{1,1} & r_{1,2} & r_{1,3} & \cdots & r_{1,b} \\
r_{2,1} & r_{2,2} & r_{2,3} & \cdots & r_{2,b} \\
r_{3,1} & r_{3,2} & r_{3,3} & \cdots & r_{3,b} \\
\vdots & \vdots & \vdots & \ddots & \vdots \\
r_{a,1} & r_{a,2} & r_{a,3} & \cdots & r_{a,3} 
\end{matrix} \right]
\rightarrow
M_{norm}
\left[
\begin{matrix}
n_{1,1} & n_{1,2} & n_{1,3} & \cdots & n_{1,b} \\
n_{2,1} & n_{2,2} & n_{2,3} & \cdots & n_{2,b} \\
n_{3,1} & n_{3,2} & n_{3,3} & \cdots & n_{3,b} \\
\vdots & \vdots & \vdots & \ddots & \vdots \\
n_{a,1} & n_{a,2} & n_{a,3} & \cdots & n_{a,3} 
\end{matrix} \right]
$$

In general, a = b.
Then the algorithm is:

$$
n_{x,y}=\frac{1}{2}(\frac{r_{x,y}}{r_{x,x}} + \frac{r_{x,y}}{r_{y,y}})
$$

Next, we reformatted the matrix so that the output list can be easily visualized in R, Cytoscape, or other tools.
In this process, we set a limitition to filter the redundant data with lower NFTAS for visualization:

$$
L_{nftas}=x, x \in (0,1)
$$

To obtain more annotations, we also computed the m/z difference between the features corresponding to NFTAS.
These data are merged as network file (TSV file) of the parent-chemical nebula (Parent-Nebula).

 $\min \limits_{w_1} f\left(w_1\right)$

 $\sum\limits_{i=1}^{l-1}k_{i}+1, \sum\limits_{i=1}^{l-1}k_{i}+2, \cdots , \sum\limits_{i=1}^{l-1}k_{i}+k_{l}$

&ensp;&ensp;
Fourthly, the Parent-Nebula is faceted as multi-chemical nebulae based on the filtered Acess Class in Class-anno.
In this case, we set two limitations to filter or pick the features for child-chemical nebulae.
What is known is that CSI:FingerID and CANOPUS are in the same vein, both relying on molecular fingerprints from established fragmentation tree to predict compounds.
However, the accuracy of some structures predicted by CSI:FingerID is occasionally quite low, and the prediction is based on molecular fingerprints, while the prediction of CANOPUS is also based on molecular fingerprints.
Therefore we assume that this molecular fingerprint may be uncredible, which implies that the PPCP possibly be uncredible as well.
Therefore we set a limitation to filter those features with above PPCP via Tanimoto similarity[@2015a;@1960], which implied the accuracy of CSI:FingerID structure prediction:

$$
L_{tani}=x, x \in (0,1)
$$

Then, PPCP of all features would be retrieved, once the PPCP reached the threashold, the feature would be added into the child-chemical nebula.
Thus, a limitation is set:

$$
L_{nebula,ppcp}=x, x \in (0,1)
$$

Of note, the same features possibly exist in various chemial nebula, as the compounds belong to multiple classes.
Afterwards, the number of features in all child-chemical nebulae were counted.
Remarkably, some classes are too extensive in scope, resulting in too many features with obscure characteristics in a chemical nebula, whereas some classes are too subtle, causing few features in a chemical nebula hence meaningless for cluster analysis.
Therefore, we set a feature number (n) limitation to filter those classes with too large or too subtle scope:

$$
L_{num}
\rightarrow
\begin{cases} 
L_{n1}\\
L_{n2}
\end{cases}
,0 \lt L_{n1} \lt n \lt L_{n2}
$$

The filtered classes termed Chem-Index.
Eventually, network files of multi-chemical nebulae are created (Child-Nebulae), based on Chem-Index and the features described above, as well as Parent-Nebula (edges were facet into Child-Nebulae).
The overview of MCnebula processing are described as following:  

+ Collate the structure of top score for each feature into a matrix
+ Collate the PPCP dataset and define Access Class for each feature
+ Compute NFTAS score matrix and reformat as network file of Parent-Nebula
+ Filter the Access Class and accordingly generate network files of Child-Nebulae

&ensp;&ensp;
All taken togather, the whole route of MCnebula algorithm involved feature detection of LC-MS, compound identification via SIRIUS, multi-chemicl nebula establishment via MCnebula processing and ultimately visualization (Fig. {@fig:route}{nolink=True}).
The MCnebula processing algorithm is implemented in a bash script that can be easily run on almost all kinds of Linux distributions, while Windows systems can be run by installing a subsystem, virtual system or creating a bash environment (such as via [Cygwin](https://cygwin.com/index.html)).
In addition, multi-chemical nebulae can be combined with other analytical tools for coanalysis.
For example, LC-MS feature detection results can be exported to GNPS for analysis using FBMN based tools, and the annotation files obtained can be easily merged into the multiple chemical nebula by the same feature ID via Cytoscape or R.

## **_E. ulmoides_ dataset**

&ensp;&ensp;
**Material and processing.**
*E. ulmoides* dried bark was obtained from company of ZheJiang ZuoLi Chinese Medical Pieces LTD.
Raw-Eucommia and Pro-Eucommia were prepared as following:
(1) Raw-Eucommia: take shreds or blocks of *E. ulmoides* dried bark, powedered and passed through 80-mesh sieves for further process.
(2) Pro-Eucommia: take shreds or blocks of *E. ulmoides* dried bark, spray with saline water (the amount of salt is 2% of *E. ulmoides*, add 10 fold of water to dissolve), and smother in airtight for 30 min.
Then, drying in oven at 60 °C.
The dried bark was baked at 140 °C for 60 min.
Finally, the baked bark was powedered and passed through 80-mesh sieves for further process.
The processing method is based on [previous studies of *E. ulmoides*](https://kns.cnki.net/kcms/detail/detail.aspx?dbcode=CMFD&dbname=CMFD2010&filename=2009261926.nh&uniplatform=NZKPT&v=eB_okyKBl8kMHWO8l06UbgM691ML_O30Sno-lTeirLsMbH29esrB7xavdUn1x4fO)[@2010b].  

&ensp;&ensp;
**Sample preparation**
Take 2 g of Raw-Eucommia powder and Pro-Eucommia powder, respectively, add 50 ml of methanol/water (1:1, v/v) followed by ultrasonic (20 kHz for 40 min).
After ultrasonic, the mixture was filtered to obtain filtrate and residue.
The residue was added with 50 ml of methanol/water (1:1, v/v) and extracted with ultrasonic (40 kHz, 250 W for 20 min) again.
The mixture was filtered.
Then, the filtrate of the two extracts was combined, the solvent was evaporated.
Add methanol/water (1:1, v/v) to redissolve and the volume was fixed to 5 ml.
Finally, the supernatant was obtained by centrifugation (12,000 r.p.m. for 10 min) for further LC−MS analysis.

&ensp;&ensp;
**LC–MS experiments.**
LC−MS analysis was performed using a Dionex Ultimate 3000 UHPLC system (Dionex, Germany) coupled with a high-resolution Fourier-transform mass spectrometer (Orbitrap Elite, Thermo Fisher Scientific, Germany) using a Waters Acquity HSS T3 column (1.8 μm, 100 mm $\times$ 2.1 mm, Waters Corporation, Milford, MA, USA).
Solvent A, formic acid/water (0.1:99, v/v), and solvent B, formic acid/acetonitrile (0.1:99, v/v), were used as the mobile phase.
The gradient profile for separation was as follows: 2% of solvent B at 0min, 5% of solvent B at 2 min, 15% of solvent B at 10 min, 25% of solvent B at 15 min, 50% of solvent B at 18 min, 100% of solvent B at23 min, 2% of solvent B at 25 min, and 2% of solvent B at 30 min.
The flow rate was 0.3 mL/min.
The column temperature was set at 40°C.
Mass spectrometric analysis was performed using an Orbitrap Elite instrument equipped with an ESI source (Thermo FisherScientific, Germany) that operated in the negtive ionization mode.
The ESI source was operated at 50 °C with a capillary temperature of 275 °C, an ionization voltage of 3.5 kV, and a sheathgas flow rate of 35 L/min.
The survey scans were obtained in the Orbitrap mass analyzer operating at a 120,000 (full width at half-maximum) resolving power.
A mass range of 100−1500 m/z and a normalized collision energy of 30 eV were used for survey scans.
The analysis method was set to analyze the top 10 most intense ions from the survey scan, and a dynamic exclusion was enabled for 15 s.

## **Fecal metabolites dataset**

&ensp;&ensp;
**Material and methods.**
The *E. ulmoides* dried bark for treatment was purchased from ZheJiang Chinese Medical University Medical Pieces LTD (ZheJiang, China).
Raw-Eucommia and Pro-Eucommia for treatment were prepared as following:
(1) Raw-Eucommia: take shreds or blocks of *E. ulmoides* dried bark, powedered and passed through 65-mesh sieves.
(2) Pro-Eucommia: take shreds or blocks of *E. ulmoides* dried bark, spray with saline water (the amount of salt is 2% of *E. ulmoides*, add 10 fold of water to dissolve), and smother in airtight for 30 min.
Then, drying in oven at 60 °C.
The dried bark was stir-fried with slow fire, until the Gutta-Percha broken and the surface was burnt black[@2020n].
The fried bark was powedered and passed through 65-mesh sieves.
After the Raw-Eucommia and Pro-Eucommia powder were available, eflux extraction were performed with ethanol/water (70:30, v/v, tenfold of the powder) for 90 min and followed by filtration, respectively.
The residues were extracted (eflux extraction) with water for 90 min and filtered.
The two-time extraction filtrate were merged, dried by reduced pressure distillation and lyophilization, then stored in -80 °C for animals treatment.

&ensp;&ensp;
**Experimental model.**
The Sprague Dawley (SD) rats weighing 160–180 g were purchased from Qing Long Shan Dong Wu Fan Zhi Zhang (JiangSu, China), and originated from Hangzhou Medical College (ZheJiang, China).
The animals were randomly divided into the control group, the model group, positive-drug group, Raw-Eucommia treated groups, Pro-Eucommia treated groups.
The treated groups were divided as high, medium and low dose groups as well.
All animals were housed in temperature- and humidity-controlled rooms under 12 h light/dark cycle.
The rat model (the model group, positive-drug group, treated group) of renal injury was established by intragastric adenine (mixed with 0.5% CMC-Na solution, 200 mg/kg/d ) (0.5% CMC-Na: 5g CMC-Na dissolved in 1000 ml water) administration for 4 weeks, whereas the rats in the control group were given vehicles for 0.5% CMC-Na[@2021m].
One hour after gavage of adenine, the rats were disposed as following:
(1) the control and model groups were given vehicles for 0.5% CMC-Na solution;
(2) the positive-drug group was given Losartan (5 mg/kg) soluted in 0.5% CMC-Na;
(3) the treated groups which involve high (20 g/kg), medium (10 g/kg) and low (5g/kg) dose groups were treated with Raw-Eucommia or Pro-Eucommia that soluted in 0.5% CMC-Na.
After 4 weeks, the feces were collected from all groups of rats.

&ensp;&ensp;
**Sample preparation and extraction.**
For each groups, the rat feces (100 mg) were extracted with methanol/water (7:3, v/v) solution (1 mL) containing cholic acid-d4 (2 ppm) as internal standards. After 30 min homogenization using a ultrasonicator (250 W, 40 kHz), the extracts were centrifuged at 12,000 r.p.m. for 10 min at 4 °C and the supernatants were collected for LC-MS analysis.

&ensp;&ensp;
**LC–MS experiments.**
The samples were analyzed using a UPLC system (Waters) with a Quadruple TOF /MS interface equipped with an ESI source.
All analysis using Waters Acquity HSS T3 column (1.8 μm, 100 mm $\times$ 2.1 mm, Waters Corporation, Milford, MA, USA).
Mobile phases were A (0.1% formic acid, v/v) and B (0.1% formic acid, v/v), gradient elution: 0 - 2 min, 80% A; 2 - 12 min, 80 - 48% A; 12 - 18 min, 48 - 35% A, 18 - 22 min, 35 - 10% A; 22 - 26 min, 10 - 80% A; 26 - 30 min, 80% A.
The flow rate was 0.3 mL/min and the column temperature was 40 °C.
The Quadruple TOF/MS spectrometer operates in negative ion mode and the capillary voltage is 3.5 kV, source temperature is 100 °C, source offset is 80 °C, cone gas flow is 100 L/Hr, desolvation temperature is 500, cone gas flow is 1000 L/Hr, collision energy is 6 V.
A ramp of MS/MS collision energy was adopted (6 - 15 eV for low mass, 60 - 90 eV for high mass).
Isolation mass window for MS/MS is $\pm$ 0.5 Da.
Centroid data was collected for each sample in the mass range of 50 - 2000 Da.
The analysis method was set to analyze the top 5 most intense ions from the survey scan, and a dynamic exclusion was enabled for 10 s.

## **Data processing**
&ensp;&ensp;
Thermo MS (.RAW) were converted to m/z extensible markup language (mzML) in centroid mode using MSConvert ProteoWizard[@2011b;@2012d].
The mzML files were processed with MZmine2 (v.2.53) on Windows 10 1909 64-bits PC (intel Core i5-8300H, 2.30 GHz, 16Gb of RAM)[@2011b].
SIRIUS 4 and MCnebula bash script were excuted in Pop!_OS (Ubuntu) 20.10 LTS 64-bits PC (intel Core i7-1065G7, 1.3 GHz $\times$ 8, 16 Gb of RAM)[@2019b].
All visualization of MCnebula were performed in R version 4.1.0 in Pop!_OS (Ubuntu).
In addition, GNPS FBMN were performed for evaluation (Job for Fig. {@tbl:fbmn}{nolink=True}:
<https://gnps.ucsd.edu/ProteoSAFe/status.jsp?task=223d119fb9f44484902acfafc35704b6>; 
Job for Extended data Fig. {@tbl:gnps_mc}{nolink=True} and Extended data Fig. {@tbl:compare_cluster}{nolink=True}:
<https://gnps.ucsd.edu/ProteoSAFe/status.jsp?task=758e2a9de03a4ba5a6321a57ceeb174c>).

# **Code availability**

&ensp;&ensp;
All source code is publicly available under on GitHub at
<https://github.com/yellow-byte/MCnebula/tree/master>.
These involves
[MCnebula bash scripts](https://github.com/yellow-byte/MCnebula/blob/master/MCnebula_1.0.sh),
[visualization of parent-chemical nebulae](https://github.com/yellow-byte/MCnebula/blob/master/MCnebula_parent_nebula.R)
and
[visualization of multi-(child-)chemical nebulae](https://github.com/yellow-byte/MCnebula/blob/master/MCnebula_multi_nebulae.R).
In addition, we provide a demo code to visualize [Child-chemical nebula with compound 2D structure images (SVG) and PPCP annotations](https://github.com/yellow-byte/MCnebula/blob/master/MCnebula_child_nebula.R).
Here, the visualization of 2D structure images of compounds may be a key issue.
In our experience, Open Babel[@2011c], [rdkit](https://github.com/rdkit/rdkit) or other tools are capable of visualizing SMILES in batch, but [Molconvert](https://docs.chemaxon.com/display/docs/molconvert.md) seems better at addressing the issue of compound skeletons overlapping.

# **Discussion**

&ensp;&ensp;
To achieve fast analysis of complex chemical compositions, a new molecular network pattern was established.
We show the MCnebula algorithm integrating feature detection of LC-MS, *in silico* compound prediction, and optimized molecular network clustering and visualization.
After untargeted mass spectrometry dataset is processed via MCnebula workflow, the clustering performed in multi-chemical nebula with the multidimensional PPCP dataset shows the distribution characteristics of the main components of the complex composition in chemical taxonomy.
This multidimensional clustering enables the experimenter to zoom in and out of the analysis, i.e., from the overall complex chemistry to the local main chemistry in taxonomy, which greatly reduces the time exhausted in collating and generalizing when parsing large amounts of unknown compounds.
Above, is the optimization of multi-chemical nebulae as a new clustering network pattern to the current popular GNPS MN or FBMN.
We have demonstrated the drawback of the CS-MN-based monodimensional clustering algorithm for GNPS MN, i.e., similar structures frequently fail to achieve sufficient clustering, which prohibits effective propagation of annotation across complex chemical compositions.
As for this, MCnebula algorithm not only integrates current cutting-edge *in silico* prediction technology, i. e., SIRIUS compound identification, but also addresses the difficulty of applying the large amount of multidimensional data (mainly PPCP datasets) generated by the SIRIUS workflow.
Instead of discarding the MS/MS spectral similarity algorithm, we perform secondary clustering in the child-chemical nebula as a complement.
We also tried a new MS/MS spectral similarity algorithm, termed the NFTAS algorithm, with a view to address the low signal-to-noise ratio limitation that the CS-MN algorithm may encounter.

&ensp;&ensp;
While analyzing untargeted mass spectrometry data of complex chemical compositions (*E. ulmoides*), we found that only a few MS/MS spectra were able to obtain library matches.
What's more, COSMIC evaluates the results of these library matches with high confidence ($\geq$ 0.7) in only several[@2017].
Therefore, MCnebula integrates the results of molecular fingerprint-based database retrieval with CSI:FingerID, to facilitate the fast annotation of MS/MS spectrum.
In this study, we analyzed the chemical composition of *E. ulmoides* and rat fecal metabolome with *in silico* prediction.
We notice that CSI:FingerID was not determinable for many isomeric compounds and only evaluated the possibility by sorting.
Comparatively, when MCnebula has done phase I and phase II clustering, the structural similar compounds were clustered together and their structures were further inferred based on the network similar propagation.

&ensp;&ensp;
What we have not yet investigated in depth is the role of multi-chemical nebulae in the characterization of complex chemical compositions.
In the past decades, fingerprinting has been considered to provide a comprehensive view of the classes and quantities of chemical components contained in natural products, and thus provide an overall description and evaluation of them[@2013b].
Through high resolution separation techniques, metabolic profiling and metabolic fingerprinting applications can be addressed as well as pharmacodynamic and pharmacokinetic issues.
Nevertheless, the profile chromatograms or spectrums are abstract and elusive to human being.
Comparatively, multi-chemical nebulae provide an advanced visualization of compounds profiles which, in combination with LC-MS feature detection, highly refine the classes (as shown via Chem-Index) and quantities (peak area) of compounds in complex chemical compositions.
Nevertheless, MCnebula currently has limitations and is not yet as consistent as fingerprinting in characterizing chemical composition.
It is remarkable that MCnebula and SIRIUS have shared limitations, as most of the algorithm of MCnebulae based on SIRIUS prediction results.
As for [SIRIUS prerequisites](https://boecker-lab.github.io/docs.sirius.github.io/prerequisites/), high mass accuracy data is foremost and the mass deviation should be within 20 ppm. 
Additionally, SIRIUS supports only single charged ions up to now.
Chem-Index is expected to characterize the main classes of complex chemical compositions, however, the present acquisition algorithms are not sufficient to support its stability and systematicity to reach the level of indicators as fingerprinting.
More intelligent algorithms such as decision trees are needed to optimize the role of Chem-Index.
Despite this, the current multi-chemical nebulae are still able to preliminarily characterize the distribution of complex chemical compositions, as we have demonstrated with *E. ulmoides* or rat fecal metabolome datasets.

&ensp;&ensp;
In summary, the multi-chemical nebulae implemented by MCnebula algorithm is unrivaled by existing molecular network patterns in terms of the depth and dimensionality of clustering, while also characterizing main chemical classes and having the potential for MS/MS spectral noise filtering, leading to fast parsing of complex chemical compositions.

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
  
