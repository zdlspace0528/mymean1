{smcl}

{cmd:help mymean} 
{hline}
 {title:Title} {* section title}

{p2colset 7 15 17 2}{...} 

{p2col :{hi:mymean} {hline 2}}Report the mean and generate a variable taking the mean{p_end}
{p2colreset}{...}

 {title:Syntax} 
 
 {p 6 16 2}
 {cmd:mymean} {varlist} {ifin} 
 [{cmd:,} 
 {it:options}] 
 
 {synoptset 20 tabbed}{...} 
 {synopthdr}
 {synoptline} 
 {syntab:Options} 
 {synopt :{opth suf:fix(string)}}manually set the suffix of the new variable;default is _mean{p_end} 
 {synoptline} 
 {p2colreset}{...} 
 {p 4 6 2} 
 {opt by} is allowed; see {manhelp by D}. 
 
 {title:Description}
 {pstd}
 {cmd:mymean} generates variables based on {varlist} that take the average value.
 {cmd:mymean} also reports the average value and returns a matrix of all averages.
 
 {title:Options}
 {dlgtab:Options}
 
 {phang}
 {opt suffix} optionally specify a string that changes the default suffix (_mean).
 
 {title:Examples}
 
 {pstd}Setup{p_end} 
 {phang2}{cmd:. sysuse auto}{p_end}
 
 {pstd}Calculate the average for {cmd:weight} and {cmd:length}{p_end} 
 {phang2}{cmd:. mymean weight length}{p_end}
 
 {pstd}Calculate the average for {cmd:weight} and {cmd:length} seperately for domestic and foreign cars with different suffix.{p_end}
 {phang2}{cmd:. bysort foreign: mymean weight length, suffix("_meanf")}{p_end}
 
 {title:Saved results}
 
 {pstd} 
 {cmd:mymean} saves the following in {cmd:r()}:
 
 {synoptset 15 tabbed}{...} 
 {p2col 5 15 19 2: Matrices}{p_end}
 
 {synopt:{cmd:r(mean)}}Matrix of average values for all variables of {varlist} and for all groups if {opt by} was used.{p_end}

{synoptset 15 tabbed}{...} 
{p2col 5 15 19 2: Macros}{p_end}

{synopt:{cmd:r(grp)}}command to generate a unique group identifier. Usage: {cmd:egen uniqueID = `r(grp)'}{p_end}

{p2colreset}{...}

 {title:Also see}

{psee} 
Online: {manhelp egen D}, {manhelp summarize R} 
{p_end}{* manhelp links the appropriate helpfiles}
