extends Node


var inventory = []

var MAXSIZE = 20
var MAXSTACK = 64

func add_item(newItem):
	for item in inventory:
		if item.name == newItem.name and item.count + newItem.count < MAXSTACK:
			item.count += newItem.count
			return true
	if (len(inventory) < MAXSIZE):
		inventory.append(newItem)
		return true
	return false

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
