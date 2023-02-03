extends Node2D


class Tile:
	var hasObject: bool
	var object

var map = []
# Called when the node enters the scene tree for the first time.
func _ready():
	for i in range(100):
		map.append([])
		for j in range(100):
			map[i].append(Tile.new())
	map[0][0].hasObject = true


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
