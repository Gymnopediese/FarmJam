extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var text = "ça vas la miffouille ???"
var index = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	$Timer.start()
	$RichTextLabel.text = ""



func _on_Timer_timeout():
	if index < len(text):
		$RichTextLabel.text += text[index]
		index += 1
	else:
		$Timer.stop()
		index = 0
