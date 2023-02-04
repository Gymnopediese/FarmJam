extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func get_some_plants():
	for i in range(len(ListItem.PLantList)):
		Inventory.add_item(ListItem.CreateItem(0, i, 100))
func get_some_seeds():
	for i in range(len(ListItem.SeedList)):
		Inventory.add_item(ListItem.CreateItem(1, i, 100))

func _ready():

	get_some_seeds()
	Farm.map_object = self
	Farm.set_obj_pos($Client, 46, 18)
	Farm.set_obj_pos($farmer, 50, 21)
	Farm.set_obj_pos($AnimatedSprite, 46, 19)
	Farm.set_obj_pos($station, 46, 20)
	Farm.set_obj_pos($animal, 40, 20)
	Farm.set_obj_pos($cow, 42, 20)


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
