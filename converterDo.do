*Changing Directory
cd "C:\Users\shanm\Desktop\1. Assignment-II_CMS\Group-II\Nss71_25.2\Datagen\"

*Creating the dta files from dct and data files
infile using "dct files\Level1.dct" if level==1
compress
save "stata files\Level1.dta", replace
clear
infile using "dct files\Level2.dct" if level==2
compress
save "stata files\Level2.dta", replace
clear
infile using "dct files\Level3.dct" if level==3
compress
save "stata files\Level3.dta", replace
clear
infile using "dct files\Level4.dct" if level==4
compress
save "stata files\Level4.dta", replace
clear
infile using "dct files\Level5.dct" if level==5
compress
save "stata files\Level5.dta", replace
clear
infile using "dct files\Level6.dct" if level==6
compress
save "stata files\Level6.dta", replace
clear

*Creating new variable called household ID in all the data files
use "C:\Users\shanm\Desktop\1. Assignment-II_CMS\Group-II\Nss71_25.2\Datagen\stata files\Level1.dta", clear
egen hhid = concat (fsu hgsub sstr hh)
label variable hhid "Household Id"
destring hhid, replace
sort hhid
save "C:\Users\shanm\Desktop\1. Assignment-II_CMS\Group-II\Nss71_25.2\Datagen\stata files\Level1.dta", replace
clear

use "C:\Users\shanm\Desktop\1. Assignment-II_CMS\Group-II\Nss71_25.2\Datagen\stata files\Level2.dta", clear
egen hhid = concat (fsu hgsub sstr hh)
label variable hhid "Household Id"
destring hhid, replace
sort hhid
save "C:\Users\shanm\Desktop\1. Assignment-II_CMS\Group-II\Nss71_25.2\Datagen\stata files\Level2.dta", replace
clear

use "C:\Users\shanm\Desktop\1. Assignment-II_CMS\Group-II\Nss71_25.2\Datagen\stata files\Level3.dta", clear
egen hhid = concat (fsu hgsub sstr hh)
label variable hhid "Household Id"
destring hhid, replace
sort hhid
save "C:\Users\shanm\Desktop\1. Assignment-II_CMS\Group-II\Nss71_25.2\Datagen\stata files\Level3.dta", replace
clear

use "C:\Users\shanm\Desktop\1. Assignment-II_CMS\Group-II\Nss71_25.2\Datagen\stata files\Level4.dta", clear
egen hhid = concat (fsu hgsub sstr hh)
label variable hhid "Household Id"
destring hhid, replace
sort hhid
save "C:\Users\shanm\Desktop\1. Assignment-II_CMS\Group-II\Nss71_25.2\Datagen\stata files\Level4.dta", replace
clear

use "C:\Users\shanm\Desktop\1. Assignment-II_CMS\Group-II\Nss71_25.2\Datagen\stata files\Level5.dta", clear
egen hhid = concat (fsu hgsub sstr hh)
label variable hhid "Household Id"
destring hhid, replace
sort hhid
save "C:\Users\shanm\Desktop\1. Assignment-II_CMS\Group-II\Nss71_25.2\Datagen\stata files\Level5.dta", replace
clear

use "C:\Users\shanm\Desktop\1. Assignment-II_CMS\Group-II\Nss71_25.2\Datagen\stata files\Level6.dta", clear
egen hhid = concat (fsu hgsub sstr hh)
label variable hhid "Household Id"
destring hhid, replace
sort hhid
save "C:\Users\shanm\Desktop\1. Assignment-II_CMS\Group-II\Nss71_25.2\Datagen\stata files\Level6.dta", replace
clear

*Merging required data files
use "C:\Users\shanm\Desktop\1. Assignment-II_CMS\Group-II\Nss71_25.2\Datagen\stata files\Level1.dta", clear
merge m:m hhid using "C:\Users\shanm\Desktop\1. Assignment-II_CMS\Group-II\Nss71_25.2\Datagen\stata files\Level2.dta"
drop _merge
merge m:m hhid using "C:\Users\shanm\Desktop\1. Assignment-II_CMS\Group-II\Nss71_25.2\Datagen\stata files\Level4.dta"
drop _merge
merge m:m hhid using "C:\Users\shanm\Desktop\1. Assignment-II_CMS\Group-II\Nss71_25.2\Datagen\stata files\Level5.dta"

*Saving a new merged data file
save "C:\Users\shanm\Desktop\1. Assignment-II_CMS\Group-II\Nss71_25.2\Datagen\stata files\Level124&5.dta"
