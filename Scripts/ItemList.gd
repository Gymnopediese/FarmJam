extends Item

var SeedSaleModifier = 0.5
var SeedProcessModifier = 3

enum {
	Plant = 0,
	Seed = 1,
	AnimalProccessed = 2,
	AnimalHarvested = 3
}

func PlantToSeed(item):
	var returnItem = item
	
	returnItem.name += " Seed"
	returnItem.sellPrice *= SeedSaleModifier
	returnItem.processTime *= SeedProcessModifier
	
	return returnItem
	


var PlantList = [
	Item.new("Carrot", 100, 15), 
	Item.new("Watermelon", 115, 35)
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


func CreateItem(ItemType, ItemId, Count = 0):
	
	var returnItem
	
	if ItemType == 0:
		returnItem = PlantList[ItemId]
		returnItem.count = Count
	if ItemType == 1:
		returnItem = SeedList[ItemId]
		returnItem.count = Count
	if ItemType == 2:
		returnItem = AnimalProccessedList[ItemId]
		returnItem.count = Count
	if ItemType == 3:
		returnItem = AnimalHarvestedList[ItemId]
		returnItem.count = Count
	return returnItem
