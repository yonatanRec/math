#addition:calc


### Input:
# a
# b
# out: storage location for a+b

### Output:
# the sum of a and b

$execute positioned 0.0 $(a) 0.0 as 91bb5-0-0-0-ffff run tp @s 0.0 ~$(b) 0.0
$data modify storage $(out) set from entity 91bb5-0-0-0-ffff Pos[1]