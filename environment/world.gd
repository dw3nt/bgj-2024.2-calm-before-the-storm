class_name World extends Node2D

@onready var bullet_wrapper: Node2D = $BulletWrapper

func _on_player_bullet_fired(bullet: Bullet) -> void:
	bullet_wrapper.add_child(bullet)
