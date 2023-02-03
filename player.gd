extends KinematicBody2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

var speed = 200
var velocity = Vector2()

func _max_accelerate():
	if abs(velocity.x) > speed+1:
		velocity.x = velocity.x/abs(velocity.x)*speed
	if abs(velocity.y) > speed:
		velocity.y = velocity.y/abs(velocity.y)*speed
	
func _stop_character():
	if abs(velocity.x) < 10:
		velocity.x = 0
	if abs(velocity.y) < 10:
		velocity.y = 0

func _move(delta):
	
	_stop_character()
	
	var diagonalMove = 0
	if Input.is_action_pressed("up"):
		velocity += Vector2(0, -speed)
		diagonalMove += 1
	if Input.is_action_pressed("down"):
		velocity += Vector2(0, speed)
		diagonalMove += 1
	if Input.is_action_pressed("left"):
		velocity += Vector2(-speed, 0)
		diagonalMove += 1
	if Input.is_action_pressed("right"):
		velocity += Vector2(speed, 0)
		diagonalMove += 1
	
	_max_accelerate()
	
	if diagonalMove == 2:
		velocity /= 1.4
	
	#natural decceleration
	velocity /= 1.2
	
	position = position + velocity * delta

func _process(delta):
	_move(delta)
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
