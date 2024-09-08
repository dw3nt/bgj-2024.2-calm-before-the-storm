class_name Bullet extends Area2D

var move_direction: Vector2 = Vector2.ZERO

@onready var move_node_2d: MoveNode2D = $MoveNode2D

func _ready() -> void:
	move_node_2d.move_direction = move_direction
