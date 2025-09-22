Malaria Prevalence Analysis: PCR vs Microscopy

Project Overview
-Adoption of molecular techniques such as PCR to detect Plasmodium falciparum infection has revealed many previously undetected but transmissible low-density (submicroscopic) infections.  
-This project uses a dataset from a systematic review to compare malaria prevalence as measured by microscopy and PCR across different global regions.

Dataset
-The dataset was sourced from:
[HackBio Internship Public Datasets](https://raw.githubusercontent.com/HackBio-Internship/public_datasets/main/R/lancet_malaria.txt)

 Data Dictionary
- PCR.N.Tested: Total number of cases tested by PCR  
- PCR.N.Positive: Number of PCR positive cases  
- X..PCR..Positive: Percentage positive by PCR  
- Microscopy.N.Tested: Total number of cases tested by microscopy  
- Microscopy.N.Positive: Number of microscopy positive cases  
- X..Microscopy..Positive: Percentage positive by microscopy  
- Region[: Global malaria region (Asia and Oceania, West Africa, East Africa, South America)

Data Cleaning
- Replaced missing values (`NA`) with `0` for numeric columns  
- Retained rows with categorical missing values (non-numeric)

Tasks Performed
1. Visualized % PCR vs % Microscopy  
   - Scatterplots with 1:1 reference line.  

2. Calculated Prevalence Ratio
   

3. Regional Analysis
   - Split scatterplots into 4 panels: Asia & Oceania, West Africa, East Africa, South America.  
   - Added 1:1 dotted line for reference.  

4. Boxplot of Prevalence Ratio by Region
   - Compared prevalence ratios across regions.  
   - Added reference line at ratio = 1.
   - 

- Scatterplots show PCR detects more infections than microscopy, especially at low prevalence levels.  
- Boxplot indicates that regions differ in submicroscopic infection burden.  
- Preliminary interpretation:  
  - Regions with prevalence ratio < 1 indicate higher density of submicroscopic infections (PCR detects more cases than microscopy).
  - Among the four, South America seems to have the highest density of submicroscopic infections.

Lillian Mwinja
  - Among the four, South America appears to have the highest density of submicroscopic infections.

