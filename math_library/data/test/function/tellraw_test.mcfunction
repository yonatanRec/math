# in: storage location
# uses /tellraw to display the value of the storage location in the actionbar

$data modify storage temp:temp tellraw set from storage $(in)
function test:actionbar with storage temp:temp