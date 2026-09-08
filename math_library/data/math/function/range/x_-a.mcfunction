#


# returns x<=a
$execute store result storage mathlib:temp temp int 1 run function math:range/a-x {a:$(a), x:$(x)}
execute if data storage mathlib:temp {temp:1} run return 1

$execute store result storage mathlib:temp temp int 1 run function math:range/x_a {a:$(a), x:$(x)}
execute if data storage mathlib:temp {temp:1} run return 1

return fail