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
	_change_need()
	if res.count == 0:
		return
	Inventory.add_item(res)
	Farm.max_seed += 1

# Called when the node enters the scene tree for the first time.
func _ready():
	_change_need()

func sum(l):
	var k = 0
	for i in l:
		k += i
	return k

func _change_need():
	for i in range(3):
		get_child(i).texture = null
		get_child(i).get_child(0).text = ""
		amount[i] = 0
		need[i] = null
	need[0] = ListItem.PlantList[Farm.max_seed]
	need[1] = ListItem.SeedList[Farm.max_seed]
	amount[0] = int(rand_range(10, 20))
	amount[1] = int(rand_range(15, 30))
	get_child(1).texture = ListItem.PlantList[Farm.max_seed].sprite
	get_child(1).get_child(0).text = str(amount[0])
	get_child(2).texture = ListItem.SeedList[Farm.max_seed].sprite
	get_child(2).get_child(0).text = str(amount[1])
	res = ListItem.CreateItem(ListItem.SEED, Farm.max_seed + 1, int(rand_range(0, 3)))
	get_child(0).texture = ListItem.SeedList[Farm.max_seed + 1].sprite
	get_child(0).get_child(0).text = str("?") 
	

func set_pos(pos):
	position = pos
	
