extends Node2D

# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var turnSpeed = 0.09
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func update_direction(newDirection):
	var rot2vec = Vector2()
	rot2vec.x = sin(deg2rad(global_rotation_degrees))
	rot2vec.y = cos(deg2rad(global_rotation_degrees+180))
	var target = fmod(atan2(newDirection.x, - newDirection.y) - rotation + 2*PI,2*PI)
	if (target<0):
		target+= 2*PI
	if(abs(target)<PI):
		rotate(turnSpeed*rot2vec.distance_to(newDirection))
	else:
		rotate(-turnSpeed*rot2vec.distance_to(newDirection))


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
