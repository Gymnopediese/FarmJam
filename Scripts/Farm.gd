extends Node2D


class Tile:
	var hasObject: bool
	var object

var map = []
var map_object
var money = 0
var crops_path = "res://crops/"
var crops = [
	"carrots",
	"pasteque"
]

func plante(crop, vect):
	print("planting " + crop)
	var x = int(vect.x)
	var y = int(vect.y)
	var plante = load(crops_path + crop + ".tscn").instance()
	plante.set_pos(Vector2(x * 16 + 8, y * 16 + 8))
	map[x][y].hasObject = true
	map[x][y].object = plante
	map_object.add_child(plante)
	
func set_obj_pos(obj, x: int, y: int):
	map[x][y].hasObject = true
	map[x][y].object = obj
	obj.set_pos(Vector2(x * 16, y * 16))

func clear(vect):
	var x = int(vect.x)
	var y = int(vect.y)
	map[x][y].hasObject = false
	if map[x][y].object != null:
		map[x][y].object.queue_free()
		map[x][y].object = null
		
func interact(vect, obj):
	var x = int(vect.x)
	var y = int(vect.y)
	print(x, " ", y)
	if vect > Vector2(0, 0) and map[x][y].hasObject:
		print("has objedct")
		var item = map[x][y].object.interact(obj)
		if item != null:
			if Inventory.add_item(item):
				clear(vect)
	else:
		plante(crops[rand_range(0, 2)], vect)

# Called when the node enters the scene tree for the first time.
func _ready():
	for i in range(100):
		map.append([])
		for j in range(100):
			map[i].append(Tile.new())
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
