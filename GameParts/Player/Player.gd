extends KinematicBody2D

var bullet_beam_scene = load("res://GameParts/Player/Bullet_Beam.tscn")


var speed = 26
var friction = 0.74
var maxSpeed = 42
var direction = Vector2()
var canMove = true

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _input(event):
	if(event.is_action_pressed("ui_accept")):
		fire_beam()


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
	headVector.x = sin(deg2rad($Head.global_rotation_degrees))
	headVector.y = cos(deg2rad($Head.global_rotation_degrees+180))
	return headVector

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	if(canMove):
		var newDirection = getInput()
		if(newDirection != Vector2(0,0)):
			$Head.update_direction(newDirection)
			if(newDirection.distance_to(get_head_vector().round())<0.7):
				print(get_head_vector().ceil()," : ",newDirection)
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

func skill_charge():
	pass

func skill_dodge():
	pass
	