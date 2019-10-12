extends Control

# add a fade out to black effect behind the game over screen

# Called when the node enters the scene tree for the first time.
func _ready():
	get_tree().paused=true
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_GameOverButton_pressed():
	print("pressed")
	pass # Replace with function body.


func _on_GameOverButton2_pressed():
	print("pressed")
	pass # Replace with function body.


func _on_GameOverButton3_pressed():
	print("pressed")
	pass # Replace with function body.
