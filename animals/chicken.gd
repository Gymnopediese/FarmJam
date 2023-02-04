extends "res://animals/animal.gd"


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func interact(object):
	print("chicken")
	
func lay_egg(npos):
	var new_egg = load("res://random_interactibles/egg.tscn").instance()
	Farm.map_object.add_child(new_egg)
	Farm.set_obj_pos(new_egg, int(npos.x), int(npos.y))
	print(npos.x, " ", npos.y)
	
func behave():
	print("dont know ")
	var animations = ["down", "left", "right", "up"]
	var npos = position / 16
	var neightbors = [npos + Vector2(0, 1), npos + Vector2(-1, 0), npos + Vector2(1, 0), npos + Vector2(0, -1)]
	var ran = rand_range(0, 4)
	var neightbor = neightbors[ran]
	if not Farm.map[neightbor.x][neightbor.y].hasObject:
		Farm.map[npos.x][npos.y].hasObject = false
		Farm.map[npos.x][npos.y].object = null
		Farm.map[neightbor.x][neightbor.y].hasObject = true
		Farm.map[neightbor.x][neightbor.y].object = self
		dest = neightbor * 16
		stop()
		stop = false
		play(animations[ran])
		if rand_range(0, 1) > 0.8:
			lay_egg(npos)
