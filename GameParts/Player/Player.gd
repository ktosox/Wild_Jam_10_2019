extends KinematicBody2D

# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var speed = 3


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var direction = Vector2()
	if(Input.is_action_pressed("ui_down")):
		direction += Vector2(0,1)
	if(Input.is_action_pressed("ui_up")):
		direction += Vector2(0,-1)
	if(Input.is_action_pressed("ui_left")):
		direction += Vector2(-1,0)
	if(Input.is_action_pressed("ui_right")):
		direction += Vector2(1,0)
	move_and_collide(direction * speed)
	pass
