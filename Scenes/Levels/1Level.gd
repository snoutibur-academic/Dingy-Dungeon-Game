extends Node2D
const window_size = Vector2(1440,810)
var location = Vector2()
var packed_scene = [
	preload("res://Mobs/Dingy.tscn")
]

func _process(delta):
	pass
	

#var enemy_1 = preload("res://Mobs/Dingy.tscn")


func _on_spawn_timer_timeout():
	for i in range(randi_range(10,51)):
		print(i)
		randomize()
		var x = randi() % packed_scene.size()
		location.x = randi_range(1,window_size.x)
		location.y = randi_range(1,window_size.y)
		var scene = packed_scene[x].instantiate()
		scene.position = location
		add_child(scene)
