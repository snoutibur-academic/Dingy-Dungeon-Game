extends CharacterBody2D

@export var move_speed = 40
@onready var anim = $AnimatedSprite2D

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

	"Death"
	if Game.playerHP <= 0:
		queue_free()
		get_tree().change_scene_to_file("res://Scenes/Death/Death.tscn")

	"Animation"
	# # -- Animate --
	# if inDir == -1:
	# 	anim.flip_h = true
	# elif inDir == 1:
	# 	anim.flip_h = false

func death():
	pass
