#cos:edge_cases

# This function handles edge cases for angles that cos is a rational number.
# It checks if the input angle is one of the angles where cosine is a rational number
# (0, 60, 90, 120, 180, 240, 270, 300 degrees) and if so,
# it stores the corresponding cosine value in the output storage location.
# If the input angle is not one of these angles,
# it returns a failure result to indicate that the edge case handling did not apply.




data modify storage mathlib:temp cos set value -100

$scoreboard players set #cos_degrees degrees $(in)
scoreboard players operation #cos_degrees degrees %= #360 custom_value

execute if score #cos_degrees degrees matches 0 run data modify storage mathlib:temp cos set value 1
execute if score #cos_degrees degrees matches 60 run data modify storage mathlib:temp cos set value 0.5
execute if score #cos_degrees degrees matches 90 run data modify storage mathlib:temp cos set value 0
execute if score #cos_degrees degrees matches 120 run data modify storage mathlib:temp cos set value -0.5
execute if score #cos_degrees degrees matches 180 run data modify storage mathlib:temp cos set value -1
execute if score #cos_degrees degrees matches 240 run data modify storage mathlib:temp cos set value -0.5
execute if score #cos_degrees degrees matches 270 run data modify storage mathlib:temp cos set value 0
execute if score #cos_degrees degrees matches 300 run data modify storage mathlib:temp cos set value 0.5

execute if data storage mathlib:temp {cos:-100} run return fail

$data modify storage $(out) set from storage mathlib:temp cos
