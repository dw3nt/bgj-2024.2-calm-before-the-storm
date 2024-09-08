class_name Gun extends Node2D

const BULLET = preload("res://characters/player/bullet.tscn")

signal bullet_spawned(bullet: Bullet)

@export var shoot_cooldown: float = 2.0

var can_shoot: bool = true

@onready var bullet_spawn_marker: Marker2D = $Sprite2D/BulletSpawnMarker
@onready var shoot_cooldown_timer: Timer = $ShootCooldownTimer
@onready var sprite_2d: Sprite2D = $Sprite2D

func _process(_delta: float) -> void:
	if Input.is_action_pressed("shoot") && can_shoot:
		spawn_bullet()
		can_shoot = false
		shoot_cooldown_timer.start()
		
func spawn_bullet() -> void:
	var bullet: Bullet = BULLET.instantiate()
	bullet.global_position = bullet_spawn_marker.global_position
	bullet.move_direction = (get_global_mouse_position() - bullet.global_position).normalized()
	bullet_spawned.emit(bullet)

func _on_shoot_cooldown_timer_timeout() -> void:
	can_shoot = true
