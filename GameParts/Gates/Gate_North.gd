extends Node2D

# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var is_open = false
# Called when the node enters the scene tree for the first time.
func _ready():
	
	pass # Replace with function body.

func open_gate():
	$Door.visible = false
	is_open = true
	
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_ExitPoint_body_entered(body):
	if(is_open):
		body.enter_gate()
	else:
		$BubbleTextGenerator.addBubble("THE GATE IS CLOSED",Vector2(0,-20))
		$BubbleTextGenerator.addBubble("YOU MUST CLEAR THE LEVEL FIRST",Vector2(),5.0)
	pass # Replace with function body.
