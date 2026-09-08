#abs(new_guess - guess) < eps*max(1, abs(new_guess))


# first we need abs(new_guess)
data modify storage mathlib:temp in set from storage mathlib:sqrt new_guess
data modify storage mathlib:temp out set value "mathlib:sqrt abs"
function math:abs with storage mathlib:temp
data modify storage mathlib:sqrt temp.abs_guess set from storage mathlib:sqrt abs

# now max(1,abs)
data modify storage mathlib:temp a set value 1
data modify storage mathlib:temp b set from storage mathlib:sqrt abs
data modify storage mathlib:temp out set value "mathlib:sqrt max"
function math:max with storage mathlib:temp
data modify storage mathlib:sqrt temp.max set from storage mathlib:sqrt max

# now we need eps*max
data modify storage mathlib:temp a set from storage mathlib:sqrt eps
data modify storage mathlib:temp b set from storage mathlib:sqrt max
data modify storage mathlib:temp out set value "mathlib:sqrt rhs"
function math:multiplication with storage mathlib:temp
data modify storage mathlib:sqrt temp.rhs set from storage mathlib:sqrt rhs

# and now we need to calculate the left side: abs(new_guess - guess)
# so first new_guess - guess
data modify storage mathlib:temp a set from storage mathlib:sqrt new_guess
data modify storage mathlib:temp b set from storage mathlib:sqrt guess
data modify storage mathlib:temp out set value "mathlib:sqrt in"
function math:subtract with storage mathlib:temp
data modify storage mathlib:sqrt temp.sub set from storage mathlib:sqrt in

# and now abs(sub)
data modify storage mathlib:sqrt out set value "mathlib:sqrt lhs"
function math:abs with storage mathlib:sqrt
data modify storage mathlib:sqrt temp.lhs set from storage mathlib:sqrt lhs
return fail
# and finally, the check of lhs < rhs
data modify storage mathlib:temp a set from storage mathlib:sqrt lhs
data modify storage mathlib:temp b set from storage mathlib:sqrt rhs
scoreboard players set #sqrt_condition temp 0
execute store result score #sqrt_condition temp run function math:smaller with storage mathlib:temp

execute if score #sqrt_condition temp matches 1 run data modify storage mathlib:sqrt temp.final append value "True"
execute if score #sqrt_condition temp matches 0 run data modify storage mathlib:sqrt temp.final append value "False"

data modify storage mathlib:sqrt info.check append from storage mathlib:sqrt temp
return run scoreboard players get #sqrt_condition temp