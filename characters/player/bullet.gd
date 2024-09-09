class_name Bullet extends Node2D

@export var delete_delay: float = 0.015

var delay_time: float = 0.0
var move_direction: Vector2 = Vector2.ZERO

@onready var move_node_2d: MoveNode2D = $MoveNode2D

func _ready() -> void:
	move_node_2d.move_direction = move_direction
	
func _process(delta: float) -> void:
	if delay_time > 0.0:
		delay_time -= delta
		
		if delay_time <= 0.0:
			queue_free()

func _on_hitbox_hurtbox_hit(_hurtbox: Hurtbox) -> void:
	delay_time = delete_delay
