extends Node2D


class Tile:
	var hasObject: bool
	var object

var map = []

func clear(vect):
	var x = int(vect.x)
	var y = int(vect.y)
	map[x][y].hasObject = false
	if map[x][y].object != null:
		map[x][y].object.queue_free()
		map[x][y].object = null
		
func interact(vect):
	var x = int(vect.x)
	var y = int(vect.y)
	if vect > Vector2(0, 0) and map[x][y].hasObject:
		var item = map[x][y].object.interact(self)
		if item != null:
			if Inventory.add_item(item):
				clear(vect)

# Called when the node enters the scene tree for the first time.
func _ready():
	for i in range(100):
		map.append([])
		for j in range(100):
			map[i].append(Tile.new())
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
