extends Node

class Item:
	var id : int
	var name : String
	var sellPrice : int
	var processTime : int
	var count : int
	var sprite : Sprite
	
	func _init(Id_ = 0, Name_ = "", SellPrice_ = 0, ProcessTime_ = 0, Count_ = 1, Sprite_ = null):
		id = Id_
		name = Name_
		sellPrice = SellPrice_
		processTime = ProcessTime_
		count = Count_
		sprite = Sprite_
	
#	func get_data():
#		return [id, name, sellPrice, processTime, count, sprite]
#
#	func set_data(data):
#		id = data[0]
#		name = data[1]
#		sellPrice = data[2]
#		processTime = data[3]
#		count = data[4]
#		sprite = data[5]
	
#	func copy():
#		var new_obj = Item.new(self)
#		new_obj.set_data(self.get_data())
#		return new_obj
	
	func _to_string():
		return "name " + name + "\n" + "count " + str(count) + "\n" + "sell " + str(sellPrice)
	
	
	func sell(sellNumber):
		if count >= sellNumber:
			count -= sellNumber
			Farm.money += sellNumber * sellPrice
	
	




