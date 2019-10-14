extends KinematicBody2D

# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var speed = 5
var friction = 0.86
var maxSpeed = 80
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
		if(newDirection.x == 0):
			direction.x *= friction
		if(newDirection.y == 0):
			direction.y *= friction
		
		direction += newDirection + direction.distance_to(newDirection) * newDirection
		direction.x = clamp(direction.x,-maxSpeed,maxSpeed)
		direction.y = clamp(direction.y,-maxSpeed,maxSpeed)
		move_and_slide(direction * speed)

