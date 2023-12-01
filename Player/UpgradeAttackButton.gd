extends Button

var cost = 10

func _process(delta):
	self.text = "Attack Damage - $" + str(cost)

func _on_pressed():
	if Game.money >= cost:
		Game.money -= cost
		Game.plrAtkDmg +=1
		cost += round(cost/4.7)
