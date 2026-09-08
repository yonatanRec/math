### Input:
# a, b

### Output:
# Returns 1 if a or b is true, otherwise returns 0

$data modify storage mathlib:or a set value $(a)
$data modify storage mathlib:or b set value $(b)

execute if data storage mathlib:or {a:1} run return 1
execute if data storage mathlib:or {b:1} run return 1
return 0