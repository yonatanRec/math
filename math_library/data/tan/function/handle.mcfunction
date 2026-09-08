# store both values
data modify storage mathlib:tan a set from entity @s Pos[0]
tp @s ^ ^ ^2
data modify storage mathlib:tan b set from entity @s Pos[2]
return fail
# divide a by b and store to output
$data modify storage mathlib:tan out set value "$(out)"
function math:division with storage mathlib:tan