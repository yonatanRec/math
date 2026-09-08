#math:round

### Input
# in: any number

### Output
# returns round(in)



# calculation
# round(x) = floor(x + 0.5)

$data modify storage mathlib:temp a set value $(in)
data modify storage mathlib:temp b set value 0.5
data modify storage mathlib:temp out set value "mathlib:temp in"
function math:addition with storage mathlib:temp

return run function math:floor with storage mathlib:temp
