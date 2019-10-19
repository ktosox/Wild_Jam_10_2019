extends RigidBody2D

var bulletScene = load("res://GameParts/Dudes/Bullet.tscn")
var notBussy = true
var team

# Called when the node enters the scene tree for the first time.
func _ready():
	do_stuff()
	pass # Replace with function body.

func do_stuff():
	if(notBussy):
		match(randi()%3):
			0:
				print("idle")
			1:
				print("move")
				$Jump.play("animate")
			2:
				print("spin")
		$TimerBored.start()
	else:
		$TimerBored.start(randf()*4)

func fire_bullet():
	var bullet = bulletScene.instance()
	bullet.setTeam(team)
	bullet.global_position = $Outlet.global_position
	bullet.rotation = rotation + (randf()-0.5)
	get_parent().add_child(bullet)
	
func setTeam(newTeam):
	team = newTeam
	$Shadow.setTeam(team)
	if (team == 1):
		set_collision_layer_bit(2, true)
	else:
		set_collision_layer_bit(4, true)
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
func move():
	var direction = randf()*2*PI
	var distance = 1700
	apply_central_impulse(Vector2(sin(direction),cos(direction)) * distance)

func stop():
	linear_velocity = Vector2()
	
func _on_TimerBored_timeout():
	do_stuff()

