extends CanvasLayer

func _ready():
	pass # Replace with function body.

func _process(delta):
	"Label Updates"
	$HealthLabel.text = "HP: " + str(Game.playerHP) + " / " + str(Game.playerMaxHP)
	$RoomNumberLbl.text = str(Game.room)
