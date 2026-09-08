

# This function calculates the sine of an angle in degrees
# and stores the result in a specified storage location.
# originally made by me, i came up with this myself.
# However i am not the first person to use this method.




# sin:calc

### Inputs
# in: angle (degrees) (0-360)
# out: storage location for result (0-1)

### calculation:

# first, handle edge cases for angles that sin is a rational number
# those being: 0 for 0, 180, 360 degrees
# 1 for 90 degrees
# -1 for 270 degrees
# 0.5 for 30, 150 degrees
# -0.5 for 210, 330 degrees
scoreboard players set #sin_temp temp -1
$execute store success score #sin_temp temp run function sin:edge_cases {in:$(in), out:"$(out)"}
execute unless score #sin_temp temp matches 0 run return 0

# summon entity at 0,0,0 with rotation of angle
# move entity forward by 1 block
# get entity's z

$execute rotated $(in) 0 positioned 0.0 0.0 0.0 positioned ^ ^ ^-1 as 91bb5-0-0-0-ffff run tp @s ~ ~ ~

$data modify storage $(out) set from entity 91bb5-0-0-0-ffff Pos[0]