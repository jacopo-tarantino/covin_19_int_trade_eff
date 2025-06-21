*defining entity index and time index
xtset exports_code time

*defining interactio terms
gen vax_gdp_A =  vaxA*gdpA
gen vax_gdp_B =  vaxB*gdpB
gen average_debt_gdp_A = average_debtA*gdpA
gen average_debt_gdp_B = average_debtB*gdpB
gen average_support_gdp_A = average_supportA*gdpA
gen average_support_gdp_B = average_supportB*gdpB
gen average_cont_gdp_A = average_contA*gdpA
gen average_cont_gdp_B = average_contB*gdpB

*labeling and explaining variable used and the values they assume
label variable casesA "Monthly new cases per milion at time t in country A"
label variable casesB "Monthly new cases per milion at time t in country B"
label variable total_casesA "Total cases per milion at time t in country A"
label variable total_casesB "Total cases per milion at time t in country B"
label variable vaxA "Total people vaccinated per hundred at time t in country A"
label variable vaxB "Total people vaccinated per hundred at time t in country B"
label variable total_deathsA "Total deaths per milion at time t in country A"
label variable total_deathsB "Total deaths per milion at time t in country B"
label variable supportA "Governement of country A income support trough salary covers and direct cash payments to people who cannot work or have lost their job"
label variable supportB "Governement of country B income support trough salary covers and direct cash payments to people who cannot work or have lost their job"
label define supportA1 0 "No income support" 1 "Cover of less than 50% of salary lost" 2 "Cover of more than 50% of salary lost"
label values supportA supportA1
label define supportB1 0 "No income support" 1 "Cover of less than 50% of salary lost" 2 "Cover of more than 50% of salary lost"
label values supportB supportB1
label variable time "time index"
label variable rta "belonging of both country A and country B to the same Regional Trade Agreement"
label define rta1 0 "No" 1 "Yes"
label values rta rta1
label variable mortality_rate_A "Mortality rate of Covid-19 at time t for country A"
label variable mortality_rate_B "Mortality rate of Covid-19 at time t for country B"
label variable iso_d "Exporter country"
label variable iso_o "Importer country"
label variable icu_casesA "Total people that have been subjected to Intensive Care Unit in country A at time t"
label variable icu_casesB "Total people that have been subjected to Intensive Care Unit in country B at time t"
label variable gdpA "GDP per capita of country A"
label define gdpA1 0 "GDP < 300000$" 1 "GDP >= 300000$"
label values gdpA gdpA1
label variable gdpB "GDP per capita of country B"
label define gdpB1 0 "GDP < 300000$" 1 "GDP >= 300000$"
label values gdpB gdpB1
label variable facial_coveringsA "Face covering policies executed by governement A at time t "
label define facial_coveringsA1 0 "No policy" 1 "Recommended" 2 "Recquired in some public space" 3 "Recquired in all public spaces" 4 "Required outside-the-home at all times"
label values facial_coveringsA facial_coveringsA1
label variable facial_coveringsB "Face covering policies executed by governement B at time t "
label define facial_coveringsB1 0 "No policy" 1 "Recommended" 2 "Recquired in some public space" 3 "Recquired in all public spaces" 4 "Required outside-the-home at all times"
label values facial_coveringsB facial_coveringsB1
label variable exports_code "Entity index"
label variable distcap "Air-line distance beteween capitals of country A and of country B "
label variable debtA "Debt relief provided by governement A by freezing financial obligations at time t"
label define debtA1 0 "No relief" 1 "Narrow relief and contract specific" 2 "Broad relief involving semi totality of contracts"
label values debtA debtA1
label variable debtB "Debt relief provided by governement B by freezing financial obligations at time t"
label define debtB1 0 "No relief" 1 "Narrow relief and contract specific" 2 "Broad relief involving semi totality of contracts"
label values debtB debtB1
label variable contA "Composite measure of governement A policies' stringency  at time t"
label variable contB "Composite measure of governement B policies' stringency  at time t"
label variable exp "Bilateral exports"
label variable average_contA "Average Composite measure of governement A policies' stringency at time t on the last year"
label variable average_contB "Average composite measure of governement B policies' stringency at time t on the last year"
label variable average_debtA "Average debt relief provided by governement A by freezing financial obligations at time t on the last year"
label variable average_debtB "Average debt relief provided by governement B by freezing financial obligations at time t on the last year"
label variable average_supportA "Average governement of country A income support trough salary covers and direct cash payments to people who cannot work or have lost their job at time t on the last year "
label variable average_supportB "Average governement of country B income support trough salary covers and direct cash payments to people who cannot work or have lost their job at time t on the last year "
label variable average_facial_coveringsA "Average level of face covering policies executed by governement A at time t on the last year"
label variable average_facial_coveringsB "Average level of face covering policies executed by governement B at time t on the last year"

