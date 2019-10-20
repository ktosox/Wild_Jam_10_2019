extends Control

# add a fade out to black effect behind the game over screen

# Called when the node enters the scene tree for the first time.
func _ready():
	get_tree().paused=true
	MM.play_defeat()
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_GameOverButton_pressed():
	get_tree().paused=false
	GM.resetLevel()
	pass # Replace with function body.


func _on_GameOverButton2_pressed():
	get_tree().paused=false
	GM.switchLevel(0)
	pass # Replace with function body.


func _on_GameOverButton3_pressed():
	GM.end_program()
	pass # Replace with function body.
