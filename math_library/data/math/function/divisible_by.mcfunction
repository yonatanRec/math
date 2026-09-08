#math:divisible_by
### Input:
# a, b
### Output:
# 1 if a is divisible by b, otherwise 0

# if a mod b is 0, return 1, else return 0
$data modify storage mathlib:temp a set value $(a)
$data modify storage mathlib:temp b set value $(b)
data modify storage mathlib:temp out set value "mathlib:temp mod"
function math:modulo with storage mathlib:temp
execute if data storage mathlib:temp {mod:0} run return 1
return 0