extends RigidBody2D

var bulletScene = load("res://GameParts/Dudes/Bullet.tscn")

var team

# Called when the node enters the scene tree for the first time.
func _ready():
	randomize()
	setTeam(randi()%2)

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func open_fire(target):
	$Canon/Animation_Node/AnimationPlayer.play("aim")
	$Canon.rotation = atan2(target.x-global_position.x,global_position.y-target.y)-rotation
	fire_bullet()

func fire_bullet():
	var bullet = bulletScene.instance()
	bullet.setTeam(team)
	bullet.global_position = $Canon/Animation_Node/Outlet.global_position
	bullet.rotation = $Canon.rotation + rotation
	get_parent().add_child(bullet)

func setTeam(newTeam):
	team = newTeam
	if (team == 1):
		set_collision_layer_bit(2, true)

	else:
		set_collision_layer_bit(4, true)



func _on_DetectionRange_body_entered(body):

	#if(body.get_collision_layer_bit(1)):
	open_fire(body.global_position)
