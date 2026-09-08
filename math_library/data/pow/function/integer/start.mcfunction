#pow:integer/start
### input: a, n, out
# a is any number, n is an integer
# Calculate a^n by using binary exponentiation method
# The result is stored in the output storage "out"

# res = 1
# if n<0, a = 1/a, n=|n|
# call loop(a,n)
# put mathlib:pow res into $(out)

scoreboard players set #pow_integer_count count 1

data modify storage mathlib:pow res set value 1
data remove storage mathlib:pow steps

$data modify storage mathlib:pow input set value {a:$(a),n:$(n)}
$scoreboard players set #n count $(n)

execute if score #n count matches ..-1 run scoreboard players set #smaller temp 1

execute if score #n count < #0 custom_value run scoreboard players operation #n count *= #minus_1 custom_value

$function pow:integer/loop {a:$(a)}

execute if score #smaller temp matches 1 run data modify storage mathlib:temp in set from storage mathlib:pow res
execute if score #smaller temp matches 1 run data modify storage mathlib:temp out set value "mathlib:pow res"
execute if score #smaller temp matches 1 run function math:reciprocal with storage mathlib:temp

$data modify storage $(out) set from storage mathlib:pow res