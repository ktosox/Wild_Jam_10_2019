extends Node2D

# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var enemies = 3
# Called when the node enters the scene tree for the first time.
func _ready():
	if(GM.teamPlayer == 1):
		$SpringySam.setTeam(0)
		$SpringySam2.setTeam(0)
		$SpringySam3.setTeam(0)
	else:
		$SpringySam.setTeam(1)
		$SpringySam2.setTeam(1)
		$SpringySam3.setTeam(1)
	pass # Replace with function body.

func track_progress():
	enemies -= 1
	if (enemies < 1 ):
		$Gate_North.open_gate()
	pass
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
