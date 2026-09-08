#math:bigger

### Input:
# a, b

### Output:
# Returns 1 if a is bigger than b, otherwise returns 0

# if a and b are equal, return 0
# $execute store result storage mathlib:bigger temp int 1 run function math:equal {a:$(a),b:$(b)}
# execute if data storage mathlib:bigger {temp:1} run return 0

$function math:subtract {a:$(b),b:$(a),out:"mathlib:bigger sub"}
data modify storage mathlib:bigger sign set string storage mathlib:bigger sub 0 1
execute if data storage mathlib:bigger {sign:"-"} run return 1
return 0

# tp 91bb5-0-0-0-ffff 0.0 0.0 0.0 0 0
# $execute as 91bb5-0-0-0-ffff at @s run tp ~ ~$(a) ~
# $execute as 91bb5-0-0-0-ffff at @s run tp @s ~ $(b) ~ facing ~ ~ ~
# data modify storage mathlib:temp temp set string entity 91bb5-0-0-0-ffff Rotation[1] 0 1
# execute if data storage mathlib:temp {temp:"-"} run return 1
# return fail