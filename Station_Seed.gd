extends AnimatedSprite

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

var itemProcessed
var finished = false
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func set_pos(pos):
	position = pos

func interact(item):
	if item.type == ListItem.PLANT and itemProcessed == null:
		itemProcessed = item
		$Timer.set_wait_time(item.processTime)
		$Timer.start()
		Inventory.remove_item(itemProcessed.name, 1)
		play()
	if finished:
		finished = false
		var res = ListItem.CreateItem(ListItem.SEED, itemProcessed.id, rand_range(1, 5))
		itemProcessed = null
		return [res, false]
		
		

func _on_Timer_timeout():
	finished = true
	$Timer.stop()
	stop()
