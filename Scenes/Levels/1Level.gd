extends Node2D

var enemy_1 = preload("res://Mobs/Dingy.tscn")

"""
Future proofing code for if we have multiple enemies rather than one
var enemy_list = [
	preload(<EnemySceneHere>)
	preload(<EnemySceneHere>)
]"""

func _on_SpawnTimer_timeout():
	var enemy_instance = enemy_1.instance()
	add_child(enemy_instance)
	enemy_instance.position = $Spawnlocation.position
	
	"""
	Future proofing code for if we have multiple enemies rather than one
	var enemy_spawn = rand_range(0, enemy_list.size)
	var scene = enemy_list[enemy_spawn].instance()
	scene.position = $Spawnlocation.position
	add_child(scene)"""
	
	var nodes = get_tree().get_nodes_in_group("spawn")
	var node = nodes[randi() % nodes.size()]
	var position = node.position
	$Spawnlocation.position = position
