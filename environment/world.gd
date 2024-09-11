class_name World extends Node2D

var gears_collected: int = 0

@onready var bullet_wrapper: Node2D = $BulletWrapper

func _on_player_bullet_fired(bullet: Bullet) -> void:
	bullet_wrapper.add_child(bullet)

func _on_gear_gear_collected(gear: Gear) -> void:
	gears_collected += gear.amount
