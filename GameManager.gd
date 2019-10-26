extends Node

# Global variables used by multiple scenes

var currentCamera
#screenShake(time)
#fadeOut(time)
#fadeIn(time)
#colorSplash(time, color)



var currentPlayer

var teamPlayer = 3

var currentLevel = 0

var game_colors :Gradient = load("res://game_pallete.tres")

export var color0 = Color (0.0,1.0,0.0)

export var color1 = Color (1.0,0.0,1.0)

export var color_back = Color (0.1,0.1,0.12)

export var color_front = Color (1,1,0.8)

func _ready():
	game_colors = load("res://game_pallete.tres")
	color0 = game_colors.colors[0]#$Color0.color
	color1 = game_colors.colors[1]
	color_front = game_colors.colors[2]
	color_back = game_colors.colors[3]
	#print(color0 ," ", color1 ," ", color_back," ", color_front)
#------------------------------------------------

# Paths to key scenes

var introPath = "res://Key_Scenes/Intro/Intro.tscn"

var creditsPath = "res://Levels/Credits/Credits.tscn"

var mainMenuPath = "res://Key_Scenes/MainMenu/MainMenu.tscn"

var gamePath = "res://Key_Scenes/Game/Game.tscn"

var pauseMenuScene = load("res://GameParts/PauseMenu/PauseMenu.tscn")

var gameOverMenuScene = load("res://GameParts/GameOverMenu/GameOverMenu.tscn")

#------------------------------------------------

# Methods for switching between key scenes

func changeToMainMenu():
	get_tree().change_scene(mainMenuPath)

func changeToGame():
	get_tree().change_scene(gamePath)
	
func changeToCredits():
	get_tree().change_scene(creditsPath)
	
func changeToIntro():
	get_tree().change_scene(introPath)
	
#------------------------------------------------

# Utility functions for in game pop up menus

func pause_game():
	var newPauseMenu = pauseMenuScene.instance()
	currentCamera.add_child(newPauseMenu)
	get_tree().paused = true

func lose_game():
	var newGameOverMenu = gameOverMenuScene.instance()
	currentCamera.add_child(newGameOverMenu)
	get_tree().paused = true



func win_game():
	currentLevel+=1
	resetLevel()
	#ends current level and ptogresses player to next level
	#called by Game scene upon player reaching objective
	

func switchLevel(level):
	currentLevel = level
	resetLevel()

# this requires an overhaul, I guess
func resetLevel():
	match (currentLevel):
		0:
			teamPlayer = 3
			get_tree().change_scene("res://Levels/Introduction/Introduction.tscn")
		1:
			get_tree().change_scene("res://Levels/Spawn/Spawn.tscn")
		2:
			get_tree().change_scene("res://Levels/Cheese/Cheese.tscn")
		3:
			get_tree().change_scene("res://Levels/Warehouse/Warehouse.tscn")
		4:
			changeToCredits()
		5:
			changeToCredits()

# dont forget to change this to return menu on html realease
func end_program():
	get_tree().quit()
	pass