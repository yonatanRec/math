#math:atan

# gets a/b ratio and returns the angle

###Input:
# in: ratio
# out: output location

### Output:
# result angle inside out



$tp 91bb5-0-0-0-ffff 0.0 0.0 0.0 facing 1.0 $(in) 0.0
$data modify storage $(out) set from entity 91bb5-0-0-0-ffff Rotation[1]