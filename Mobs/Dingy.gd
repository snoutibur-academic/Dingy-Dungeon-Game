extends CharacterBody2D

var player
var chasing = false
@export var SPEED =100


func _physics_process(delta):
	player = get_node("../Player") # Find da player
	if chasing: # Then presue the player
		var direction = (player.position - self.position).normalized()
	else: # Just chill there
		pass

func _on_player_detection_body_exited(body:Node2D):
	if body.name == "Player":
		chasing = false
		print("not chasein")
func _on_player_detection_body_entered(body:Node2D):
	if body.name == "Player":
		chasing = true
		print("cahsaigsd")