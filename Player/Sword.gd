extends ColorRect

var cursor_position = get_global_mouse_position()
var swordDirection = Vector2()
var angle

func _process(delta):
	"Sword control"
	swordDirection = (cursor_position - global_position).normalized()
	angle = atan2(swordDirection.y, swordDirection.x)

	"Sword Damage"


func _on_area_2d_body_entered(body):
	pass

func _on_area_2d_body_exited(body):
	pass # Replace with function body.
