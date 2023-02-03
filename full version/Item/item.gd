extends Node

class Item:
	var name : String
	var sellPrice : int
	var sprite : Sprite
	var count : int
	
	func _init(Name_, Sellprice_, Sprite_ = ""):
		name = Name_
		sellPrice = Sellprice_
		sprite = Sprite_
	
	func _sell(sellNumber):
		if count < sellNumber:
			print("Error sell number too high")
		else:
			count -= sellNumber
			return count * sellNumber

