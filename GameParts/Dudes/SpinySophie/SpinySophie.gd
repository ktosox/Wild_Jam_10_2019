extends RigidBody2D

var bulletScene = load("res://GameParts/Dudes/Bullet.tscn")
var notBussy = true
var team

func _ready():
	randomize()
	setTeam(randi()%2)


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

func fire_bullet():
	var bullet = bulletScene.instance()
	bullet.setTeam(team)
	bullet.global_position = $Outlet.global_position
	bullet.rotation = rotation + (randf()-0.5)
	get_parent().add_child(bullet)

func attack_spin():
	fire_bullet()
	fire_bullet()
	fire_bullet()
	apply_impulse(Vector2(), -200.0 * Vector2(sin(deg2rad(global_rotation_degrees)),cos(deg2rad(global_rotation_degrees+180))))
	
func setTeam(newTeam):
	team = newTeam
	$Shadow.setTeam(team)
	if (team == 1):
		set_collision_layer_bit(2, true)
	else:
		set_collision_layer_bit(4, true)



func _on_TimerBored_timeout():
	$AnimationPlayer.play("SpinWindUp")
