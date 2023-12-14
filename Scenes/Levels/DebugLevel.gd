extends Node2D

func _ready():
	Game.wave = "TstLvl" # Set current level / ID's the level.

func _on_add_money_pressed():
	Game.money += 10
	print("Game money is now $" + str(Game.money))
