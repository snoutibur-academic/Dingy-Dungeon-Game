extends Node2D

func _ready():
	Game.room = "TstLvl" # Set current level / ID's the level.

"Debug/Test Hurt Button"
func _on_hurt_me_pressed():
	print("Debug Hurt pressed.")
	Game.playerHP -= 10

func _on_save_button_pressed():
	Utils.saveGame()
	print("Debug: Save game")

func _on_add_money_pressed():
	Game.money += 10
	print("Game money is now $" + str(Game.money))
