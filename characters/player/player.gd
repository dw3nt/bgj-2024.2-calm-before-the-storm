class_name Player extends CharacterBody2D

signal bullet_fired(bullet: Bullet)

@export var max_hp: float = 3.0

@onready var gun: Gun = $Gun
@onready var health: Health = $Health

func _ready() -> void:
	health.setup_health(max_hp)

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

func _on_health_no_health() -> void:
	queue_free()

func _on_hurtbox_hurtbox_hit(hitbox: Hitbox) -> void:
	health.damage(hitbox.damage)
