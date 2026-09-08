#math:flipbit

### Input:
# in

### Output:
# if in is 0, return 1, otherwise return 0
$data modify storage mathlib:flipbit in set value $(in)d
execute if data storage mathlib:flipbit {in:0d} run return 1
return 0