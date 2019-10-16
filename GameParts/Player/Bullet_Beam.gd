extends RigidBody2D

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

# Called when the node enters the scene tree for the first time.
func _ready():
	linear_velocity = 600.0 * Vector2(sin(deg2rad(global_rotation_degrees)),cos(deg2rad(global_rotation_degrees+180)))
	pass # Replace with function body.


func pop():
	self.queue_free()
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_TimerLifeTime_timeout():
	pop()
	pass # Replace with function body.
