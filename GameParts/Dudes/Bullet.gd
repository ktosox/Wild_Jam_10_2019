extends RigidBody2D

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

var team
# Called when the node enters the scene tree for the first time.
func _ready():

	pass # Replace with function body.

func setTeam(newTeam):
	team = newTeam
	if (team == 1):
		set_collision_layer_bit(3, true)
		$Pixel.self_modulate = Color(1,1,1)
	else:
		set_collision_layer_bit(5, true)
		$Pixel.modulate = Color(1,1,1)

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func pop():
	self.queue_free()
	pass