******REGRESSIONS*********

*only with mortality rate   *****TO INSERT*****
xtreg log_exp mortality_rate_A  mortality_rate_B,fe vce(cluster exports_code)

*mortality rate + vax       *****TO INSERT*****
xtreg log_exp mortality_rate_A mortality_rate_B vaxA vaxB,fe vce(cluster exports_code)
 
**mortality rate + vax + interaction with gdp     *****TO INSERT*****
xtreg log_exp mortality_rate_A mortality_rate_B vaxA vaxB vax_gdp_A vax_gdp_B,fe vce(cluster exports_code)

*mortality rate + vax + masks        *****TO INSERT*****
xtreg log_exp mortality_rate_A mortality_rate_B vaxA vaxB facial_coveringsA facial_coveringsB,fe vce(cluster exports_code)

*mortality rate + vax + debt relief
xtreg log_exp mortality_rate_A mortality_rate_B vaxA vaxB debtA debtB,fe vce(cluster exports_code)

*mortality rate + vax + masks + debt relief
xtreg log_exp mortality_rate_A mortality_rate_B vaxA vaxB facial_coveringsA facial_coveringsB debtA debtB ,fe vce(cluster exports_code)

*mortality rate + vax + support
xtreg log_exp mortality_rate_A mortality_rate_B vaxA vaxB supportA supportB,fe vce(cluster exports_code)

*mortality rate + vax + masks + support
xtreg log_exp mortality_rate_A mortality_rate_B vaxA vaxB facial_coveringsA facial_coveringsB supportA supportB,fe vce(cluster exports_code)

**mortality rate + vax + containment 
xtreg log_exp mortality_rate_A mortality_rate_B vaxA vaxB average_contA average_contB,fe vce(cluster exports_code)

**mortality rate + vax +  masks + containment 
xtreg log_exp mortality_rate_A mortality_rate_B vaxA vaxB facial_coveringsA facial_coveringsB contA contB,fe vce(cluster exports_code)

**mortality rate + vax +  masks + containment + debt relief 
xtreg log_exp mortality_rate_A mortality_rate_B vaxA vaxB facial_coveringsA facial_coveringsB contA contB debtA debtB,fe vce(cluster exports_code)

**mortality rate + vax +  masks + containment + support 
xtreg log_exp mortality_rate_A mortality_rate_B vaxA vaxB facial_coveringsA facial_coveringsB contA contB supportA supportB,fe vce(cluster exports_code)

**mortality rate + vax + masks (average of the past year)    *****TO INSERT*****
xtreg log_exp mortality_rate_A mortality_rate_B vaxA vaxB average_facial_coveringsA  average_facial_coveringsB,fe vce(cluster exports_code)

**mortality rate + vax + debt relief (average of the past year)
xtreg log_exp mortality_rate_A mortality_rate_B vaxA vaxB  average_debtA  average_debtB,fe vce(cluster exports_code)

**mortality rate + vax + masks + debt relief  (average of the past year).  *****TO INSERT*****
xtreg log_exp mortality_rate_A mortality_rate_B vaxA vaxB  average_facial_coveringsA  average_facial_coveringsB  average_debtA  average_debtB ,fe vce(cluster exports_code)

**mortality rate + vax + masks + debt relief + interactions debt with gdp (average of the past year).  *****TO INSERT*****
xtreg log_exp mortality_rate_A mortality_rate_B vaxA vaxB  average_facial_coveringsA  average_facial_coveringsB  average_debtA  average_debtB average_debt_gdp_A average_debt_gdp_B,fe vce(cluster exports_code) 

**mortality rate + vax + masks + debt relief + interactions debt and vax with gdp (average of the past year)
xtreg log_exp mortality_rate_A mortality_rate_B vaxA vaxB  vax_gdp_A vax_gdp_B average_facial_coveringsA  average_facial_coveringsB  average_debtA  average_debtB average_debt_gdp_A average_debt_gdp_B,fe vce(cluster exports_code) 

**mortality rate + vax + support (average of the past year)
xtreg log_exp mortality_rate_A mortality_rate_B vaxA vaxB  average_supportA  average_supportB,fe vce(cluster exports_code)

