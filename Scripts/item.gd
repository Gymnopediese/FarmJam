extends Node

class Item:
	var name : String
	var sellPrice : int
	var processTime : int
	var count : int
	var id : int
	var type : int
	var sprite : Texture
	
	func _init(Name_ = "", Id_ = 0, Type_ = 0, SellPrice_ = 0, ProcessTime_ = 0, Count_ = 1, Sprite_ = null):
		name = Name_
		sellPrice = SellPrice_
		processTime = ProcessTime_
		count = Count_
		sprite = Sprite_
		id = Id_
	
	func _to_string():
		return "name " + name + "\n" + "count " + str(count) + "\n" + "sell " + str(sellPrice) + "\n"
	
	
	func sell(sellNumber):
		if count >= sellNumber:
			count -= sellNumber
			Farm.money += sellNumber * sellPrice
	
	




