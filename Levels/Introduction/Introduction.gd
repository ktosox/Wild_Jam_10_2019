extends Node2D

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

# Called when the node enters the scene tree for the first time.
func _ready():
	$Player.canFire = false
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_PurplePad_body_entered(body):
	GM.teamPlayer = 1
	GM.win_game()
	pass # Replace with function body.


func _on_GreenPad_body_entered(body):
	GM.teamPlayer = 0
	GM.win_game()
	pass # Replace with function body.
