#pow:fraction/start
### input: a, f, out
# a is any number, f is a number between -1 and 1
# Calculate a^f by using the built-in exponentiation method
# The result is stored in the output storage "out"



$data modify storage mathlib:pow a set value $(a)
$data modify storage mathlib:pow f set value $(f)
execute if data storage mathlib:pow {f:0} run return 1
$execute if data storage mathlib:pow {f:0.5} run return run function math:sqrt {in:$(a),out:"$(out)"}
# if f<0, a = 1/a, f=|f|

# u = a - 1
# result = 1
# term = 1
# i = 1
# call loop

data remove storage mathlib:pow steps
$data modify storage mathlib:pow input set value {a:$(a),f:$(f)}

$execute store result storage mathlib:pow smaller int 1 run function math:smaller {a:$(f),b:0}
# if f<0, a = 1/a, f=|f|
data modify storage mathlib:temp in set from storage mathlib:pow f
data modify storage mathlib:temp out set value "mathlib:pow n"
function math:abs with storage mathlib:temp


# u = a - 1
data modify storage mathlib:temp a set from storage mathlib:pow a
data modify storage mathlib:temp b set value 1
data modify storage mathlib:temp out set value "mathlib:pow u"
function math:subtract with storage mathlib:temp

# result = 1
data modify storage mathlib:pow res set value 1

# term = 1
data modify storage mathlib:pow term set value 1

# i = 1
scoreboard players set #pow_fraction_count count 1

# call loop
$function pow:fraction/loop {a:$(a),f:$(f)}

execute if data storage mathlib:pow {smaller:1} run data modify storage mathlib:temp in set from storage mathlib:pow res
execute if data storage mathlib:pow {smaller:1} run data modify storage mathlib:temp out set value "mathlib:pow res"
function math:reciprocal with storage mathlib:temp

$data modify storage $(out) set from storage mathlib:pow res