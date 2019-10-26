extends VBoxContainer

#paths to key Nodes

var target_text: RichTextLabel #where the DialogBox is supposed to put the buffered text

var has_text

var print_text = false

var text_color = Color()

var text_font = "res://GameParts/Interface/font_gorg.tres"

var text_buffer = ""

var text_speed = 1.0

var avatar_actor

var avatar_face


func _ready():
	target_text  = $Single/TextBox/RichTextLabel

	showDialog()
	pass # Replace with function body.

#exteranl functions
func loadDialog(text: String,actor: int, face = 0):
	text_buffer = text
	avatar_actor = actor
	avatar_face = face
	update_text()
	pass
	
func showDialog():
	print_all()
	pass
	
func hideDialog():
	pass
	
func clearDialog():
	pass

#internal funcions

func print_all():
	target_text.visible = true
	target_text
	pass

func print_next():
	
	pass

func hide_all():
	target_text.visible = false
	pass

func update_text():
	target_text.set("custom_fonts/normal_font",load(text_font))
	target_text.text = text_buffer
	pass

func _on_TimerTest_timeout():
	match (randi()%4):
		0:
			text_buffer = "yeet!"
		1:
			text_buffer = "skiddadle!"
		2:
			text_buffer = "l33t hax0r 3000"
		3:
			text_buffer = "place holder message"
	update_text()
	showDialog()
	pass # Replace with function body.
