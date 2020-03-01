extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():


	for i in 4:
		var copy = $CanvasLayer/TileMap.duplicate()
		var layer = CanvasLayer.new()
		layer.follow_viewport_enable = true
		layer.follow_viewport_scale = 1 + (1+i)*0.02
		layer.layer =2+i
		print(layer.follow_viewport_scale)
		add_child(layer)
		layer.add_child(copy)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
