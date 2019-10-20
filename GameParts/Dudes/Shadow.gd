extends Sprite

# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var team
# Called when the node enters the scene tree for the first time.
func _ready():

	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
func setTeam(NewTeam):
	team = NewTeam
	if(team == 1):
		$LightOccluder2D.light_mask = 2
	else:
		$LightOccluder2D.light_mask = 4
