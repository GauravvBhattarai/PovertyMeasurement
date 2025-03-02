use "D:\Sample dataset.dta" 
gen hhweight = weight*hh_size
drop if city==3

gen sample = (dp1_toilet~=. & dp1_water~=. & dp1_leak~=. & dp1_asset~=. & dp1_education~=. & dp1_health~=. & dp1_bank~=. & dp1_inf~=.)
sum dp1_toilet dp1_water dp1_leak dp1_asset dp1_education dp1_health dp1_bank dp1_inf [aw=hhweight] if sample==1
mdesc dp1_toilet dp1_water dp1_leak dp1_asset dp1_education dp1_health dp1_bank dp1_inf
foreach var in dp1_toilet dp1_water dp1_leak dp1_asset dp1_education dp1_health dp1_bank dp1_inf {
sum `var' [iw = hhweight] 
gen uncen_H_`var' = r(mean)*100 
lab var uncen_H_`var' "Uncensored Headcount Ratio: Percentage of people who are deprived in `var'" 
} 
foreach var in dp1_toilet dp1_asset dp1_bank dp1_inf { 
gen w_`var' = 1/10
lab var w_`var' "Weight `var'"
}
foreach var in dp1_water dp1_leak dp1_education dp1_health { 
gen w_`var' = 3/20
lab var w_`var' "Weight `var'"
}
foreach var in dp1_toilet dp1_water dp1_leak dp1_asset dp1_education dp1_health dp1_bank dp1_inf { 
gen g0_w_`var' = `var' * w_`var' 
lab var g0_w_`var' "Weigthed Deprivation of `var'"
}
egen c_vector = rowtotal(g0_w_*) 
lab var c_vector "Counting Vector" 
tab c_vector [aw = hhweight], m

local k = 33
gen identity_poor_`k' = (c_vector >= `k'/100)
label var identity_poor_`k' "Poor if deprived in `k'% or more of weighted indicators"

local k = 33
gen cens_c_vector_`k' = identity_poor_`k'*c_vector 
label var cens_c_vector_`k' "Censored deprivation scores for k=`k'%"
sum cens_c_vector_`k' [aw = hhweight] 
gen M0_`k' = r(mean) 
lab var M0_`k' "Adjusted Headcount Ratio (M0): Range 0 to 1 for k=`k'%"

local k = 33
sum identity_poor_`k' [aw = hhweight] 
gen H_`k' = r(mean)*100 
lab var H_`k' "Headcount Ratio (H): % Population in multidimensional poverty for k=`k'%"

local k = 33
sum cens_c_vector_`k' [aw = hhweight] if identity_poor_`k'==1 
gen A_`k' = r(mean)*100 
lab var A_`k' "Intensity of deprivation among the poor (A): Average % of weighted deprivations for k=`k'%"

local k = 33
foreach var in dp1_toilet dp1_water dp1_leak dp1_asset dp1_education dp1_health dp1_bank dp1_inf { 
gen cen_H_`k'_`var' = identity_poor_`k'*`var'
lab var cen_H_`k'_`var' "Censored Headcount Ratio: % of people who are poor and deprived in `var' k=`k'%"
} 
sum dp1_* cen_H_* [aw = hhweight], sep(15) 

local k = 33
foreach var in dp1_toilet dp1_water dp1_leak dp1_asset dp1_education dp1_health dp1_bank dp1_inf { 
gen abs_cont_`var'_`k' = cen_H_`k'_`var' * w_`var' 
lab var abs_cont_`var'_`k' "Absolute contribution to M0 of `var' for k=_`k'%" 
gen perc_cont_`var'_`k' = (cen_H_`k'_`var' * w_`var') / M0_`k' 
lab var perc_cont_`var'_`k' "Percentage contribution to M0 of _`var' for k=_`k'%" 
} 
sum abs_cont_* [aw = hhweight], sep(15) 
sum perc_cont_* [aw = hhweight], sep(15)


rename city city_original 
decode city_original, gen(temp) 
gsort city_original, gen(city) 
labmask city, values(temp)


tabstat dp1_* [aw = hhweight], by(city)

local k = 33
tabstat cens_c_vector_`k' [aw = hhweight], by(city)
tabstat cens_c_vector_`k' [aw = hhweight], by(caste)
tabstat cens_c_vector_`k' [aw = hhweight], by(religion)
tabstat cens_c_vector_`k' [aw = hhweight], by(female_headed)
tabstat cens_c_vector_`k' [aw = hhweight], by(hh_size)

local k = 33
tabstat identity_poor_`k' [aw = hhweight], by(city)

local k = 33
tabstat cens_c_vector_`k' [aw = hhweight] if identity_poor_`k'==1, by(city) 

