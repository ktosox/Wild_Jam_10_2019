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

const color0 = Color(0.21,0.7,0.33)

const color1 = Color(0.5,0.25,0.44)

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