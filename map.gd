extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	Farm.map[0][0].hasObject = true
	Farm.map[0][0].object = $AnimatedSprite


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
