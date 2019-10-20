extends Node2D

# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var enemies = 3
var not_started = true
# Called when the node enters the scene tree for the first time.
func _ready():

	pass # Replace with function body.
func _input(event):
	if(event.is_action_pressed("player_flash") and not_started):
		not_started = false
		$SpringySam2.wake_up()
		$SpringySam3.wake_up()
		$SpringySam.wake_up()
		$SpringySam4.wake_up()
		$JumpingJeffrey.wake_up()
		$JumpingJeffrey2.wake_up()
		$JumpingJeffrey3.wake_up()
		$JumpingJeffrey4.wake_up()
		$JumpingJeffrey5.wake_up()
		$JumpingJeffrey6.wake_up()
		
func track_progress():
	enemies -= 1
	if (enemies < 1 ):
		$Gate_North.open_gate()
	pass
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