**mortality rate + vax + masks + support (average of the past year).   *****TO INSERT*****
xtreg log_exp mortality_rate_A mortality_rate_B vaxA vaxB  average_facial_coveringsA  average_facial_coveringsB  average_supportA average_supportB,fe vce(cluster exports_code)

**mortality rate + vax + masks + support + interaction support with gdp (average of the past year).   *****TO INSERT*****
xtreg log_exp mortality_rate_A mortality_rate_B vaxA vaxB  average_facial_coveringsA  average_facial_coveringsB  average_supportA average_supportB average_support_gdp_A average_support_gdp_B,fe vce(cluster exports_code)

**mortality rate + vax + masks + support + interaction support and vax with gdp (average of the past year)
xtreg log_exp mortality_rate_A mortality_rate_B vaxA vaxB vax_gdp_A vax_gdp_B  average_facial_coveringsA  average_facial_coveringsB  average_supportA average_supportB average_support_gdp_A average_support_gdp_B,fe vce(cluster exports_code)

**mortality rate + vax + containment  (average of the past year)
xtreg log_exp mortality_rate_A mortality_rate_B vaxA vaxB average_contA average_contB,fe vce(cluster exports_code)

**mortality rate + vax +  masks + containment (average of the past year).      *****TO INSERT*****
xtreg log_exp mortality_rate_A mortality_rate_B vaxA vaxB average_facial_coveringsA  average_facial_coveringsB average_contA average_contB,fe vce(cluster exports_code)

**mortality rate + vax +  masks + containment + interactions containment with gdp (average of the past year).    *****TO INSERT*****
xtreg log_exp mortality_rate_A mortality_rate_B vaxA vaxB average_facial_coveringsA  average_facial_coveringsB average_contA average_contB average_cont_gdp_A average_cont_gdp_B,fe vce(cluster exports_code)

**mortality rate + vax +  masks + containment + interactions containment and vax with gdp (average of the past year)
xtreg log_exp mortality_rate_A mortality_rate_B vaxA vaxB vax_gdp_A vax_gdp_B average_facial_coveringsA  average_facial_coveringsB average_contA average_contB average_cont_gdp_A verage_cont_gdp_B,fe vce(cluster exports_code)

**mortality rate + vax +  masks + containment + debt relief  (average of the past year)
xtreg log_exp mortality_rate_A mortality_rate_B vaxA vaxB average_facial_coveringsA  average_facial_coveringsB average_contA average_contB average_debtA average_debtB,fe vce(cluster exports_code)

**mortality rate + vax +  masks + containment + debt relief + interactions containment and debt with gdp (average of the past year)    *****TO INSERT*****
xtreg log_exp mortality_rate_A mortality_rate_B vaxA vaxB average_facial_coveringsA  average_facial_coveringsB average_contA average_contB average_cont_gdp_A average_cont_gdp_B average_debtA average_debtB average_debt_gdp_A average_debt_gdp_B,fe vce(cluster exports_code)

**mortality rate + vax +  masks + containment + debt relief + interactions containment debt and vax with gdp (average of the past year)
xtreg log_exp mortality_rate_A mortality_rate_B vaxA vaxB average_facial_coveringsA vax_gdp_A vax_gdp_B  average_facial_coveringsB average_contA average_contB average_cont_gdp_A average_cont_gdp_B average_debtA average_debtB average_debt_gdp_A average_debt_gdp_B,fe vce(cluster exports_code)

**mortality rate + vax +  masks + containment + support (average of the past year)
xtreg log_exp mortality_rate_A mortality_rate_B vaxA vaxB average_facial_coveringsA  average_facial_coveringsB average_contA average_contB average_supportA average_supportB,fe vce(cluster exports_code)

**mortality rate + vax +  masks + containment + support + interactions containment and support with gdp (average of the past year)   *****TO INSERT*****
xtreg log_exp mortality_rate_A mortality_rate_B vaxA vaxB average_facial_coveringsA  average_facial_coveringsB average_contA average_contB average_cont_gdp_A average_cont_gdp_B average_debtA average_debtB average_debt_gdp_A average_debt_gdp_B,fe vce(cluster exports_code)

**mortality rate + vax +  masks + containment + support + interactions containment support and vax with gdp (average of the past year)
xtreg log_exp mortality_rate_A mortality_rate_B vaxA vaxB average_facial_coveringsA vax_gdp_A vax_gdp_B  average_facial_coveringsB average_contA average_contB average_cont_gdp_A average_cont_gdp_B average_supportA average_supportB average_support_gdp_A average_support_gdp_B,fe vce(cluster exports_code)
