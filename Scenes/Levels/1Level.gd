extends Node2D

#var enemy_1 = preload("res://Mobs/Dingy.tscn")

"""
Future proofing code for if we have multiple enemies rather than one
var enemy_list = [
	preload(<EnemySceneHere>)
	preload(<EnemySceneHere>)
]"""

"""func _on_SpawnTimer_timeout():
	var enemy_instance = enemy_1.instance()
	add_child(enemy_instance)
	enemy_instance.position = $Spawnlocation.position
	

	Future proofing code for if we have multiple enemies rather than one
	var enemy_spawn = rand_range(0, enemy_list.size)
	var scene = enemy_list[enemy_spawn].instance()
	scene.position = $Spawnlocation.position
	add_child(scene)
	
	var nodes = get_tree().get_nodes_in_group("spawn")
	var node = nodes[randi() % nodes.size()]
	var position = node.position
	$Spawnlocation.position = position
"""


var enemy_scene : PackedScene
var spawn_locations : Array = []  # Array to hold the Marker2D nodes
var spawn_interval : float = 2.0

func _ready():
	# Set export variables
	enemy_scene = preload("res://Mobs/Dingy.tscn")
	spawn_locations = [$Marker2D, $Marker2D2, $Marker2D3]

	# Connect the SpawnTimer's timeout signal to the function for spawning
	#$spawn_timer.connect("timeout", self, "_on_spawn_timer_timeout")
	$spawn_timer.timeout.connect(func() : "_on_spawn_timer_timeout")

	# Set the SpawnTimer's wait time
	$spawn_timer.wait_time = spawn_interval

	# Start the SpawnTimer
	$spawn_timer.start()

func _on_spawn_timer_timeout():
	print("Spawning enemy...")
	# Ensure that spawn_location is a valid instance
	if spawn_locations:
		# Randomly choose one marker point
		var chosen_location = spawn_locations[randi() % spawn_locations.size]

		# Ensure that chosen_location is a valid instance
		if chosen_location:
		# Instance the enemy scene
			var enemy_instance = enemy_scene.instance()

		
		"NEED TO PUT IN SIZE PERAMETER FOR ARRAY???"
		# Set the position of the instance to the chosen spawn point
		enemy_instance.global_position = chosen_location.global_position
		# Add the instance to the scene
		add_child(enemy_instance)

		# Restart the SpawnTimer for the next spawn
		$spawn_timer.start()
	else:
		#print("Error: spawn_location is not a valid instance.")
		print("Error: chosen_location is not a valid instance.")
