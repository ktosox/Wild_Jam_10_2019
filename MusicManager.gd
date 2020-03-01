extends Node

var musicList = [
	"res://Resources/Audio/GDC2018/Drone,Resonant,Bed,Solemn,Mystical with Ring,Accents,Prominent,Squeaky or Gong,Loop.ogg",
	"res://Resources/Audio/GDC2019/Melancholy Texture A 3.ogg",
	"res://Resources/Audio/GDC2019/Melancholy Texture D 4.ogg"
	]

# Called when the node enters the scene tree for the first time.
func _ready():
	#_on_MusicPlayer_finished()
#	if(AudioServer.is_bus_mute(AudioServer.get_bus_index("Music"))):
#		$MusicPlayer.free()
#	else:
#		_on_MusicPlayer_finished()
	pass # Replace with function body.

func play_defeat():
	$MusicPlayer.stop()
	$Defeat.play()

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_MusicPlayer_finished():
	$MusicPlayer.stream = load(musicList[randi()%musicList.size()])
	$MusicPlayer.play(0.0)


func _on_Defeat_finished():
	_on_MusicPlayer_finished()
	pass # Replace with function body.
