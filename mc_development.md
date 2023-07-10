# MCnebula 

## 研究目标

&emsp;&emsp; 
开发一种快速的分析方法可以应用于基于质谱技术的代谢组学数据中，更加准确的鉴定更多化合物（结构解析），并将具有类似结构的化合物聚类，方便代谢通路的聚焦和分析。

## 需要解决的问题

1. 化合物鉴定主要基于SIRIUS 4 [@2019]，没有算法创新，能否在SIRIUS 4 基础上提高化合物鉴定准确度？
2. 聚类分析主要依赖CANOPUS [@2021a]，创新性不足。
3. 星云图涵盖信息量较大，可视化部分能否实现交互且能流畅运行？
4. 依赖R之外的数据预处理软件，能否整合分析流程?
5. 以面向对象编程形式使MCnebula 的R代码（或者其他平台）更严谨、更易于安装，适用于windows、mac、linux等多个平台。

## 审稿人意见

+ 欠缺算法上的创新性描述。

(The work appears to be a set of R code for data wrangling, i.e. formatting and reorganizing data from other tools, and for data visualization. How generalizable of the code is entirely unclear in the manuscript. The novelty of this work is not clearly described, because many functions discussed in the manuscript are provided by other tools. Is there any novel development of algorithms? If not, is there value in software engineering?)␛

+ 缺少对方法的科学评估。

