#

# returns a<x<=b
# or if b<a returns b<x<=a

$data modify storage mathlib:range a set value $(a)
$data modify storage mathlib:range x set value $(x)
$data modify storage mathlib:range b set value $(b)

data modify storage mathlib:range out set value "mathlib:range min"
function math:min with storage mathlib:range
data modify storage mathlib:range out set value "mathlib:range max"
function math:max with storage mathlib:range
$execute if data storage mathlib:range {max:$(x)d} run return 1

data modify storage mathlib:temp a set from storage mathlib:range min
data modify storage mathlib:temp x set from storage mathlib:range x
execute store result storage mathlib:range res.a byte 1 run function math:range/a_x with storage mathlib:temp
data modify storage mathlib:temp a set from storage mathlib:range max
execute store result storage mathlib:range res.b byte 1 run function math:range/x_a with storage mathlib:temp

return run function math:and with storage mathlib:range res