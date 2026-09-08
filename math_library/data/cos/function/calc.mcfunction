#cos:calc

# This function calculates the cosine of an angle in degrees 
# and stores the result in a specified storage location.
# originally made by me, i came up with this myself.
# However i am not the first person to use this method.





### Inputs
# in: angle (degrees) (0-360)
# out: storage location for result (0-1)

### calculation:

# first, handle edge cases for angles that cos is a rational number


scoreboard players set #cos_temp temp -1
$execute store success score #cos_temp temp run function cos:edge_cases {in:$(in), out:"$(out)"}
execute unless score #cos_temp temp matches 0 run return 0

# second, at 0 0 0, teleport the calculation entity 1 block forward, rotated by the input angle. The Z coordinate of the entity will then be equal to the cosine of the input angle.

$execute rotated $(in) 0 positioned 0.0 0.0 0.0 positioned ^ ^ ^1 as 91bb5-0-0-0-ffff run tp @s ~ ~ ~

$data modify storage $(out) set from entity 91bb5-0-0-0-ffff Pos[2]