local k = 33
foreach var in dp1_toilet dp1_water dp1_leak dp1_asset dp1_education dp1_health dp1_bank dp1_inf { 
forvalues r = 1/2 { 
 sum cen_H_`k'_`var' [aw = hhweight] if city==`r' 
 gen cen_H_r`r'_`k'_`var' = r(mean) 
 lab var cen_H_r`r'_`k'_`var' "Censored Headcount Ratio - region `r'" 
 } 
} 
sum cen_H_r* [aw = hhweight], sep(6) 

local k = 33 
forvalues r = 1/2 { 
foreach var in dp1_toilet dp1_water dp1_leak dp1_asset dp1_education dp1_health dp1_bank dp1_inf { 
 sum cens_c_vector_`k' [aw = hhweight] if city==`r' 
 local M0_r`r'_`k' = r(mean) 
  gen abs_cont_r`r'_`k'_`var' = cen_H_r`r'_`k'_`var' * w_`var' 
 lab var abs_cont_r`r'_`k'_`var' "Absolute contribution to M0 - city `r'" 
 gen perc_cont_r`r'_`k'_`var' = (cen_H_r`r'_`k'_`var' * w_`var') / `M0_r`r'_`k'' 
 lab var perc_cont_r`r'_`k'_`var' "Percentage contribution to M0 - city `r'" 
 } 
} 
sum abs_cont_r* [aw = hhweight], sep(4) 
sum perc_cont_r* [aw = hhweight], sep(4) 

save "D:\Leeds\Econ & Finance MSc\Semester 2\Distributional Analysis\ACW\Dta File\MyFirstMPI2.dta", replace 
collapse dp1_* w_* c_vector identity_poor_* cens_c_vector_* cen_H_* abs_cont_* perc_cont_* 
save "D:\Leeds\Econ & Finance MSc\Semester 2\Distributional Analysis\ACW\Dta File\Collapsed_results by region.dta", replace 

clear
use "D:\Leeds\Econ & Finance MSc\Semester 2\Distributional Analysis\ACW\Dta File\MyFirstMPI2.dta" 
tab c_vector [aw=hhweight] 

forvalues k = 10(10)100 { 
gen iden_poor_dom_`k' = (c_vector >= `k'/100)
label var iden_poor_dom_`k' "Poor if deprived in `k'% or more of weighted indicators"
} 

forvalues k = 10(10)100 { 
gen cens_c_vec_dom_`k' = iden_poor_dom_`k'*c_vector 
label var cens_c_vec_dom_`k' "Censored deprivation scores for k=`k'%"
}

sum iden_poor_dom* [aw = hhweight], sep(15)
sum cens_c_vec_dom* [aw = hhweight], sep(15)
forvalue k = 10(10)100 { 
sum cens_c_vec_dom_`k' if iden_poor_dom_`k'==1 [aw = hhweight], sep(15) 
}


svyset hh_id [pweight = hhweight], strata(city)
local k= 33
svy: mean identity_poor_`k' 
svy: mean cens_c_vector_`k'
local k = 33
svy: mean identity_poor_`k', over(city) coeflegend 
test _b[c.identity_poor_33@1bn.city]=_b[c.identity_poor_33@2.city] 

forvalues k = 10(10)100 { 
svy: mean iden_poor_dom_`k' 
gen se_H = (_se[iden_poor_dom_`k']) 
gen lb_H_`k' = _b[iden_poor_dom_`k'] - 1.96 * se_H 
gen ub_H_`k' = _b[iden_poor_dom_`k'] + 1.96 * se_H 
drop se_H 
} 
sum iden_poor_dom_* lb_H_* ub_H_*

forvalues k = 10(10)100 { 
svy: mean cens_c_vec_dom_`k' 
gen se_M0 = (_se[cens_c_vec_dom_`k']) 
gen lb_M0_`k' = _b[cens_c_vec_dom_`k'] - 1.96* se_M0 
gen ub_M0_`k' = _b[cens_c_vec_dom_`k'] + 1.96* se_M0 
drop se_M0 
} 
sum cens_c_vec_dom_* lb_M0_* ub_M0_*

forvalues k = 10(10)100 {
svy: mean iden_poor_dom_`k' cens_c_vec_dom_`k'
mat cov = e(V)
local cov = cov[2,1]
local var_H = cov[1,1]
local var_MPI = cov[2,2]
gen se_A_`k' = sqrt((`var_MPI'/_b[iden_poor_dom_`k']^2) + (((_b[cens_c_vec_dom_`k']/_b[iden_poor_dom_`k'])^2)*(`var_H')) - 2*((_b[cens_c_vec_dom_`k']/_b[iden_poor_dom_`k']^3)*`cov'))
gen lb_A_`k' = (_b[cens_c_vec_dom_`k']/_b[iden_poor_dom_`k']) - 1.96 * se_A_`k'
gen ub_A_`k' = (_b[cens_c_vec_dom_`k']/_b[iden_poor_dom_`k']) + 1.96 * se_A_`k'
drop se_A_`k'
}
