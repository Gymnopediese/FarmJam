extends KinematicBody2D

var speed = 30
var velocity = Vector2()
var inventory = []
var orientation = Vector2()

func _ready():
	pass # Replace with function body.

func _max_accelerate(diagonalMove):
	if abs(velocity.x) > speed+1:
		velocity.x = velocity.x/abs(velocity.x)*speed
	if abs(velocity.y) > speed:
		velocity.y = velocity.y/abs(velocity.y)*speed
	
func _interact():
	var ind = position / 16
	ind += orientation
	var obj = null
	if len(Inventory.inventory) > 0:
		obj = Inventory.inventory[0]
	Farm.interact(ind, obj)
				

func _move(delta):
	velocity.x = 0
	velocity.y = 0
	
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
	
	
	self.move_and_slide(velocity)
	#position = position + velocity * delta

func _process(delta):
	_move(delta)
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
