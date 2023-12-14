extends Node2D

@onready var SpawnerTimer = $SpawnTimer

const window_size = Vector2(1440,810)
var location = Vector2()

var packed_scene = [
	preload("res://Mobs/Dingy.tscn")
]

func _on_spawn_timer_timeout():
	if Game.mobCount == 0:
		Game.wave += 1
		Game.waveDifficultyMultiplier *= 1.2
		Game.dingyFunny *= 1.5
		ceil(Game.dingyFunny)

		for i in range(randi_range(10+Game.dingyFunny,51 + Game.dingyFunny)):
			print(i)
			randomize()
			var x = randi() % packed_scene.size()
			location.x = randi_range(-260,280)
			location.y = randi_range(-260,280)
			var scene = packed_scene[x].instantiate()
			scene.position = location
			add_child(scene)
