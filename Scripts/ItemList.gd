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
	Item.new("Carrot", 0, PLANT, 8, 1), 
	Item.new("Tomato", 1, PLANT, 12, 1),
	Item.new("Strawberry", 2, PLANT, 18, 1),
	Item.new("Pumpkin", 3, PLANT, 36, 1),
	Item.new("Corn", 4, PLANT, 24, 1),
	Item.new("Potato", 5, PLANT, 8, 1),
	Item.new("Watermelon", 6, PLANT, 56, 1),
	Item.new("Radish", 7, PLANT, 14, 1),
	Item.new("Letuce", 8, PLANT, 28, 1),
	Item.new("Hay", 9, PLANT, 4, 1),
	]

var SeedList = []

var AnimalProccessedList = [
	Item.new("Pullover", 100, 0),
]

var AnimalHarvestedList = [
	Item.new("Egg", 0, ANIMALHARVEST, 100, 1), 
	Item.new("Milk", 1, ANIMALHARVEST, 200, 1), 
	Item.new("TurkeyEgg", 2, ANIMALHARVEST, 300, 1), 
]

func _ready():
	for i in range(len(PlantList)):
		SeedList.append(PlantToSeed(dict2inst(inst2dict(PlantList[i]))))
		PlantList[i].sprite = load("res://items/%s.png" % str(i))
		SeedList[i].sprite = load("res://seeds/%s.png" % str(i))
	for i in range(2):
		AnimalHarvestedList[i].sprite = load("res://animals_item/%s.png" % str(i))

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
