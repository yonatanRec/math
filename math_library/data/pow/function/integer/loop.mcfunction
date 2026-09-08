# pow:integer/loop

# if n==0,  return
# temp = n%2
# if temp == 1, result = result * a
# a = a*a
# n = floor(n/2)
# loop(a,n)

execute if score #pow_integer_count count > #pow_integer_depth count run return run say pow function depth limit reached
execute if score #n count = #0 custom_value run return 1
#say looped
$data modify storage mathlib:pow a set value $(a)

data modify storage mathlib:pow temp set value {}
execute store result storage mathlib:pow temp.n int 1 run scoreboard players get #n count
data modify storage mathlib:pow temp.a set from storage mathlib:pow a
data modify storage mathlib:pow steps append from storage mathlib:pow temp
data remove storage mathlib:pow temp

scoreboard players operation #temp count = #n count
scoreboard players operation #temp count %= #2 custom_value

execute if score #temp count = #1 custom_value run data modify storage mathlib:temp a set from storage mathlib:pow res
execute if score #temp count = #1 custom_value run data modify storage mathlib:temp b set from storage mathlib:pow a
execute if score #temp count = #1 custom_value run data modify storage mathlib:temp out set value "mathlib:pow res"

#execute if data storage mathlib:temp {temp:1} run data modify storage mathlib:temp a set from storage mathlib:pow res
#execute if data storage mathlib:temp {temp:1} run data modify storage mathlib:temp b set from storage mathlib:pow a
#execute if data storage mathlib:temp {temp:1} run data modify storage mathlib:temp out set value "mathlib:pow res"
execute if score #temp count = #1 custom_value run function math:multiplication with storage mathlib:temp

data modify storage mathlib:temp in set from storage mathlib:pow a
data modify storage mathlib:temp out set value "mathlib:pow a"
function math:square with storage mathlib:temp

scoreboard players operation #n count /= #2 custom_value

#data modify storage mathlib:temp a set from storage mathlib:pow n
#data modify storage mathlib:temp b set value 0.5
#data modify storage mathlib:temp out set value "mathlib:temp in"
#function math:multiplication with storage mathlib:temp

#execute store result storage mathlib:pow n int 1 run function math:floor with storage mathlib:temp

scoreboard players add #pow_integer_count count 1
return run function pow:integer/loop with storage mathlib:pow