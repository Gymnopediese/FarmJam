extends Sprite


var need = [null, null, null, null]
var amount = [0, 0, 0, 0]
var res

func interact(object):
	if (object == null):
		return
	for i in range(len(need)):
		if need[i] != null and not Inventory.has_item(need[i].name, amount[i]):
			print("not satisire")
			return
	for i in range(len(need)):
		if need[i] != null:
			Inventory.remove_item(need[i].name, amount[i])
	print(res)
	Inventory.add_item(res)
	_change_need()
		
# Called when the node enters the scene tree for the first time.
func _ready():
	_change_need()

func sum(l):
	var k = 0
	for i in l:
		k += i
	return k

func _change_need():
	for i in range(4):
		get_child(i).texture = null
		get_child(i).get_child(0).text = ""
		amount[i] = 0
		need[i] = null
	for i in range(1, rand_range(2, 5)):
		var ran = rand_range(0, 2)
		need[i] = ListItem.PlantList[ran]
		amount[i] = int(rand_range(5, 10))
		get_child(i).texture = ListItem.PlantList[ran].sprite
		get_child(i).get_child(0).text = str(amount[i]) + "   $" + str(amount[i]  *  ListItem.PlantList[ran].sellPrice)
	var ran = -1
	res = ListItem.CreateItem(ListItem.SEED, ran, int(rand_range(sum(amount), sum(amount) + 5)))
	get_child(0).texture = ListItem.PlantList[ran].sprite
	get_child(0).get_child(0).text = str(res.count) + "   $" + str(res.count  *  ListItem.PlantList[ran].sellPrice)
	

func set_pos(pos):
	position = pos
	
