extends Node2D


export var fillColor = Color(1.0,1.0,1.0)
export var borderColor = Color(0.0,0.0,0.0)


var BubbleTextScene = load("res://GameParts/BubbleText/BubbleText.tscn")

func addBubble(targetText = "Lorem Ipsum", targetPosition = Vector2(), duration = 2.0):
	var newBubble=BubbleTextScene.instance()
	newBubble.targetText = targetText
	newBubble.position = targetPosition
	newBubble.lifeTime = duration
	newBubble.fillColor = fillColor
	newBubble.borderColor = borderColor
	add_child(newBubble)