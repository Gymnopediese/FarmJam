extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	Inventory.add_item(ListItem.CreateItem(0, 0, 100))
	Inventory.add_item(ListItem.CreateItem(0, 1, 100))
#	Inventory.add_item(Item.Item.new("carrots", 10, 100))
#	Inventory.add_item(Item.Item.new("pasteque", 10, 100))
	Farm.map_object = self
	Farm.set_obj_pos($Client, 46, 18)
	Farm.set_obj_pos($farmer, 50, 21)
	Farm.set_obj_pos($AnimatedSprite, 46, 19)
	Farm.set_obj_pos($station, 46, 20)
	Farm.set_obj_pos($animal, 40, 20)


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
