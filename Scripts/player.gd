extends KinematicBody2D

var _speed = 65
var _velocity = Vector2()
var _inventory = []
var _orientation = Vector2()
var _sprintTimer : int
var sprintFrames = 60

func _ready():
	pass # Replace with function body.


func _interact():
	var ind = position / 16
	ind += _orientation
	var obj = null
	if len(Inventory.inventory) > 0:
		obj = Inventory.inventory[0]
<<<<<<< HEAD
	var ooo
	ooo = ListItem.CreateItem(ListItem.Plant, 1, 20)
	ooo.count += 20
	print(ooo.name)
	print(ooo.count)
	ooo = ListItem.CreateItem(ListItem.Plant, 1, 20)
	print(ooo.count)
	ooo = ListItem.CreateItem(ListItem.Seed, 1, 20)
	ooo.count += 20
	print(ooo.name)
	print(ooo.count)

=======
	Farm.interact(ind, obj)
>>>>>>> 4ac23ff8867f626e1a2248ec2aab9426453e23b4

func _process(delta):
	if Input.is_action_just_pressed("Interact"):
		_interact()
	_move(delta)


func _max_accelerate():
	if abs(_velocity.x) > _speed+1:
		_velocity.x = _velocity.x/abs(_velocity.x)*_speed
	if abs(_velocity.y) > _speed:
		_velocity.y = _velocity.y/abs(_velocity.y)*_speed


func _move(delta):
	
	var diagonalMove = 0
	
	if Input.is_action_pressed("up"):
		_velocity += Vector2(0, -_speed)
		_orientation = Vector2(0, -1)
		diagonalMove += 1
	if Input.is_action_pressed("down"):
		_velocity += Vector2(0, _speed)
		_orientation = Vector2(0, 1)
		diagonalMove += 1
	if Input.is_action_pressed("left"):
		_orientation = Vector2(-1, 0)
		_velocity += Vector2(-_speed, 0)
		diagonalMove += 1
	if Input.is_action_pressed("right"):
		_orientation = Vector2( 1, 0)
		_velocity += Vector2(_speed, 0)
		diagonalMove += 1
	
	_max_accelerate()
	
	if diagonalMove == 2:
		_velocity /= 1.4
	
	if Input.is_action_just_pressed("Sprint"):
		if _player_is_moving(_velocity) and _sprintTimer < sprintFrames-1:
			_sprintTimer = sprintFrames-1
	
	if diagonalMove == 0:
		if _sprintTimer > sprintFrames:
			_speed/=2
		_velocity.x = 0
		_velocity.y = 0
		_sprintTimer = 0
	else:
		_sprintTimer += 1
		_velocity *= 0.8
		if _sprintTimer == sprintFrames:
			_speed*=2
	
	
#	if _sprintTimer >= 60:
#		print("Sprint")
#	else:
#		print("Walk")
	
	self.move_and_slide(_velocity)

func _player_is_moving(_velocity):
	return (abs(_velocity.x) > 0 or abs(_velocity.y) > 0)

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
