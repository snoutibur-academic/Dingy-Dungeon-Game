class_name Mob extends CharacterBody2D

@onready var Player = get_node("../Player")
var chasing = false
var moveDir = Vector2.ZERO

var playerAttacked = false
var beingAttacked = false

@onready var DeathSound = $DeathSound #Audio player now exists!

@export var health = 50
@export var moveSpeed = 10
@export var mobAtkDamage = 1
@export var moneyDrop = 5

func _ready():
	Game.mobCount += 1

"Movement / Chasing"
func _physics_process(delta):
	if playerAttacked: # Put here so the player will repeatedly take damage.
		Game.playerHP -= mobAtkDamage
		chasing = false # Should patch the enemy gaining speed when against player for extented time (IT DOESN'T)

	if beingAttacked:
		health -= Game.plrAtkDmg

		if health <= 0: # AKA on death
			# DeathSound.play()
			Game.mobCount -= 1
			Game.money += moneyDrop
			self.queue_free()

	if chasing: # Then presue the Player
		moveDir = position.direction_to(Player.position)
		
		#Split movement into X and Y components for move_and_slide.
		velocity.x = moveDir.x * moveSpeed
		velocity.y = moveDir.y * moveSpeed

		move_and_slide()

func _on_player_detection_body_exited(body:Node2D):
	if body.name == "Player":
		chasing = false

func _on_player_detection_body_entered(body:Node2D):
	if body.name == "Player":
		chasing = true

"Deal damage to player and allow player to do damage."
func _on_attack_area_body_entered(body:Node2D):
	if body.name == "Player":
		playerAttacked = true
	
	if body.name == "Sword":
		beingAttacked = true

func _on_attack_area_body_exited(body:Node2D):
	if body.name == "Player":
		playerAttacked = false
		chasing = true

	if body.name == "Sword":
		beingAttacked = false
