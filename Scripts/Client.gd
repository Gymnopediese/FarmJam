extends Sprite


var need = ""
var amount
func interact(object):
	if (object == null):
		return
	if object.name == need and amount <= object.count:
		Inventory.sell_item(need, amount)
		_change_need()
		
		
# Called when the node enters the scene tree for the first time.
func _ready():
	_change_need()


func _change_need():
	need = Farm.crops[rand_range(0, 2)]
	amount = int(rand_range(1, 4))

func set_pos(pos):
	position = pos

func _on_Timer_timeout():
	_change_need()
	
