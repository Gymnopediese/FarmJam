extends Sprite


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
export var type = 0
export var id = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func interact(object):
	var npos = position / 16
	Farm.map[npos.x][npos.y].hasObject = false
	Farm.map[npos.x][npos.y].object = null
	Inventory.add_item(ListItem.CreateItem(type, id, 1))
	self.queue_free()

func set_pos(pos):
	position = pos
