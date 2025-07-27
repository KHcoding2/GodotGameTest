extends CharacterBody2D

@export var SPEED = 80
@export var health : float = 100
@onready var animations = $AnimationPlayer

func handle_movment():
	var moveDirection = Input.get_vector("Left", "Right", "Up", "Down")
	velocity = moveDirection * SPEED

func update_Animations():
	var direction = "Down"
	
	if velocity.x == 0:
		if animations.is_playing():
			animations.stop()
	else:
		if velocity.x < 0:
			direction = "Left"
		elif velocity.x > 0:
			direction = "Right"
		elif velocity.y < 0:
			direction = "Up"
		
		animations.play("Idle_" + direction)

func _physics_process(delta: float) -> void:
	handle_movment()
	update_Animations()
	move_and_slide()
