$data modify storage mathlib:temp a set value $(in)
data modify storage mathlib:temp b set value 2
data modify storage mathlib:temp out set value "mathlib:temp mod2"
function math:modulo with storage mathlib:temp
return run data get storage mathlib:temp mod2