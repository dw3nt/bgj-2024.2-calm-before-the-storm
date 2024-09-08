class_name ChaseTarget extends Node

@export var target: Node2D
@export var move_node: MoveNode2D
@export var chase_threshold: float = 60.0
@export var chase_update_delay: float = 0.0

var chase_delay_timer: Timer = Timer.new()

func _ready() -> void:
	if chase_update_delay > 0:
		add_child(chase_delay_timer)
		chase_delay_timer.one_shot = false
		chase_delay_timer.start(chase_update_delay)
		chase_delay_timer.timeout.connect(update_move_direction)

func _process(_delta: float) -> void:
	if chase_update_delay <= 0:
		update_move_direction()
		
	if !is_instance_valid(target):
		move_node.process_mode = Node.PROCESS_MODE_DISABLED
	else:
		move_node.process_mode = Node.PROCESS_MODE_INHERIT
		
func update_move_direction() -> void:
	if is_instance_valid(target):
		update_move_node2d_direction()
		
func update_move_node2d_direction() -> void:
	if target.global_position.distance_to(move_node.node2d.global_position) <= chase_threshold:
		move_node.move_direction = Vector2.ZERO
	else:
		move_node.move_direction = (target.global_position - move_node.node2d.global_position).normalized()
