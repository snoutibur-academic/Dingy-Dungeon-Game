extends CanvasLayer

@onready var  UpgradeMenu = $UpgradeMenu

func _process(delta):
	"Label Updates"
	$HealthLabel.text = "HP: " + str(Game.playerHP) + " / " + str(Game.playerMaxHP)
	$RoomNumberLbl.text = str(Game.room)

"Upgrades"
func _on_upgrade_button_pressed():
	UpgradeMenu.visible = true
func _on_close_menu_pressed():
	UpgradeMenu.visible = false


func _on_button_pressed():
	Utils.saveGame()

