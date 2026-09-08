#math:ceil

### Input
# in: any number

### Output
# returns ceil(in)

# calculation
# ceil(x) = -floor(-x)
# so, since we already have floor, we can just use that to calculate ceil

$function math:negate {in:$(in), out:"mathlib:ceil in"}

# now we have -in, we can just floor it and negate the result to get ceil(in)
execute store result storage mathlib:ceil in int 1 run function math:floor with storage mathlib:ceil
function math:floor with storage mathlib:ceil

# now we have floor(-in) in mathlib:ceil, we just need to negate it to get ceil(in)
function math:negate with storage mathlib:ceil

# now mathlib:ceil contains ceil(in), so we can return it
return run data get storage mathlib:ceil in