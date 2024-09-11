class_name Gear extends Area2D

signal gear_collected

@export var max_move_speed: float = 1000
@export var amount: int = 1

@onready var chase_target: ChaseTarget = $ChaseTarget
@onready var move_node_2d: MoveNode2D = $MoveNode2D

func _process(_delta: float) -> void:
	if is_instance_valid(chase_target.target):
		move_node_2d.move_speed = lerp(move_node_2d.move_speed, max_move_speed, 0.05)
		
func _on_body_entered(_body: Node2D) -> void:
	gear_collected.emit(self)
	queue_free()

func _on_pickup_detect_body_entered(body: Node2D) -> void:
	chase_target.target = body
