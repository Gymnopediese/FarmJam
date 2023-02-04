extends Sprite


var need = ""
var amount
func interact(object):
	print("hello")
	if (object == null):
		return
	if Inventory.sell_item(need, amount):
		_change_need()
		
		
# Called when the node enters the scene tree for the first time.
func _ready():
	_change_need()


func _change_need():
	var ran = rand_range(0, 1)
	if ran < 0.8:
		ran = int(rand_range(0, Farm.max_seed))
	else:
		ran = int(rand_range(0, len(ListItem.PlantList)))
	need = ListItem.PlantList[ran].name
	amount = int(rand_range(1, 4))
	$idea.texture = ListItem.PlantList[ran].sprite
	$amount.text = str(amount) + "   $" + str(amount  *  ListItem.PlantList[ran].sellPrice)
	

func set_pos(pos):
	position = pos

func _on_Timer_timeout():
	_change_need()
	
