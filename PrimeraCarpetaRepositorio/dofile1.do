******* TALLER 1 DE STATA
*** En esta sesión nos hacemos amigos/as de stata y aprendemos a operarlo un poquito
*******


**** PREGUNTA 1

* ojo: yo tengo un mac! Esto es solamente importante para establecer el path o directorio.
* más información en el helper del comando cd

* a)
pwd
cd  "/Users/vivianadiaztitelman/Desktop/ECONOMIA PUC/AYUDANTIAS/Stata 2022-1"

* c)

log using log.smcl, replace

* d)
use casen2003, clear 

* e)
describe
ds, not(type numeric)


* f) 
sort segmento f o
** en command window lo siguiente, para ver el cambio en la base de datos entre preserve y restore
preserve
keep if segmento == 8405215
restore 

* g) 
sum numper
sum numper, detail
tabstat numper, stats(mean min max sd)
sum numper if f==81 & segmento==8405215
* pues verifiquemos que lo hicimos bien...
* preserve
* keep if segmento == 8405215
* restore 

* h)
gen RM=1 if r==13
replace RM=0 if r~=13 & r!=.
sum numper if RM==1 
sum numper if RM==0

* i)
ttest numper, by(RM)
return list

* j)
log close


**** PREGUNTA 2

* en este código, está el loop completo (o sea, la pregunta (f).)
* las partes están indicadas dentro del loop.

forvalues n=100(100)1000{
clear
set obs `n'


* a) 
gen X=runiform()
sum X

* b)
ttest X == 0.4

* c)
gen Y=rnormal()
sum Y
corr X Y

* d)

* miremos otras transformaciones para predecir qué va a pasar!
* gen Z1=10+Y
* sum Z1
* gen Z2=5*Y
* sum Z2

gen Z=10+5*Y
sum Z

* e)

corr Y Z
corr X Z
}
