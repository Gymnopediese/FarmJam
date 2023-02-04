extends Item

var SeedSaleModifier = 0.5
var SeedProcessModifier = 3

enum {
	PLANT,
	SEED,
	ANIMALPROCESSES,
	ANIMALHARVEST
}

func PlantToSeed(item):
	var returnItem = item
	
	returnItem.name += "Seed"
	returnItem.sellPrice *= SeedSaleModifier
	returnItem.processTime *= SeedProcessModifier
	returnItem.type = SEED
	return returnItem
	


var PlantList = [
	Item.new("Carrot", 0, PLANT, 100, 1), 
	Item.new("Watermelon", 1, PLANT, 115, 1)
	]

var SeedList = [
	PlantToSeed(dict2inst(inst2dict(PlantList[0]))),
	PlantToSeed(dict2inst(inst2dict(PlantList[1])))
]

var AnimalProccessedList = [
	Item.new("Pullover", 100, 0),
]

var AnimalHarvestedList = [
	Item.new("Wool", 100, 35),
]

func _ready():
	for i in range(2):
		PlantList[i].sprite = load("res://items/%s.png" % str(i))
		SeedList[i].sprite = load("res://seeds/%s.png" % str(i))

func CreateItem(ItemType, ItemId, Count = 0):
	
	var returnItem
	
	if ItemType == 0:
		returnItem = dict2inst(inst2dict(PlantList[ItemId]))
		returnItem.count = Count
	if ItemType == 1:
		returnItem = dict2inst(inst2dict(SeedList[ItemId]))
		returnItem.count = Count
	if ItemType == 2:
		returnItem = dict2inst(inst2dict(AnimalProccessedList[ItemId]))
		returnItem.count = Count
	if ItemType == 3:
		returnItem = dict2inst(inst2dict(AnimalHarvestedList[ItemId]))
		returnItem.count = Count
	return returnItem
