extends CharacterBody2D

var Player = null
var chasing = false
var moveDir = Vector2.ZERO

@export var moveSpeed = 250


func _physics_process(delta):
	Player = get_node("../Player") # Find da Player

	if chasing: # Then presue the Player
		moveDir = position.direction_to(Player.position)
		velocity.x = moveDir.x * moveSpeed
		velocity.y = moveDir.y * moveSpeed

	move_and_slide()

func _on_player_detection_body_exited(body:Node2D):
	if body.name == "Player":
		chasing = false
		print("not chasein")

func _on_player_detection_body_entered(body:Node2D):
	if body.name == "Player":
		chasing = true
		print("cahsaigsd")