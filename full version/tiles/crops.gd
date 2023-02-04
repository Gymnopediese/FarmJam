extends Timer

export var _price = 0
export var _sprite: Texture
export var _name = ""
export var _id = 0

var wet = false
# Declare member variables here. Examples:
# var a = 2
# var b = "text"

var current_frame = 0
func interact(object):
	if not wet:
		_wet()
	if current_frame > 5:
		print(Inventory.inventory)
		var res = ListItem.CreateItem(ListItem.PLANT, _id, 1)
		print(Inventory.inventory)
		return [res, true]
		
# Called when the node enters the scene tree for the first time.
func _ready():
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func set_pos(vect):
	$dry.position = vect
	$wet.position = vect
	
func _wet():
	$dry.hide()
	$wet.show()
	wet = true

func _dry():
	$dry.show()
	$wet.hide()
	wet = false

func _on_Timer_timeout():
	if wet:
		current_frame += 1
		$dry.frame = current_frame
		$wet.frame = current_frame
		_dry()
	else:
		wet = true
	
