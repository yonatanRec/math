# random:random


### Input:
# a, b

### Output:
# returns a random integer between a and b

#$say "Generating a random integer between $(a) and $(b)"

# value must be integers, so first we floor the inputs
$execute store result storage mathlib:random a int 1 run function math:floor {in:$(a)}
$execute store result storage mathlib:random b int 1 run function math:floor {in:$(b)}

# since the minimum value MUST be first, we must make sure to do random(min, max)
data modify storage mathlib:random out set value "mathlib:random max"
function math:max with storage mathlib:random
data modify storage mathlib:random out set value "mathlib:random min"
function math:min with storage mathlib:random

execute store success score #temp temp store result score #temp2 temp run function random:run with storage mathlib:random
$execute if score #temp temp matches 0 run function math:helper/error {message:"random:random: failed to generate a random number between $(a) and $(b), range must be less than 2147483647\n(|a-b| < 2147483647)"}
execute if score #temp temp matches 0 run return fail
return run scoreboard players get #temp2 temp
