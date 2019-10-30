extends VBoxContainer

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func lose_health():
	if($StatBox/Health/HBoxContainer/ColorRect3.color.a == 1.0):
		$StatBox/Health/HBoxContainer/ColorRect3.color.a = 0.0
	elif($StatBox/Health/HBoxContainer/ColorRect2.color.a == 1.0):
		$StatBox/Health/HBoxContainer/ColorRect2.color.a = 0.0
	elif($StatBox/Health/HBoxContainer/ColorRect.color.a == 1.0):
		$StatBox/Health/HBoxContainer/ColorRect.color.a = 0.0
