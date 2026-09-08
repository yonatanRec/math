# powmod:loop

# if n==0,  return
# temp = n%2
# if temp == 1, result = result * a
# a = a*a
# n = floor(n/2)
# loop(a,n)

execute if score #powmod_integer_count count > #powmod_depth count run return run say pow function depth limit reached
execute if score #n count = #0 custom_value run return 1
#say looped
$data modify storage mathlib:powmod a set value $(a)

data modify storage mathlib:powmod temp set value {}
execute store result storage mathlib:powmod temp.n int 1 run scoreboard players get #n count
data modify storage mathlib:powmod temp.a set from storage mathlib:powmod a
data modify storage mathlib:powmod steps append from storage mathlib:powmod temp
data remove storage mathlib:powmod temp

scoreboard players operation #temp count = #n count
scoreboard players operation #temp count %= #2 custom_value

execute if score #temp count = #1 custom_value run data modify storage mathlib:temp a set from storage mathlib:powmod res
execute if score #temp count = #1 custom_value run data modify storage mathlib:temp b set from storage mathlib:powmod a
execute if score #temp count = #1 custom_value run data modify storage mathlib:temp out set value "mathlib:powmod res"
execute if score #temp count = #1 custom_value run function math:multiplication with storage mathlib:temp

execute if score #temp count = #1 custom_value run data modify storage mathlib:temp a set from storage mathlib:powmod res
execute if score #temp count = #1 custom_value run data modify storage mathlib:temp b set from storage mathlib:powmod m
execute if score #temp count = #1 custom_value run data modify storage mathlib:temp out set value "mathlib:powmod res"
execute if score #temp count = #1 custom_value run function math:modulo with storage mathlib:temp

data modify storage mathlib:temp in set from storage mathlib:powmod a
data modify storage mathlib:temp out set value "mathlib:powmod a"
function math:square with storage mathlib:temp

data modify storage mathlib:temp a set from storage mathlib:powmod a
data modify storage mathlib:temp b set from storage mathlib:powmod m
data modify storage mathlib:temp out set value "mathlib:powmod a"
function math:modulo with storage mathlib:temp

scoreboard players operation #n count /= #2 custom_value

scoreboard players add #powmod_integer_count count 1
return run function powmod:loop with storage mathlib:powmod