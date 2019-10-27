extends KinematicBody2D


var bullet_wave_scene = load("res://GameParts/Player/Bullet_Wave.tscn")

var HP = 4
var speed = 60
var friction = 0.19
var maxSpeed = 34
var direction = Vector2()
var canMove = true
var canFire = true

var invunrability = false
var bullet_ready = true
var skill_1_ready = true #dodge / roll on CD
var skill_flash_ready = true #slash on CD

# Called when the node enters the scene tree for the first time.
func _ready():
	GM.currentPlayer = self
	GM.currentCamera = $CameraOperator
	updateTeam()
	pass # Replace with function body.


func updateTeam():
	if(GM.teamPlayer == 0):
		$Head.modulate = GM.color0
		$HitBox.set_collision_mask_bit(2,true)
		$HitBox.set_collision_mask_bit(3,true)
	if(GM.teamPlayer == 1):
		$Head.modulate = GM.color1
		$HitBox.set_collision_mask_bit(4,true)
		$HitBox.set_collision_mask_bit(5,true)
		
func _input(event):
	if(event.is_action_pressed("ui_cancel")):
		GM.pause_game()
	if(event.is_action_pressed("player_attack")):
		if(bullet_ready and canFire):
			bullet_ready = false
			$TimerAttack.start()
			$Head.fire_beam()
	if(event.is_action_pressed("player_flash")):
		if(skill_flash_ready):
			skill_flash_ready = false
			$TimerFlash.start()
			skill_flash()
	if(event.is_action_pressed("player_skill1")):
		if(skill_1_ready):
			skill_dodge()

func getInput():
	var newDirection = Vector2()
	if(Input.is_action_pressed("ui_down")):
		newDirection += Vector2(0,1)
	if(Input.is_action_pressed("ui_up")):
		newDirection += Vector2(0,-1)
	if(Input.is_action_pressed("ui_left")):
		newDirection += Vector2(-1,0)
	if(Input.is_action_pressed("ui_right")):
		newDirection += Vector2(1,0)
	return newDirection

func get_head_vector():
	var headVector = Vector2()
	headVector.x = round(sin(deg2rad($Head.global_rotation_degrees)))
	headVector.y = round(cos(deg2rad($Head.global_rotation_degrees+180)))
	return headVector

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	if(canMove):
		var newDirection = getInput()
		if(newDirection != Vector2(0,0)):
			$Head.update_direction(newDirection)
			if(newDirection.distance_to(get_head_vector().round())<0.79):
				#print(get_head_vector().ceil()," : ",newDirection)
				if(newDirection.y == -1):
					$effect4.region_rect.position.x = 128
				else:
					$effect4.region_rect.position.x = 0
				if(newDirection.x != 0):
					$effect4.region_rect.position.x = 64
				if(newDirection.x ==1):
					$effect4.scale.x = 1.0
				if(newDirection.x == -1):
					$effect4.scale.x = -1.0
				direction += Vector2(newDirection.x/newDirection.length(),newDirection.y/newDirection.length())
			else:
				direction += (newDirection *0.3)
		if(direction.length()>maxSpeed):
			direction -= direction * friction *3
		else:
			direction -= direction * friction 
		#direction.x = clamp(direction.x,-maxSpeed,maxSpeed)
		#direction.y = clamp(direction.y,-maxSpeed,maxSpeed)
		move_and_slide(direction * speed)



func invunrableStart():
	invunrability = true

func invunrableStop():
	invunrability = false
	
	
func skill_charge():
	print("charge")
	pass

func skill_dodge():
	print("dodge")
	pass
	
	
func skill_flash():
	print("flash")
	$CameraOperator.colorSplash(1.2)
	$Flash.play()
	$Flash1/Animate.play("Flash")
	$Flash2/Animate.play("Flash")
	pass

func damange():
	HP-=1
	if(HP<1):
		GM.lose_game()
	print("oof")
	invunrableStart()
	$CameraOperator.screenShake(0.8)
	$DamangeAnimator.play("blink")
	pass

func _on_HitBox_body_entered(body):
	if((body.get_collision_layer_bit(3) and GM.teamPlayer == 0) or (body.get_collision_layer_bit(5) and GM.teamPlayer == 1)):
		#this is a bullet
		if(!invunrability):
			damange()
			body.pop()
	if((body.get_collision_layer_bit(2) and GM.teamPlayer == 0 ) or (body.get_collision_layer_bit(4) and GM.teamPlayer == 1)):
		#this is a dude
		if(!invunrability):
			damange()


func enter_gate():
	invunrableStart()
	canMove = false
	$ExitLevel.play("anim")
	$CameraOperator.fadeOut(2.0)
	pass

func end_level():
	GM.win_game()

func _on_TimerAttack_timeout():
	bullet_ready = true
	$Head/outlet/CPUParticles2D.visible = true
	$Head/outlet/CPUParticles2D.emitting = true
	if(Input.is_action_pressed("player_attack")):
		$Head.fire_beam()
		bullet_ready = false
		$TimerAttack.start()
	pass # Replace with function body.


func _on_TimerFlash_timeout():
	skill_flash_ready = true
	pass # Replace with function body.
