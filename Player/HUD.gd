extends CanvasLayer
@onready var  UpgradeMenu = $UpgradeMenu

func _ready():
	"Set upgrade menu button values"
	$UpgradeMenu/ColorRect/UpgradeAttackButton.text = "Attack Damage: -$" + str(Game.atkDmgUpgradeCost)
	$UpgradeMenu/ColorRect/SpeedUpgradeButton.text = "5 speed for -$" + str(Game.speedUpgradeCost)
	$UpgradeMenu/ColorRect/BuyHealthButton.text = "Heal " + str(Game.healAmount) + "HP for -$" + str(Game.healCost) 

func _process(delta):
	$UpgradeMenu/ColorRect/BuyHealthButton.text = "Heal " + str(Game.healAmount) + "HP for -$" + str(Game.healCost)

func _on_button_pressed():
	Utils.saveGame()

"Upgrades menu"
func _on_upgrade_button_pressed():
	UpgradeMenu.visible = true
func _on_close_menu_pressed():
	UpgradeMenu.visible = false

func _on_upgrade_attack_button_pressed():
	if (Game.money) >= Game.atkDmgUpgradeCost:
		Game.money -= Game.atkDmgUpgradeCost
		Game.atkDmgUpgradeCost += round(Game.atkDmgUpgradeCost/4.7)

		Game.plrAtkDmg +=1
	$UpgradeMenu/ColorRect/UpgradeAttackButton.text = "Attack Damage: -$" + str(Game.atkDmgUpgradeCost)

func _on_speed_upgrade_button_pressed():
	if (Game.money) >= Game.speedUpgradeCost:

		Game.money -= Game.speedUpgradeCost
		Game.speedUpgradeCost += round(Game.speedUpgradeCost * 1.5 * Game.wave)
		Game.speedUpgradeCost = Game.wave * 5

		Game.playerSpeed += 10
	
	$UpgradeMenu/ColorRect/SpeedUpgradeButton.text = "5 speed for -$" + str(Game.speedUpgradeCost)

func _on_buy_health_button_pressed():
	if (Game.money) >= Game.healCost:

		Game.money -= Game.healCost
		Game.healCost = round(5 * Game.wave)
		Game.healAmount = Game.wave * 5

		Game.playerHP += Game.healAmount