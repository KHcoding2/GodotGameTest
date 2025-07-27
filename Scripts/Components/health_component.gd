extends Node


@export var max_health : float 
@export var health_regen : float
@export var Entity : CharacterBody2D 

var current_health : float
var is_dead : bool = false
var is_low : bool = false

func _ready() -> void:
	current_health = max_health
	if current_health <= 0 :
		is_dead = true
	if current_health <= max_health / 4 :
		is_low = true

func take_damage(amount : float):
	pass
func add_health(amount : float ):
	pass
func regenerate_health(amount : float):
	pass
