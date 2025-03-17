# Untangling Urban Poverty in India

This project uses Unidimensional Consumption Expenditure Poverty measurement technique and Multidimensional Adjusted Headcount Ratio measurement technique between the two major cities in India, Delhi and Kolkata. The research reveals significant differences between the two cities, with Delhi generally showing better outcomes than Kolkata across multiple indicators. The study identifies particularly vulnerable subgroups including female-headed households, scheduled castes, and larger families. Based on these findings, targeted policy recommendations are proposed to address specific deprivations in each city. 

# A. Introduction 

Urban poverty is a pressing issue globally and has been a sensitive topic for international and national debates. Reports from the United Nations Development Program (UNDP) and the World Bank have constantly been at center stage for poverty dynamics and alleviation initiatives. The first Sustainable Development Goal (SDG) by the United Nations is the eradication of poverty in all forms around the world. In the case of India, the Ministry of Housing and Urban Affairs, Center for Policy Research, NITI Ayog, etc., have been frontiers working in poverty and deprivation assessments. The consumption expenditure data for 2022-23 revealed by the Ministry of Statistics and Programme Implementation suggests that the Headcount Poverty Ratio of $3.2 in India, declined from 53.6% to 20.8%, especially for the rural areas, which were boosted by public funding redistribution programs (Bhalla & Bhasin, 2024). 
Delhi, Mumbai, and Kolkata are fast-paced growing cities in India reflecting economic progress, transformation, and social development. Multidimensional poverty in India fell to 11.28% using the Alkire Foster Index among health, education, and living standard dimensions (NITI Ayog and UNDP, 2024). On the contrary, these three cities are also characterized by a substantial population of slum dwellers with poor living conditions. This project aims to analyze and compare slum dwellers of Delhi and Kolkata, their sub-group characteristics in terms of consumption expenditure poverty, and multidimensional poverty using an adjusted headcount ratio and make policy recommendations based on the outcomes. This case study focuses on Delhi and Kolkata, two metropolitan areas with substantial slum populations but different socioeconomic profiles, governance structures, and development trajectories.

# B. Problem Statement

India's major metropolitan centers represent paradoxical landscapes of economic progress and persistent urban poverty. While cities like Delhi, Mumbai, and Kolkata are engines of growth and development, they simultaneously house large slum populations living in precarious conditions. Despite national poverty reduction achievements, with multidimensional poverty falling to 11.28% according to NITI Aayog and UNDP (2024), slum communities continue to face severe deprivations.

This case study investigates two critical questions:

1. How do consumption expenditure poverty patterns differ between slum communities in Delhi and Kolkata, and across demographic subgroups?
2. What multidimensional deprivations characterize these urban poor populations, and how can targeted policies address specific vulnerabilities?

# C. Data Source

This analysis utilizes primary survey data collected from slum communities in Delhi and Kolkata during 2022-2023. The dataset contains 409 household observations after excluding Mumbai from the original three-city survey. 
 
-The Data is available as a Stata (.dta) file at: <a href="https://github.com/GauravvBhattarai/PovertyMeasurement/blob/main/Data.dta">Dataset</a>

The dataset includes household-level information on:
- Demographic characteristics (household size, gender of household head, religion, caste)
- Consumption expenditure
- Housing conditions (toilet facilities, water access, roof leakage)
- Asset ownership
- Educational attainment
- Healthcare access
- Financial inclusion indicators
- Access to government schemes and information

# D. Methodology

1. Unidimensional Consumption Expenditure Analysis

The study employs standard monetary poverty measurement techniques:
- Per capita expenditure is compared against a consumption poverty line of 1000 rupees
- Households below this threshold are identified as poor
- Poverty headcount ratio, gap measures, and squared gap calculations quantify incidence and depth
- Subgroup analysis examines variations by city, caste, religion, gender of household head, and household size
- Poverty incidence curves and Generalized Lorenz curves evaluate distributional dominance

2. Multidimensional Poverty Analysis

