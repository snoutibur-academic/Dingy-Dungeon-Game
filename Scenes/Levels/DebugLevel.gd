extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	Game.room = "TstLvl"

"Debug/Test Hurt Button"
func _on_hurt_me_pressed():
	print("Debug Hurt pressed.")
	Game.playerHP -= 10
