extends KinematicBody2D

# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var speed = 0.5
var friction = 0.9
var maxSpeed = 25
var direction = Vector2()
var canMove = true

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func getInput():
	var newDirection = Vector2()
	if(Input.is_action_pressed("ui_down")):
		newDirection += Vector2(0,1)
	if(Input.is_action_pressed("ui_up")):
		newDirection += Vector2(0,-1)
	if(Input.is_action_pressed("ui_left")):
		newDirection += Vector2(-1,0)
	if(Input.is_action_pressed("ui_right")):
		newDirection += Vector2(1,0)
	return newDirection


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	if(canMove):
		var newDirection = getInput()
		print(newDirection)
		if(newDirection == Vector2(0,0)):
			direction *= friction
		direction += newDirection
		direction.x = clamp(direction.x,-maxSpeed,maxSpeed)
		direction.y = clamp(direction.y,-maxSpeed,maxSpeed)
		move_and_collide(direction * speed)

