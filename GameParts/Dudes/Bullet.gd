extends RigidBody2D

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

var team
# Called when the node enters the scene tree for the first time.
func _ready():
	linear_velocity = 600.0 * Vector2(sin(deg2rad(global_rotation_degrees)),cos(deg2rad(global_rotation_degrees+180)))
	pass # Replace with function body.

func setTeam(newTeam):
	team = newTeam
	if (team == 1):
		set_collision_layer_bit(3, true)
		$Pixel.modulate = Color(0.2,0.7,0.33)
	else:
		set_collision_layer_bit(5, true)
		$Pixel.modulate = Color(0.5,0.25,0.44)

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func pop():
	self.queue_free()
	pass


func _on_Timer_timeout():
	pop()
	pass # Replace with function body.
