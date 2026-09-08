#subtraction:calc

# This function subtracts two numbers together
# and stores the result in a specified storage location.




### input:
# a: any number, can be positive or negative, can have a decimal part
# b: a second number to subtract from the first number, can also be positive or negative, can also have a decimal part
# out: storage location for result

$function math:negate {in:$(b), out:"mathlib:subtraction b"}
$data modify storage mathlib:subtraction a set value $(a)
$data modify storage mathlib:subtraction out set value "$(out)"



# edge cases:
# if b is 0, return a
$execute store result score #subtraction_temp temp run function math:equal {a:$(b), b:0}
$execute if score #subtraction_temp temp matches 1 run data modify storage $(out) set value $(a)
execute if score #subtraction_temp temp matches 1 run return 0

# if a is 0, return -b
$execute store result score #subtraction_temp temp run function math:equal {a:$(a), b:0}
$execute if score #subtraction_temp temp matches 1 run data modify storage $(out) set from storage mathlib:subtraction b
execute if score #subtraction_temp temp matches 1 run return 0

# if a is equal to b, return 0
$execute store result score #subtraction_temp temp run function math:equal {a:$(a), b:$(b)}
$execute if score #subtraction_temp temp matches 1 run data modify storage $(out) set value 0
execute if score #subtraction_temp temp matches 1 run return 0

### calculation:
#tp entity to x=0, y=a, z=0 facing down
# tp entity ^ ^ ^b

# $execute positioned 0.0 0.0 0.0 as 91bb5-0-0-0-ffff run tp @s ~ ~$(a) ~ 0 90

# $execute as 91bb5-0-0-0-ffff at @s run tp @s ^ ^ ^$(b)

# # store the x coordinate of the entity in the out storage location
# $data modify storage $(out) set from entity 91bb5-0-0-0-ffff Pos[1]



return run function math:addition with storage mathlib:subtraction