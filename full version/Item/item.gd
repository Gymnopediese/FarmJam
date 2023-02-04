extends Node

class Item:
	var name : String
	var sellPrice : int
	var sprite : Sprite
	var count : int
	
	func _init(Name_, Sellprice_, count, Sprite_ = null):
		name = Name_
		sellPrice = Sellprice_
		sprite = Sprite_
		self.count = count
	func _to_string():
		return "name " + name + "\n" + "count " + str(count) + "\n" + "sell " + str(sellPrice)
	
	func sell(sellNumber):
		if count >= sellNumber:
			count -= sellNumber
			Farm.money += sellNumber * sellPrice
			
