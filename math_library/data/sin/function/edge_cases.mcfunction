

# This function handles edge cases for angles that sin is a rational number.
# It checks if the input angle is one of the angles where sine is a rational number
# (0, 30, 90, 150, 180, 210, 270, 330 degrees) and if so,
# it stores the corresponding sine value in the output storage location.
# If the input angle is not one of these angles,
# it returns a failure result to indicate that the edge case handling did not apply.




# sin:edge_cases

data modify storage mathlib:temp sin set value -100

$scoreboard players set #sin_degrees degrees $(in)
scoreboard players operation #sin_degrees degrees %= #360 custom_value

execute if score #sin_degrees degrees matches 0 run data modify storage mathlib:temp sin set value 0
execute if score #sin_degrees degrees matches 30 run data modify storage mathlib:temp sin set value 0.5
execute if score #sin_degrees degrees matches 90 run data modify storage mathlib:temp sin set value 1
execute if score #sin_degrees degrees matches 150 run data modify storage mathlib:temp sin set value 0.5
execute if score #sin_degrees degrees matches 180 run data modify storage mathlib:temp sin set value 0
execute if score #sin_degrees degrees matches 210 run data modify storage mathlib:temp sin set value -0.5
execute if score #sin_degrees degrees matches 270 run data modify storage mathlib:temp sin set value -1
execute if score #sin_degrees degrees matches 330 run data modify storage mathlib:temp sin set value -0.5

execute if data storage mathlib:temp {sin:-100} run return fail

$data modify storage $(out) set from storage mathlib:temp sin

# returning a value means success
return 1