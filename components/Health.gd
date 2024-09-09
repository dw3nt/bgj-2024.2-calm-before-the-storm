class_name Health extends Node

signal max_health_changed(max_hp)
signal health_changed(hp)
signal no_health

@export var max_hp: float = 0

var current_hp: float
	
func setup_health(new_max_hp: float = 0) -> void:
	if new_max_hp != 0:
		max_hp = new_max_hp
	current_hp = max_hp
	
func update_max_hp(increase_amount: float, maintain_damage: bool = true) -> void:
	var current_damage: float = max_hp - current_hp
	max_hp += increase_amount
	if maintain_damage:
		current_hp = max_hp - current_damage
		health_changed.emit(current_hp)
		
	max_health_changed.emit(max_hp)

func damage(amount: float) -> float:
	current_hp = clampf(current_hp - amount, 0.0, max_hp)
	health_changed.emit(current_hp)
	if current_hp <= 0:
		no_health.emit()
		
	return current_hp
