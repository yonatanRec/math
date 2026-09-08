#math:modulo


### Input
# a, b

### Output
# out: storage location for result of a mod b

### Returns the remainder of a divided by b. If b is 0, returns fail.


### Calulation:
## edge cases:
# if b is 0, return fail
# if a is 0 or a is equal to b, return 0
## definition:
# a mod b = a - b * floor(a / b)

# edge case: if b is 0, return fail
$execute store result score #mod_temp temp run function math:equal {a:0, b:$(b)}
execute if score #mod_temp temp matches 1 run return fail

# edge case: if a is 0 or a is equal to b, return 0
$execute store result score #mod_temp temp run function math:equal {a:$(a), b:0}
$execute if score #mod_temp temp matches 1 run data modify storage $(out) set value 0
execute if score #mod_temp temp matches 1 run return 0

$execute store result score #mod_temp temp run function math:equal {a:$(a), b:$(b)}
$execute if score #mod_temp temp matches 1 run data modify storage $(out) set value 0
execute if score #mod_temp temp matches 1 run return 0

# first calculate a/b
$function math:division {a:$(a), b:$(b), out:"mathlib:mod in"}


# then calculate floor(a/b)
execute store result storage mathlib:mod a int 1 run function math:floor with storage mathlib:mod


# then calculate b * floor(a/b)
data modify storage mathlib:mod out set value "mathlib:mod b"
$data modify storage mathlib:mod b set value $(b)
function math:multiplication with storage mathlib:mod

# then calculate a - b * floor(a/b) also storing the final result in out
$data modify storage mathlib:mod a set value $(a)
$data modify storage mathlib:mod out set value "$(out)"
function math:subtract with storage mathlib:mod