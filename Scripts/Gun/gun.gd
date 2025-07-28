extends Node2D

const Bullet = preload("res://Scenes/Gun/bullet.tscn")

func _process(delta: float) -> void:
	look_at(get_global_mouse_position())
	
	rotation_degrees = wrap(rotation_degrees, 0, 360)
	if rotation_degrees > 90 and rotation_degrees < 270:
		scale.y = -0.85
	else:
		scale.y = 0.85
	
	if Input.is_action_just_pressed("Fire") and PlayerStats.Ammo > 0:
		PlayerStats.Ammo -= 1
		var bullet_instance = Bullet.instantiate()
		get_tree().root.add_child(bullet_instance)
		bullet_instance.global_position = $Marker2D.global_position
		bullet_instance.rotation = rotation
	elif PlayerStats.Ammo <= 0 and not PlayerStats.reloading:
		PlayerStats.reloading = true
		var tween = get_tree().create_tween()
		tween.tween_property($Sprite2D, "modulate", Color.INDIAN_RED, 1)
		await get_tree().create_timer(2).timeout
		tween = get_tree().create_tween()
		tween.tween_property($Sprite2D, "modulate", Color.WHITE, 1)
		PlayerStats.Ammo = 15
		PlayerStats.reloading = false
	
