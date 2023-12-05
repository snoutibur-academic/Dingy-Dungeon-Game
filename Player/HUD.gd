extends CanvasLayer

@onready var  UpgradeMenu = $UpgradeMenu

"Upgrades var"

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

"Upgrade Button!"
func _on_upgrade_attack_button_pressed():
	print(str((Game.money - Game.atkDmgUpgradeCost)))
	if (Game.money) >= Game.atkDmgUpgradeCost:
		Game.money -= Game.atkDmgUpgradeCost
		Game.atkDmgUpgradeCost += round(Game.atkDmgUpgradeCost/4.7)

		Game.plrAtkDmg +=1
	$UpgradeMenu/ColorRect/UpgradeAttackButton.text = "Attack Damage: -$" + str(Game.atkDmgUpgradeCost)