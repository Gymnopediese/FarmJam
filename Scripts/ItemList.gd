extends Item

var SeedSaleModifier = 0.5
var SeedProcessModifier = 3

func PlantToSeed(item):
	var returnItem = item
	
	returnItem.id += 100
	returnItem.name += " Seed"
	returnItem.sellPrice *= SeedSaleModifier
	returnItem.processTime *= SeedProcessModifier
	
	return returnItem


####################
#####PLANTS HERE####
####################
# ID 100 to 199

var Plant101 = Item.new(101, "Carrot", 100, 15)

###################
#####SEEDS HERE####
###################
# ID 200 to 299

var Seed201 = PlantToSeed(dict2inst(inst2dict(Plant101)))

####################
#ANIMAL PRODUCT HERE
####################
# ID 300 to 399

###################
#ANIMAL ITEMS HERE#
###################
# ID 400 to 499


func CreateItem(ItemId, Operator = 0, Name = ""):
	var returnItem
	
	ItemId += Operator*100
	
	if ItemId < 200:
		if ItemId == 101:
			return Plant101
	
	
	if ItemId < 300:
		if ItemId == 201:
			return Seed201
	
	if ItemId < 400:
		if ItemId == 301:
			return returnItem
	
	if ItemId < 500:
		if ItemId == 401:
			return returnItem
	
	
	
	return returnItem
