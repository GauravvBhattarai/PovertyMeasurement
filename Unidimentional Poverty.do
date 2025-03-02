use "D:\Sample dataset.dta" 
label list city
drop if city == 3
gen hhweight = weight*hh_size

gen identity_poor=(pc_exp<pov_line_con)
gen gap= identity_poor*((pov_line_con-pc_exp)/pc_exp)
gen sq_gap=gap^2
sum identity_poor [aw= hhweight]
sum gap [aw= hhweight]
sum sq_gap [aw= hhweight]
mean identity_poor [aw= hhweight], over(city)
mean identity_poor [aw= hhweight], over(caste)
mean identity_poor [aw= hhweight], over(religion)
mean identity_poor [aw= hhweight], over(female_headed)
mean identity_poor [aw= hhweight], over(hh_size)

local var = "pc_exp" 
cumul `var' [aw=hhweight], gen(m_`var') by(city) 
sort city `var' 
foreach i in 1 2 { 
gen m`i'_`var'=m_`var' if city==`i' 
format m`i'_`var' %3.1f 
} 
label var m1_`var' "Kolkata" 
label var m2_`var' "Delhi" 
line m1_`var' m2_`var' `var', xtitle("pc_exp", height(7) size(large)) /// 
 ytitle("Proportion of People", height(7) size(large)) legend(size(large) cols(3)) 
graph export "D:\Leeds\Econ & Finance MSc\Semester 2\Distributional Analysis\ACW\F_yr_`var'.png", replace 
twoway (line `var' m1_`var', xtitle("Percentile of Population", height(7) size(large)) /// 
 ytitle("pc_exp", height(7) size(large)) legend(label(1 "Kolkata") size(large) cols(3))) /// 
 (line `var' m2_`var', legend(label(2 "Delhi") size(large) cols(3))) 
graph export "D:\Leeds\Econ & Finance MSc\Semester 2\Distributional Analysis\ACW\Q_yr_`var'.png", replace 
drop m*_`var' 
glcurve pc_exp [aw=hhweight], by(city) split 
glcurve pc_exp [aw=hhweight], lorenz by(city) split