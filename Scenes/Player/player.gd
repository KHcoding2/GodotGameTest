extends CharacterBody2D

@export var SPEED:int = 80
@export var health:float = 50
@onready var animation_tree = $AnimationTree

var moveDirection:Vector2 = Vector2.ZERO

func _ready():
	animation_tree.active = true

func handle_movment():
	moveDirection = Input.get_vector("Left", "Right", "Up", "Down").normalized()
	velocity = moveDirection * SPEED

func update_Animations():
	if velocity == Vector2.ZERO:
		animation_tree["parameters/conditions/Idle"] = true
		animation_tree["parameters/conditions/Is_moving"] = false
	else:
		animation_tree["parameters/conditions/Idle"] = false
		animation_tree["parameters/conditions/Is_moving"] = true
	
	if moveDirection != Vector2.ZERO:
		animation_tree["parameters/Idle/blend_position"] = moveDirection
		animation_tree["parameters/Walk/blend_position"] = moveDirection

func _physics_process(delta: float) -> void:
	handle_movment()
	update_Animations()
	move_and_slide()
