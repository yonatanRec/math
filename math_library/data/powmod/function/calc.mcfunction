#powmod:calc
### input: a, n, m, out
# a is any number, n is an integer, m is the modulus
# Calculate (a^n) mod m using binary exponentiation and taking the modulus at each step to keep numbers manageable
# The result is stored in the output storage "out"

# res = 1
# if n<0, a = 1/a, n=|n|
# call loop(a,n)
# put mathlib:powmod res into $(out)

scoreboard players set #powmod_integer_count count 1

data modify storage mathlib:powmod res set value 1
data remove storage mathlib:powmod steps

$data modify storage mathlib:powmod input set value {a:$(a),n:$(n),m:$(m)}
$scoreboard players set #n count $(n)
$data modify storage mathlib:powmod m set value $(m)
$data modify storage mathlib:powmod a set value $(a)
data modify storage mathlib:temp a set from storage mathlib:powmod a
data modify storage mathlib:temp b set from storage mathlib:powmod m
data modify storage mathlib:temp out set value "mathlib:powmod a"
function math:modulo with storage mathlib:temp

execute if score #n count matches ..-1 run return fail

execute if score #n count < #0 custom_value run scoreboard players operation #n count *= #minus_1 custom_value

function powmod:loop with storage mathlib:powmod

execute if score #negative temp matches 1 run data modify storage mathlib:temp in set from storage mathlib:powmod res
execute if score #negative temp matches 1 run data modify storage mathlib:temp out set value "mathlib:powmod res"
execute if score #negative temp matches 1 run function math:reciprocal with storage mathlib:temp

execute if score #negative temp matches 1 run data modify storage mathlib:temp a set from storage mathlib:powmod res


$data modify storage $(out) set from storage mathlib:powmod res