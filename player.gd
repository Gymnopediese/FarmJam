extends KinematicBody2D


var speed = 100
var velocity = Vector2()
var inventory = []


func _ready():
	pass # Replace with function body.

<<<<<<< HEAD
=======
var speed = 30
var velocity = Vector2()
var orientation = Vector2()
>>>>>>> f2b8ef9ec315fffc46a623ea3d47226f0948827c

func _max_accelerate(diagonalMove):
	if abs(velocity.x) > speed+1:
		velocity.x = velocity.x/abs(velocity.x)*speed
	if abs(velocity.y) > speed:
		velocity.y = velocity.y/abs(velocity.y)*speed
	
func _interact():
	var ind = position / 16
	ind += orientation
	print(ind)
	if ind > Vector2(0, 0) and Farm.map[int(ind.x)][int(ind.y)].hasObject:
		print(Farm.map[int(ind.x)][int(ind.y)])
		Farm.map[int(ind.x)][int(ind.y)].object.interact(self)

func _move(delta):
	var diagonalMove = 0
	if Input.is_action_just_pressed("Interact"):
		_interact()
		return
	if Input.is_action_pressed("up"):
		velocity += Vector2(0, -speed)
		orientation = Vector2(0, -1)
		diagonalMove += 1
	if Input.is_action_pressed("down"):
		velocity += Vector2(0, speed)
		orientation = Vector2(0, 1)
		diagonalMove += 1
	if Input.is_action_pressed("left"):
		orientation = Vector2(-1, 0)
		velocity += Vector2(-speed, 0)
		diagonalMove += 1
	if Input.is_action_pressed("right"):
		orientation = Vector2( 1, 0)
		velocity += Vector2(speed, 0)
		diagonalMove += 1
	_max_accelerate(diagonalMove)
	if diagonalMove == 2:
		velocity /= 1.4
	
	velocity /= 1.1
	
	position = position + velocity * delta

func _add_item(newItem):
	for item in inventory:
		if item.name == newItem.name:
			item.count += 1
	for item in inventory:
		if item.name == "":
			item = newItem

func _process(delta):
	_move(delta)
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
