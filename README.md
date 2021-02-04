## Data
1. Basic information of functional MRI scans, including participant ID, age, sex, and head motion parameter
   - Info_adults.mat
   - Info_children.mat

> Note: Resting-state functional MRI (rsfMRI) data of all participants are obtained from the Children School Functions and Brain Development project (CBD, Beijing Cohort).  Basic information is present in a tabular form. In the third column, ‘0’ and ‘1’ denote female and male, respectively. Since some of the children underwent repeated rsfMRI scans, their ID labels are repeated in the tables according to the scanning order. meanFD, mean framewise displacement.

2. Random parcellations for children and adults
   - Gray_mask_1024_adults.nii
   - Gray_mask_1024_children.nii
   
> Note: To make a regional-level comparison between children and adults, the parcellation scheme for the adults was obtained by spatially transforming the random-1024 parcellation scheme from the children’s custom space to the MNI space. 

3. Regional time series of children and adults
   - MTC_adults.mat(≈100MB, https://drive.google.com/file/d/16Hns-lh9kOfIQgVa4L1H5GVOyRvVQehr/view?usp=sharing)
   - MTC_children.mat(≈700MB, https://drive.google.com/file/d/12R9zwEJXAo5zU3YBLZqmsYPO9sG8pVfy/view?usp=sharing)
   
4. Regional modular variability of children and adults
   - Modular_variability_adults.mat
   - Modular_variability_children.mat

## Codes
1.	Multilayer community detection 

> The time-resolved modular architecture was detected using an open MATLAB code package (http://netwiki.amath.unc.edu/GenLouvain/GenLouvain) [1] .

2.	Modular variability [2]
   - Scaled_inclusivity_wei.m
   - Scaled_inclusivity.m
   - Ami.m
   
3.	Global efficiency and local efficiency 

> Global efficiency and local efficiency were estimated using the GRETNA package (http://www.nitrc.org/projects/gretna) [3].
   - Gretna_node_global_efficiency.m
   - Gretna_node_local_efficiency.m
   
4.	Mixed effect model
   - Mixed_model.m
   
5.	Mediation effect analysis 
> The mediation analysis was performed using PROCESS plug-in in SPSS [4].

6.	Preprocessing of gene expression data
Gene expression data were pre-processed by referencing a publicly available code (https://github.com/BMHLab/AHBAprocessing) [5].

7.	Gene ontology annotation analysis
> Gene ontology annotation was conducted using ToppGene Suite (https://toppgene.cchmc.org/) [6].

## References
1.	Jeub LGS, Bazzi M, Jutla IS, Mucha PJ. A generalized Louvain method for community detection implemented in MATLAB. Version 2.1 [software]. 2012 [updated 2016 Nov; cited 2021 Jan 2]. Available from: http://netwiki.amath.unc.edu/GenLouvain.
2.	Liao X, Cao M, Xia M, He Y. Individual differences and time-varying features of modular brain architecture. Neuroimage. 2017;152:94-107.
3.	Wang J, Wang X, Xia M, Liao X, Evans A, He Y. GRETNA: a graph theoretical network analysis toolbox for imaging connectomics. Front Hum Neurosci. 2015;9:386.
4.	Preacher KJ, Hayes AF. Asymptotic and resampling strategies for assessing and comparing indirect effects in multiple mediator models. Behav Res Methods. 2008;40(3):879-91.
5.	Arnatkevičiūtė A, Fulcher BD, Fornito A. A practical guide to linking brain-wide gene expression and neuroimaging data. Neuroimage. 2019;189:353-67.
6.	Chen J, Bardes EE, Aronow BJ, Jegga AG. ToppGene Suite for gene list enrichment analysis and candidate gene prioritization. Nucleic Acids Res. 2009;37(suppl_2):W305-W11.


