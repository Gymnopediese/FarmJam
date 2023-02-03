extends AnimatedSprite

export var price = 0

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

var current_frame = 0
func interact(object):
	current_frame += 1
	frame = current_frame
# Called when the node enters the scene tree for the first time.
func _ready():
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
