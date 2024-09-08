class_name Player extends CharacterBody2D

signal bullet_fired(bullet: Bullet)

@onready var gun: Gun = $Gun

func _process(_delta: float) -> void:
	aim_gun()

func aim_gun() -> void:
	var mouse_pos: Vector2 = get_global_mouse_position()
	gun.look_at(mouse_pos)
	if global_position.x > mouse_pos.x:
		gun.sprite_2d.scale.y = -0.1
		gun.position.x = -26
	else:
		gun.sprite_2d.scale.y = 0.1
		gun.position.x = 26

func _on_gun_bullet_spawned(bullet: Bullet) -> void:
	bullet_fired.emit(bullet)
