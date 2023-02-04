extends Node


var inventory = []

var MAXSIZE = 20

func sell_item(toSell, ammount):
	for item in inventory:
		if item.name == toSell and item.count >= ammount:
			item.sell(ammount)
			if (item.count == 0):
				inventory.erase(item)
			return

func remove_item(toRemove, ammount):
	for item in inventory:
		if item.name == toRemove and item.count >= ammount:
			item.count -= ammount
			if (item.count == 0):
				inventory.erase(item)
			return

func add_item(newItem):
	for item in inventory:
		if item.name == newItem.name:
			item.count += newItem.count
			return true
	print("not in motherfucker")
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
