#Importing Stata Data
library(haven)
Level124_5 <- read_dta("D:/Dev/2-1/MSM/A2/MSM Assignment 2/Level124_5.dta")
View(Level124_5)
#QUESTION 3
#Categorizing Course fee 
cfee = Level124_5$cfeecp
cfee_cat=0
cfee_cat [cfee>=0 & cfee<=10000] = 1
cfee_cat [cfee>10000 & cfee<=50000] = 2
cfee_cat [cfee>50000 & cfee<=150000] = 3
cfee_cat [cfee>150000 & cfee<=500000] = 4
cfee_cat [cfee>500000 & cfee<=2500000] = 5
#Extracting components from list
sector = Level124_5$sector
scgrp = Level124_5$sclgrp
religion = Level124_5$relgn
curatt = Level124_5$curatt
typinst = Level124_5$typinst
#Creating a data frame with the extracted components
census_cat = data.frame(cfee_cat, curatt, religion, scgrp,sector, typinst)
#Cross tabulation between Sector(Lv 1) and Level of Current Attendance(Lv 5)
sec_curatt=prop.table(table(census_cat$sector, census_cat$curatt),1)*100
rownames(sec_curatt)=c("Rural","Urban")
colnames(sec_curatt)=c("Primary","Middle", "Secondary", "High Sec", "Diploma(Sec)", "Diploma(High Sec)","Diploma(Grad)", "Grad", "PostGrad")
sec_curatt
#Cross tabulation between Social Group(Lv 2) and Course Fee(Lv 4)
sc_cfee = prop.table(table(census_cat$scgrp, census_cat$cfee_cat),1)*100
rownames(sc_cfee)=c("ST","SC", "OBC", "Other")
colnames(sc_cfee)=c("0-10000","10000-50000", "50000-150000", "150000-500000", "500000-2500000")
sc_cfee
#Cross tabulation between Social Group(Lv 2) and Type of Institution(Lv 5)
sc_typinst = prop.table(table(census_cat$scgrp, census_cat$typinst),1)*100
rownames(sc_typinst)=c("ST","SC", "OBC", "Other")
colnames(sc_typinst)=c("Govt","Pvt aided", "Pvt unaided", "Unknown")
sc_typinst
#QUESTION 4
#Extracting variable Total Expenditure(Lv 4)
totexp = Level124_5$totexp
#Using aggregate function where 'totexp' variables are split according to 'sector' after which the mean is computed
aggregate(totexp~sector,Level124_5,FUN=mean)
#Similarly calculating mean for 'totexp' with respect to 'scgrp'
aggregate(totexp~scgrp,Level124_5,FUN=mean)
#QUESTION 5
#Subsituting all NA values with 0
totexp [is.na(totexp)] = 0
#Calculating log of expenditure
logexp = log(1+totexp)
#Creating a variable reg_exp to perform regression with respect to 6 independent variables
reg_exp=glm(logexp~ factor(Level124_5$sector) + factor(Level124_5$relgn) + factor(Level124_5$sclgrp) + factor(Level124_5$curatt) + Level124_5$hhsize + factor(Level124_5$typinst))
summary(reg_exp)