extends Node2D

@onready var ammo_label: Label = $UI/PlayerStats/AmmoLabel
@onready var reloading_label: Label = $UI/PlayerStats/ReloadingLabel

func _process(delta: float) -> void:
	ammo_label.text = "Ammo: " + str(PlayerStats.Ammo)
	if PlayerStats.reloading:
		reloading_label.visible = true
	else:
		reloading_label.visible = false
