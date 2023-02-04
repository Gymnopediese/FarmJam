extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

# Called when the node enters the scene tree for the first time.
func _ready():
	$tree.play()

func set_pos(pos):
	$tree.position = pos - Vector2(0, 4)
	$Particles2D.position = pos - Vector2(0, 4)

var hit = 0
func _process(delta):
	pass

var spam = false
func interact(obj):
	if (spam):
		return
	hit += 1
	spam = true
	$tree.play("hurt")
	$Timer.start()
	Inventory.add_item(ListItem.CreateItem(0, 0, 1))
	if (hit == 5):
		$Particles2D.show()
		$Particles2D.restart()


func _on_Timer_timeout():
	$Timer.stop()
	spam = false
	if (hit == 5):
		$tree.hide()
		$respawn.start()
	else:
		$tree.play("default")


func _on_respawn_timeout():
	$respawn.stop()
	$tree.show()
	hit = 0
