extends Node

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

var currentLayer 

# Called when the node enters the scene tree for the first time.
func _ready():
	setShadowCeneter(Vector2(2.0,2.0))
	pass # Replace with function body.

func setShadowCeneter(center):
	$ShadowShader.material.set("shader_param/center",center)

	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
