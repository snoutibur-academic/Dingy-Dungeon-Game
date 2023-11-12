extends CharacterBody2D

@export var move_speed = 100
@onready var anim = $AnimatedSprite2D
@export var health = 100

# Called when the node enters the scene tree for the first time.
func _ready():
	# anim.play("idle")
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _physics_process(delta):
		# -- Get input direction --
		var inDir = Vector2 (
			Input.get_action_strength("right") - Input.get_action_strength("left"),
			Input.get_action_strength("down") - Input.get_action_strength("up")
		)

		# -- Velocity Update --
		velocity = inDir * move_speed

		# -- Move and Slide --
		move_and_slide()

		# # -- Animate --
		# if inDir == -1:
		# 	anim.flip_h = true
		# elif inDir == 1:
		# 	anim.flip_h = false		