Following the Alkire-Foster methodology (2011), the study:
- Selects dimensions reflecting critical aspects of well-being: housing and infrastructure, health, education, and financial inclusion
- Includes eight specific indicators:
  
a. Housing quality (toilet facilities, water access, roof leakage)

b. Asset ownership

c. Educational attainment

d. Healthcare access

e. Banking facilities

f. Access to government scheme information

- Assigns differential weights to indicators (3/20 for health, education, water, and leakage; 1/10 for information, banking, assets, and sanitation)
- Sets a multidimensional deprivation threshold at 33% of weighted indicators
- Calculates adjusted headcount ratio, standard headcount ratio, and intensity of deprivation
- Conducts sensitivity analysis across different cut-off points (10% to 100%)
- Performs decomposition analysis by indicator and subgroup

# B. Unidimentional Consumption Expenditure Poverty

This unidimensional measure of poverty identifies the poor population given the poverty line. This report uses per capita expenditure against the consumption poverty line.  

Table: Summary Statistics for Consumption Expenditure Poverty

![image](https://github.com/user-attachments/assets/d0c98558-1b88-4619-8465-17049e2a392b)

Households having expenditures below the consumption poverty line of 1000 are identified as poor. 409 observations are only included after dropping Mumbai in the analysis, and household weight is generated by multiplying the sampling weight with household size. Table 1 summarizes all of the Stata outputs for consumption expenditure poverty analysis. 20.11% of the population in Delhi and Kolkata are identified as poor using the mentioned criteria. The normalized poverty gap for people identified as poor is 3.46% on average, i.e., the shortfall of expenditure compared to the poverty line. The weighted average of normalized income shortfall, the square gap is 0.0086 reflecting the sensitivity shortfall of the poverty gaps. 
Subgroup analysis of the identified poor based on city shows higher consumption expenditure poverty in Kolkata with 25.85% compared to 14.04% of Delhi. General caste has 18.96% of the population identified as poor compared to the 23% rate in backward caste groups. Muslim population in both the cities is based on consumption poverty line with 23.48% of Muslims identified as poor while Hindus mark 18.87% only. 30.42% of the population in female-headed households are identified as poor. Only 7.2% of households with 2 members are identified as poor while 63.41% of households with 13 members are identified to be poor. Economies of scale, resource constraints, unemployment, overcrowding, etc., might be a few reasons larger households show higher average estimates.

Figure: Poverty Incidence Curve

![image](https://github.com/user-attachments/assets/75e02bd5-09e6-4d61-9b2d-3e32b0533342)

For dominance and unanimity, the poverty incidence curve, i.e., cumulative distribution function (CDF) is plotted. Subgroup variables according to the city are created based on their CDF values to dissect the distribution of consumption poverty. Per-capita expenditure and proportion of people are represented by the x-axis and y-axis respectively in Figure 1. The figure also shows that the first-order stochastic dominance (FSD) does not hold because the curves intersect. It is difficult to conclude if one distribution dominates the other, thus judgment will be made based on selected income standards and the GL curve. 

Figure: Generalized Lorenz Curve

![image](https://github.com/user-attachments/assets/91f709c5-2fda-4790-ab40-0d1eaf0151bd)

The Generalized Lorenz curve shows the cumulative proportion of per-capita consumption expenditure on the y-axis against the cumulative proportion of slum dwellers in Delhi and Kolkata on the x-axis. The income inequality is presented in Figure 2. Delhi has greater welfare compared to Kolkata as the distribution is skewed towards higher consumption expenditure households. GL curve helps the part of dominance analysis to conclude, i.e., Kolkata has more monetary poverty compared to Delhi.

# C. MULTIDIMENSIONAL POVERTY- ADJUSTED HEADCOUNT RATIO

Analyzing poverty in multiple dimensions considers several deprivations at the same time, which reflects individual non-monetary aspects of life. Dimensions for this report include housing and infrastructure, health, education, and financial inclusion. These variables are suitable, have reliable scales, and influence the social well-being and living conditions of people. Variables like toilet and water concern physical health and well-being, while the leak variable shows an individual's sensitivity towards environmental hazards. Asset variable shows financial and economic stability. Education is important in development, empowerment, and increased likelihood of a better future while access to healthcare services implies well-being, improved life expectancy, and quality of life. Banking facilities denote financial security, benefits, and awareness while access to government scheme information allows households to utilize services and make informed decisions. Weights can be decided arbitrarily, with more weight on important indicators (Decancq & Lugo, 2013). Heath, education, water, and leak variables are given a weight of 3/20 while information, bank, asset, and toilet are given a weight of 1/10. Weights are assigned considering the vulnerability households might encounter. Assigning 1/10 weights is justified due to the variable’s role in attaining basic & futuristic needs, while 3/10 weights associate secondary human development aspects of life or the survival game. This report relates to Seth & Bag's (2016) reference to the UN-HABITAT definition of slums in the selection of the preliminaries. 
A weighted deprivation matrix and a counting vector are created to check the total weighted deprivations. The average weighted deprivations among the 409 households in Delhi and Kolkata is 45.8%. According to the OPHI, a person can be categorized to be in poverty if deprived in 20-33% of weighted indicators or in severe poverty if deprived in 50-100% of indicators (Oxford Poverty and Human Development Initiative [OPHI], 2023). According to Alkire & Foster (2011), the choice of k can be a normative decision, thus, this report will employ the same deprivation cut-off of 33% going further. Households deprived in 33% of weighted indicators or more are identified as poor. Only 89 households are not identified as poor among the 409. The adjusted headcount ratio is then calculated as an average of censored weighted deprivations scores. 

Table: Multidimensional Poverty Measures

![image](https://github.com/user-attachments/assets/a1f00c5c-2c15-4c79-bfc0-1bc78c979f43)

The adjusted headcount ratio is 41.14% which represents the proportion of slum dwellers living in poverty given the threshold level of being deprived in 33% or more of the weighted indicators. In contrast, according to the headcount ratio, 78.36% of the population in Delhi and Kolkata are multidimensionally poor in the given threshold as shown in Table 2. Among the identified group of the poor, the average intensity of deprivations of given indicators is 52.50% reflecting the severity and depth of deprivations. The absolute and relative contribution of the censored headcount ratio to adjusted headcount given the threshold is analyzed. Results indicate the roof leak variable as a key contributor in absolute and relative terms with 9.09% and 22.10% contribution respectively. 

Figure: Subgroup Decomposition

![image](https://github.com/user-attachments/assets/113ee319-bd8f-4297-b117-2f57d45a85c5)

National-level analysis shows variation between Delhi and Kolkata, especially for toilet and water variables, considering censored headcount ratios. Regarding the multidimensional headcount ratio, Delhi stands at 77.77% while Kolkata stands at 78.91%. The intensity of poverty scores shows 51.53% for Delhi and 53.41% for Kolkata. All of these numbers point to Delhi having less poverty compared to Kolkata. Figure 3 presents the adjusted headcount ratio for all the subgroups provided in the dataset. It can be seen that slum dwellers in Kolkata are more exposed to multiple deprivations compared to Delhi. Scheduled class, households following Hinduism, female-headed households, and a single-person household are deprived in multiple indicators compared to their counterpart groups.
Major outcomes of subgroup analysis by cities show that 78.93% of Kolkata slum dwellers identified as poor are deprived of safe drinking water while the number is only 55.19% in the case of Delhi. Only in terms of education, 39.84% of identified poor are deprived in Kolkata whereas 44.82% are deprived in Delhi. 45% of the scheduled classes, 43% of Hindu, and almost 50% of female-headed households are deprived in multiple indicators in Kolkata compared to lesser numbers in Delhi. Kolkata’s absolute and relative contribution to overall poverty in the water indicator is 78.92% and 58.9% while Delhi's is 55.19% and 41.1% respectively. Similarly, for absolute and relative contributors to poverty in the education variable, 39.84% and 47.1% for Kolkata & 44.82% and 52.9% for Delhi respectively. 

Table: Various k cut-off points

![image](https://github.com/user-attachments/assets/bf015097-535e-44e2-b8f3-a356b6f23682)

Lastly, dominance analysis is conducted considering various cut-off points starting from 10 to 100 with gaps of 10. The outcomes show the proportion of slum dwellers identified as poor for each k cut-off. As the cut-off increases, the number of households decreases. Dominance analysis of the adjusted headcount ratio as summarized in Table 3 shows the average level of deprivations among the identified poor people at various cut-offs. At a cut-off of 10, 98.2% are identified as poor, 44.1% at 50, and only 0.25% at 100. Standard error tests are executed in a 95% confidence interval to ensure the survey reflects true variability within the population and ensures account of complex survey designs and methods. Survey-specific standard error due to random sampling is 2.71% which is significantly low.

# D. Conclusion and Policy Recommendations

It can be concluded that Delhi ranks comparatively better than Kolkata in monetary standard of living and multidimensional poverty. In most of the selected indicators, slum dwellers in Kolkata face more deprivations. The dominance analysis shows that Delhi enjoys better welfare compared to Kolkata. Both cities exhibit similar trends in adjusted headcount ratios, with some subgroups like scheduled caste, female-headed, and higher-member households experiencing higher deprivations in sensitive indicators like water & sanitation in Kolkata. 
To recommend the state governments for the improvement of urban slums’ economic mobility and development, the deprivation cut-off of 33% gives a holistic and focused view of policy interference and extends resources to the root cause of poverty. The inclusion of data-driven private sector interventions through Public-private partnership (PPP) in non-monetary standards of living like Education in Delhi (upgrade/expansion of schools, scholarships, early childhood education) and water & sanitation infrastructures (distribution of water filters, leak repair programs, smart water management technology) in Kolata can help vulnerable groups. Partnerships with local NGOs, businesses, and leaders will ensure involvement and sustainability, which assist such initiatives for capacity building and skills development, inclusivity, and empowerment programs that can create awareness among slum dwellers. 
Targeted food and utility subsidy-based schemes/plans for slum dwellers in Kolkata, especially female-headed households with more than 3 members and scheduled caste, social safe nets (increased security benefits, child support, welfare schemes) or Conditional cash transfers (CCTs) should be introduced. Integrated policy approach prioritizing income-generating activities, vocational training, entrepreneurship support, mobile clinics, microfinance (empower female-led households and marginalized communities), mobile banking solutions through the use of digital platforms and technology (for training, job matching, and access to financial services) will reduce disparity and uplift living standards of slum dwellers in both cities. Initiatives in India like the National Food Security Act, National Rural Livelihood Mission-Aajeevika, etc., can improve tracking mechanisms for alleviation efforts to ensure all the policy recommendations suggested succeed. 

# E. References

Alkire, S., & Foster, J. (2011). Counting and multidimensional poverty measurement. Journal of Public Economics, 95(7–8), 476–487. https://doi.org/10.1016/j.jpubeco.2010.11.006
Bhalla, S. S., & Bhasin, K. (2024). India eliminates extreme poverty. Brookings.
Decancq, K., & Lugo, M. A. (2013). Weights in Multidimensional Indices of Wellbeing: An Overview. Econometric Reviews, 32(1), 7–34. https://doi.org/10.1080/07474938.2012.690641
NITI Aayog and UNDP. (2024). Multidimensional Poverty in India since 2005-06. Discussion Paper.
Oxford Poverty and Human Development Initiative (OPHI). (2023). Global MPI Country Briefing 2023: India (South Asia). Queen Elizabeth House, University of Oxford. Retrieved from https://ophi.org.uk
Seth, S., & Bag, S. (2016). UNDERSTANDING STANDARD OF LIVING AND CORRELATES IN SLUMS: AN ANALYSIS USING MONETARY VERSUS MULTIDIMENSIONAL APPROACHES IN THREE INDIAN CITIES SUGATA BAG Understanding Standard of Living and Correlates in Slums: An Analysis using Monetary Versus Multidimensional Approaches in Three Indian Cities.
