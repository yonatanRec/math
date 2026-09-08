### Input:
# in

### Output:
# returns 1 if the input is an integer, otherwise returns 0

$data modify storage mathlib:integer a set value $(in)
execute store result storage mathlib:integer temp int 1 run data get storage mathlib:integer a
$execute if data storage mathlib:integer {temp:$(in)} run return 1
return 0
