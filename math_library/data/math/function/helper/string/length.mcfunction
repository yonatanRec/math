# math:helper/string/length
### Input:
# str: any string, can be empty

### Output:
# returns string length

$data modify storage mathlib:helper temp set value "$(str)"
execute store result score #temp temp run data get storage mathlib:helper temp
return run scoreboard players get #temp temp