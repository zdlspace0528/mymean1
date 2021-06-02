*! mymean version 1.0
capture program drop mymean 
program define mymean, rclass byable(recall)
syntax varlist(min=1 numeric) [if] [in] [,SUFfix(string)]
marksample touse
tempname meanmat
cap matrix `meanmat'=r(mean)
if _byindex() == 1 {
	if _by() == 1 {
		qui sum `_byindex'
		local grps = r(max) 
		qui replace `touse' = 0 if `_byindex' != _byindex()
    }
	else local grps = 0
    matrix `meanmat' = J(wordcount("`varlist'"),max(1, `grps'),.)
	mat rownames `meanmat' = `varlist'
    if `grps' == 0 local matcolnames "mean"
    else {
		local matcolnames ""
        forvalues grp = 1/`grps' {
        local matcolnames "`matcolnames' group`grp'"
        }
	}
	mat coln `meanmat' = `matcolnames'
}
if "`suffix'" == "" local suffix "_mean"
if _byindex() == 1 {
	foreach var in `varlist' { 
		confirm new var `var'`suffix' 
		} 
}
local i = 0 
if _byindex() == 1 {
	foreach var in `varlist' {
          local ++i
		  qui egen `var'`suffix' = mean(`var') if `touse'
          qui sum `var'`suffix' if `touse' 
		  mat `meanmat'[`i',1] = r(mean)
          if _by() == 0 display "Mean of `var' = " r(mean)
          else display "Mean of `var' = " r(mean)
	}
}
else {
	 tempvar tmp
	 foreach var in `varlist' {
	 	local ++i
		qui egen `tmp' = mean(`var') if `touse' 
		qui replace `var'`suffix' = `tmp' if `touse'
		qui sum `var'`suffix' if `touse'
		mat `meanmat'[`i',_byindex()] = r(mean)
		display `"Mean of `var' = "' r(mean)
		qui drop `tmp'
	 }
}
return matrix mean = `meanmat'
return local grp "group(`_byvars')"	 	
end		
