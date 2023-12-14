extends Node2D

var spawn = false

const window_size = Vector2(1440,810)
var location = Vector2()

var packed_scene = [
	preload("res://Mobs/Dingy.tscn")
]

func _on_spawn_timer_timeout():
	for i in range(randi_range(10,51)):
		print(i)
		randomize()
		var x = randi() % packed_scene.size()
		location.x = randi_range(-260,280)
		location.y = randi_range(-260,280)
		var scene = packed_scene[x].instantiate()
		scene.position = location
		add_child(scene)