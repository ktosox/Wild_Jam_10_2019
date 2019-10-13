extends Camera2D

func screenShake(duration):
	$AnimationPlayer.playback_speed = 1.0/duration
	$AnimationPlayer.play("Shake")
	

func fadeOut(duration):
	$AnimationPlayer.playback_speed = 1.0/duration
	$AnimationPlayer.play("Fade_to_black")
	pass

func fadeIn(duration):
	$AnimationPlayer.playback_speed = 1.0/duration
	$AnimationPlayer.play("Fade_from_black")
	pass
	
func colorSplash(duration, rainbow = Color(1.0,1.0,1.0)):
	$ColorBox.color = rainbow
	$AnimationPlayer.playback_speed = 1.0/duration
	$AnimationPlayer.play("Color_Flash")
	pass