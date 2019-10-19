extends KinematicBody2D

var bullet_beam_scene = load("res://GameParts/Player/Bullet_Beam.tscn")
var bullet_wave_scene = load("res://GameParts/Player/Bullet_Wave.tscn")

var speed = 60
var friction = 0.74
var maxSpeed = 42
var direction = Vector2()
var canMove = true

var invunrability = false

var skill_1_ready = true #dodge / roll on CD
var skill_flash_ready = true #slash on CD

# Called when the node enters the scene tree for the first time.
func _ready():
	GM.currentCamera = $CameraOperator
	pass # Replace with function body.

func _input(event):
	if(event.is_action_pressed("ui_cancel")):
		GM.pause_game()
	if(event.is_action_pressed("player_attack")):
		fire_beam()
	if(event.is_action_pressed("player_flash")):
		if(skill_flash_ready):
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
			if(newDirection.distance_to(get_head_vector().round())<0.3):
				#print(get_head_vector().ceil()," : ",newDirection)
				direction += newDirection 
		direction *= friction
		direction.x = clamp(direction.x,-maxSpeed,maxSpeed)
		direction.y = clamp(direction.y,-maxSpeed,maxSpeed)
		move_and_slide(direction * speed)

func fire_beam():
	var bullet = bullet_beam_scene.instance()
	bullet.global_position = global_position
	bullet.rotation = $Head.rotation
	get_parent().add_child(bullet)
	pass

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
	$Flash1/Animate.play("Flash")
	pass

func damange():
	print("ouch")
	$DamangeAnimator.play("blink")
	pass

func _on_HitBox_body_entered(body):
	if(body.get_collision_layer_bit(3) or body.get_collision_layer_bit(5)):
		#this is a bullet
		if(!invunrability):
			damange()
			body.pop()
	if(body.get_collision_layer_bit(2) or body.get_collision_layer_bit(4)):
		#this is a dude
		if(!invunrability):
			damange()



