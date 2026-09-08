### Input:
# a, b

### Output:
# Returns 1 if a XOR b is true, otherwise returns 0

# if a and b are equal, return 0
$execute store result storage mathlib:xor temp int 1 run function math:equal {a:$(a),b:$(b)}
execute if data storage mathlib:xor {temp:1} run return 0
return 1