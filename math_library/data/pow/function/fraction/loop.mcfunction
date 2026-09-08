#pow:fraction/loop

# if i>pow_fraction_depth, return

# temp = i - 1
# temp2 = f - temp
# term = term * temp2
# term = term * u
# term = term / i
# res = res + term
# i = i + 1
# call loop

## everything up to temp2 can be optimized by using scoreboards, as i and temp are integers
execute if score #pow_fraction_count count > #pow_fraction_depth count run return run say pow function depth limit reached

$data modify storage mathlib:pow a set value $(a)
$data modify storage mathlib:pow f set value $(f)

# store steps for debugging
data modify storage mathlib:pow temporary set value {}
data modify storage mathlib:pow temporary.u set from storage mathlib:pow u
data modify storage mathlib:pow temporary.term set from storage mathlib:pow term
data modify storage mathlib:pow temporary.res set from storage mathlib:pow res
data modify storage mathlib:pow steps append from storage mathlib:pow temporary
data remove storage mathlib:pow temporary

# temp = i - 1
scoreboard players operation #temp temp = #pow_fraction_count count
scoreboard players remove #temp temp 1
execute store result storage mathlib:pow temp int 1 run scoreboard players get #temp temp

# temp2 = f - temp
data modify storage mathlib:temp a set from storage mathlib:pow f
data modify storage mathlib:temp b set from storage mathlib:pow temp
data modify storage mathlib:temp out set value "mathlib:pow temp2"
function math:subtract with storage mathlib:temp

# term = term * temp2
data modify storage mathlib:temp a set from storage mathlib:pow term
data modify storage mathlib:temp b set from storage mathlib:pow temp2
data modify storage mathlib:temp out set value "mathlib:pow term"
function math:multiplication with storage mathlib:temp

# term = term * u
data modify storage mathlib:temp a set from storage mathlib:pow term
data modify storage mathlib:temp b set from storage mathlib:pow u
data modify storage mathlib:temp out set value "mathlib:pow term"
function math:multiplication with storage mathlib:temp

# term = term / i
data modify storage mathlib:temp a set from storage mathlib:pow term
execute store result storage mathlib:temp b int 1 run scoreboard players get #pow_fraction_count count
data modify storage mathlib:temp out set value "mathlib:pow term"
function math:division with storage mathlib:temp

# res = res + term
data modify storage mathlib:temp a set from storage mathlib:pow res
data modify storage mathlib:temp b set from storage mathlib:pow term
data modify storage mathlib:temp out set value "mathlib:pow res"
function math:addition with storage mathlib:temp

# i = i + 1
scoreboard players add #pow_fraction_count count 1

# call loop
return run function pow:fraction/loop with storage mathlib:pow