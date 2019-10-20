extends RigidBody2D

var bulletScene = load("res://GameParts/Dudes/Bullet.tscn")
var notBussy = true
export var active = false
export var team = 3
var alive = true

var HP = 4
# Called when the node enters the scene tree for the first time.
func _ready():
	if(team == 3):
		setTeam(randi()%2)
	else:	
		setTeam(team)
	if(!active):
		$Sleep.play("anim")
	else:
		do_stuff()

func do_stuff():
	if(notBussy and active):
		notBussy = false
		match(randi()%3):
			0:
				look()
				
			1:
				$Jump.play("animate")
			2:
				look()
		$TimerBored.start()
	else:
		$TimerBored.start(randf()*2)

func fire_bullet():
	var n = 3
	var angleSpread = (randf()*0.1)+0.3
	while (n>0):
		n-=1
		var bullet = bulletScene.instance()
		bullet.setTeam(team)
		bullet.global_position = $outlet.global_position
		bullet.rotation = $outlet.rotation + (n * angleSpread) - angleSpread
		get_parent().add_child(bullet)
	
func setTeam(newTeam):
	team = newTeam
	$Shadow.setTeam(team)
	if (team == 1):
		set_collision_layer_bit(2, true)
		set_collision_layer_bit(4, false)
		$HitBox.set_collision_mask_bit(5,true)
		$HitBox.set_collision_mask_bit(3,false)
	else:
		set_collision_layer_bit(2, false)
		set_collision_layer_bit(4, true)
		$HitBox.set_collision_mask_bit(5,false)
		$HitBox.set_collision_mask_bit(3,true)


func _process(delta):
	if ($Sprite.global_rotation !=0):
		applied_torque = - $Sprite.global_rotation *50000
	linear_velocity *= (0.95 * (45/(45+delta)))
	pass

func look():
	print("scanning foir tragets")
	if($AggroRange.get_overlapping_bodies().find(GM.currentPlayer)!=-1):
		$outlet.rotation = atan2(GM.currentPlayer.global_position.x-global_position.x,global_position.y-GM.currentPlayer.global_position.y)-rotation
		fire_bullet()
	
	notBussy = true

func move():
	var direction = randf()*2*PI
	var distance = 6700
	apply_central_impulse(Vector2(sin(direction),cos(direction)) * distance)
	notBussy = true

func damange():
	HP -=1
	if(HP < 1):
		get_parent().track_progress()
		notBussy = false
		active = false
		$Sprite.visible = false
		$Shadow.visible = false
		$Death.play()
	
func _on_TimerBored_timeout():
	do_stuff()

func wake_up():
	$Sleep.stop()
	active = true
	do_stuff()
	

func _on_HitBox_body_entered(body):
	if (active and (body.get_collision_layer_bit(3) or body.get_collision_layer_bit(5))):
		damange()
		body.pop()
	pass # Replace with function body.


func _on_AggroRange_body_entered(body):
	if(notBussy and active):
		look()
	pass # Replace with function body.


func _on_Death_finished():
	self.queue_free()
	pass # Replace with function body.
