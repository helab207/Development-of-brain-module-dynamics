## Data:
1. Basic information of functional MRI scans, including participant ID, age, sex, and head motion parameter
   - Info_adults.mat
   - Info_children.mat

Note: Resting-state functional MRI (rsfMRI) data of all participants are obtained from the Children School Functions and Brain Development project (CBD, Beijing Cohort). Basic information is present in a tabular form. In the third column, ‘0’ and ‘1’ denote female and male, respectively. Since some of the children underwent repeated rsfMRI scans, their ID labels are repeated in the tables according to the scanning order. meanFD, mean framewise displacement.

2. Random parcellations for children and adults
   - Gray_mask_1024_adults.nii
   - Gray_mask_1024_children.nii
   
Note: To make a regional-level comparison between children and adults, the parcellation scheme for the adults was obtained by spatially transforming the random-1024 parcellation scheme from the children’s custom space to the MNI space. 

3. Regional time series of children and adults
   - MTC_adults.mat
   - MTC_children.mat
   
4. Regional modular variability of children and adults
   - Modular_variability_adults.mat
   - Modular_variability_children.mat