("Evaluation" in this manuscript appears to be applications to experimental datasets, without describing what is evaluated. The authors show little academic standard in reporting a computational work. What is the statistical method and its justification in the visualization method? Testing significance in ontology is a mature topic - yet the authors offer no detail on the decision making within the code, and how it's related to prior work.)

+ 开发不成熟、不严谨。

(It is fine to write this as a software paper, even without real novelty in algorithms. The manuscript contains many good ideas, but not developed fully. The authors need to follow scientific conventions and standards to report the work. Visualization does not replace enrichment tests. Data analysis does not replace method evaluation.)

+ 方法依赖多，欠缺独立性。 

(On the one hand, an MCnebula user needs to have solid bioinformatic knowledge and the ability to use several data analyses. On the other hand, I think that this complex workflow will reduce the number of potential users. On the one hand, all the required tools could also be updated, and there will be the uncertainty of whether their outputs will continue to be useful.) 

# 内容概览

## 背景

&emsp;&emsp; 
代谢组学主要借助于质谱这一分析工具，检测样品中的成分为谱图信息，通过解析谱图，鉴定其成分的化学结构。

### 液相-串联质谱 (LC-MS/MS)

&emsp;&emsp; 
通过液相分离，使得样品中的复杂成分按照极性梯度依次流出，给予能量使其带有一定电荷，至质谱检测器检测得到一级质谱图（对应各个时间点）；按特定的需求的分离离子，给予更高能量将其轰碎，形成二级质谱图。质谱的分析鉴定主要依据二级质谱图(fragmentation spectra)信息（主要信息为各个碎片离子的质荷比m/z，信号强度Intensity），推测其化学成分结构。分析过程还依赖的信息有一级离子（即，二级碎片离子的来源）的m/z，Intensity。为了在区分极其相似的结构，还可以借助的信息：保留时间retention time (RT) （即该成分在液相条件下的流出时间）；在其他质谱分析模式还会有CCS信息等。  

&emsp;&emsp; 
以下主要讨论非靶向的液相串联质谱 (Untargeted LC-MS/MS)。该方法(untargeted LC-MS/MS)主要指在获取二级质谱图时，非选择性的分离并轰碎一级谱图中信号较强的离子（例如前十强离子）。借助该方法，在各个时间点（保留时间RT）都能获取对应成分的碎片离子信息，以此获取推断其化学结构。然而，由于数据量大，谱图复杂，化学结构上的多样性，质谱数据的分析鉴定具有挑战性。在鉴定准确度和化学结构识别的广度上难以有共同地突破性提高。

### 谱图的分析鉴定

&emsp;&emsp; 
一般地，通过LC-MS/MS 鉴定某一化合物可借助的信息有：

+ 该化合物的前体离子信息（precursor ion 或 parent ion），即该化合物在一级质谱图中的m/z和Intensity；
+ 该化合物的同位素离子信息。因为化学物质由元素组成，其组成元素包含同位素。因此质谱图中常见其同位素离子峰。借助于前提离子和同位素离子在一级质谱图呈现的信息，可一定程度推测该化学物质的元素组成，进而推断分子式。如水:H~2~O。
+ 该化合物的碎片离子信息，即二级质谱图信息。前体离子被轰成碎片离子，通过判断碎片离子的m/z 和Intensity，可推断其化学结构组成。碎片离子信息是LC-MS/MS 数据分析鉴定的主要信息来源。
+ 额外的，对于化合物的同分异构（位置异构或立体异构）复杂情况，借助于前体离子的流出时间，即保留时间RT，有可能帮助区分同分异构。这可能会是新的算法开发的突破点，也是难点。

### 谱图分析的复杂性

+ 不同仪器条件下，碎片离子的信号信号强度不同。
+ 仪器噪声影响，信噪比低。
+ m/z 数值偏移。如，某成分理论m/z 为 388.1982, 检测为388.2100，超过20 ppm 偏差。
+ 相似化学结构在碎片谱图上的相似性。大多发生在同分异构情况下。在此，位置异构的区分鉴定会是算法的难点和突破点。
+ ...

### 目前的主要鉴定方法

1. 光谱匹配 (spectral library match) 是主流的方法，同时也是准确度最高的方法。利用化学标准品获取的谱图信息，和样品中未知成分获取的谱图进行匹配。一般地，二级质谱图越是吻合，该未知成分为该化学标准品同一物质可能性最高。许多数据库建立了标准品或者已知成分的谱图信息的储备，用以促进质谱数据鉴定。然而相比于数十亿计的多样性化学结构，现有数据库可能仅涵盖了数万种唯一的成分（大多为商业性建立的）。

2. 和理论光谱图匹配。依据一定的规律，预测并建立一些化合物可能形成的碎片信息，将样品分析获取的成分的谱图与其匹配。

3. 机器学习、预测。通过机器学习的方法造模，并使用该模型预测谱图所示成分的化学结构。目前尖端的技术SIRIUS 工作流能够达到70% 的预测准确度。

## MCnebula 不足

&emsp;&emsp; 
MCnebula 依赖于多种既存的技术，通过将它们的分析数据整合、筛取、可视化，形成有助于生物学研究的形式。

### 核心依赖

&emsp;&emsp; 
SIRIUS 4 软件 [@2019] 是SIRIUS 鉴定工作流的集成 <https://bio.informatik.uni-jena.de/sirius/>，算法内容包含SIRIUS [@2009; @2011; @2015]，ZODIAC [@2020a]，CSI:fingerID [@2015a]，CANOPUS [@2021a] (以上为MCnebula 需借助的运算)，还包含COSMIC [@2021c]。  

&emsp;&emsp; 
SIRIUS 工作流是目前LC-MS/MS 机器预测的尖端技术，能够达到70% 准确度。MCnebula的聚类和分析都是在建立在其运算数据的基础上。因此，对SIRIUS 的预测技术的提高是算法创新的突破点。

### 其他依赖

&emsp;&emsp; 
在R之外，MCnebula 还要求对数据预处理。获取原始数据（.raw）后，数据经 Proteowizard [[@2012d]] 转换为.mzML 或者其他开源数据格式，随后还需要有MZmine2 [@2010] 或者类似的质谱数据处理工具处理后，再导至SIRIUS 4 以进一步分析。若能将各种工具集成于一个分析平台，降低使用门槛，将提高MCnebual的用户普及性。

### 算法提升

&emsp;&emsp; 
受限于技术，MCnebula 一些早期的设想被迫终止。这包括：

1. 借助聚类的结构候选项重排序。通过将同一类的化合物聚类（借助于CANOPUS 的类别预测数据，能够达到80 ~ 90% 化学分类聚类的准确度，比现有的其他方法聚类准确度高），依据一类化合物的结构相似性，通过将各个数据整合评分的形式，改变候选排名。
2. 借助于保留时间的候选项重排序。在SIRIUS 工作流中，保留时间RT 这一信息是未被利用的。通过集成RT 数据于机器学习预测，以期提高准确度。已有较优的研究报道RT 辅助质谱数据鉴定的应用 [@2020q]。

