extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


	

# Called when the node enters the scene tree for the first time.
func _ready():
	Inventory.add_item(Item.Item.new("carrots", 10, 100))
	Inventory.add_item(Item.Item.new("pasteque", 10, 100))
	Farm.map_object = self
	Farm.set_obj_pos($Client, 46, 18)


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
