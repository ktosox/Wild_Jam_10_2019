extends RigidBody2D

var bulletScene = load("res://GameParts/Dudes/Bullet.tscn")
var notBussy = true
var team

func _ready():
	randomize()
	do_stuff()
	team = randi()%2


func do_stuff():
	if(notBussy):
		match(randi()%3):
			1:
				print("idle")
			2:
				print("move")
			3:
				print("spin")
	else:
		$TimerBored.start()
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_TimerBored_timeout():
	do_stuff()
