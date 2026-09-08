#math:floor

### Input
# in: any number

### Output
# returns floor(in)

$data modify storage mathlib:temp temp set value $(in)
return run data get storage mathlib:temp temp
