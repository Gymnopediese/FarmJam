extends AnimatedSprite


export var id = 0
export var wait_tick = 10
export var pos = Vector2()

var counter = 0
var bertreat = true
var dest = Vector2()

func _ready():
	play("idle")

var stop = true

func _process(delta):
	position = position.move_toward(dest, delta * 20)
	if (position == dest and not stop):
		stop = true
		if int(rand_range(0, 2)) == 0:
			behave()
		else:
			play("idle")

func interact(object):
	if (bertreat):
		bertreat = false
		counter = 0
		Inventory.add_item(ListItem.CreateItem(ListItem.ANIMALHARVEST, id, 1))

func set_pos(pos):
	self.pos = pos
	dest = pos
	position = pos

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

func _on_Timer_timeout():
	counter += 1
	if counter == 10:
		counter = 0
		bertreat = true
	if stop and int(rand_range(0, 4)) == 0:
		behave()
