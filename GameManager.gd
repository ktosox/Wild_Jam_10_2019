extends Node

# Global variables used by multiple scenes

var currentCamera
#screenShake(time)
#fadeOut(time)
#fadeIn(time)
#colorSplash(time, color)

var currentPlayer

var currentLevel = 1

#------------------------------------------------

# Paths to key scenes

var introPath = "res://Key_Scenes/Intro/Intro.tscn"

var creditsPath = "res://Key_Scenes/Credits/Credits.tscn"

var mainMenuPath = "res://Key_Scenes/MainMenu/MainMenu.tscn"

var gamePath = "res://Key_Scenes/Game/Game.tscn"

var pauseMenuScene = load("res://Game_Parts/PauseMenu/PauseMenu.tscn")

var gameOverMenuScene = load("res://Key_Scenes/GameOverMenu/GameOverMenu.tscn")

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



func win_game(caller):
	currentLevel+=1
	changeToGame()
	caller.free()
	#ends current level and ptogresses player to next level
	#called by Game scene upon player reaching objective
	

func switchLevel():
	currentLevel += 1
	resetLevel()

# this requires an overhaul, I guess
func resetLevel():
	pass

# dont forget to change this to return menu on html realease
func end_program():
	get_tree().quit()
	pass