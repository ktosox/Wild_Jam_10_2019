extends Control

func _on_Button_return_pressed():
	get_tree().paused = false
	self.queue_free()


func _on_Button_moar_pressed():
	get_tree().paused=false
	GM.switchLevel(0)



func _on_Button_exit_pressed():
	get_tree().paused = false
	GM.end_program()
