extends Node2D


var bullet_beam_scene = load("res://GameParts/Player/Bullet_Beam.tscn")

var turnSpeed = 0.17
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func update_direction(newDirection):
	if(newDirection == Vector2(0,0)):
		return
	var rot2vec = Vector2()
	rot2vec.x = sin(deg2rad(global_rotation_degrees))
	rot2vec.y = cos(deg2rad(global_rotation_degrees+180))
	if(rot2vec.distance_to(newDirection*(newDirection.length()/(abs(newDirection.x)+abs(newDirection.y))))<0.12):
		rotation = atan2(newDirection.x,-newDirection.y)
	else:
		var target = fmod(atan2(newDirection.x, - newDirection.y) - rotation + 2*PI,2*PI)
		if (target<0):
			target+= 2*PI
		if(abs(target)<PI):
			rotate(turnSpeed*rot2vec.distance_to(newDirection))
		else:
			rotate(-turnSpeed*rot2vec.distance_to(newDirection))

func fire_beam():
	var bullet = bullet_beam_scene.instance()
	bullet.global_position = $outlet.global_position
	bullet.rotation = rotation + ((randf()-0.5)*0.04)
	bullet.setTeam(GM.teamPlayer)
	get_parent().get_parent().add_child(bullet)
	$Blast.pitch_scale = 1.2 + randf()*0.16
	$Blast.play()
	$outlet/CPUParticles2D.emitting = false
	$outlet/CPUParticles2D.visible = false

func fire_wave():
	pass
