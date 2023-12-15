extends CharacterBody2D

@export var move_speed = Game.playerSpeed
@onready var anim = $AnimatedSprite2D

var swordDirection = Vector2()

func _ready():
	# anim.play("idle")
	pass

func _physics_process(delta):
	"Player movement"
	# Get player movement direction.
	var inDir = Vector2 (
		Input.get_action_strength("right") - Input.get_action_strength("left"),
		Input.get_action_strength("down") - Input.get_action_strength("up")
	)
	# Velocity Update
	velocity = inDir * move_speed
	move_and_slide()

	swordDirection = lerp(swordDirection, get_global_mouse_position(), .3)
	look_at(swordDirection)

	"Death"
	if Game.playerHP <= 0:
		death()

func death():
	queue_free()
	Game.money = 0
	get_tree().change_scene_to_file("res://Scenes/Death/Death.tscn")
