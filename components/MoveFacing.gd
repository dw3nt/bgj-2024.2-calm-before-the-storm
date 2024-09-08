class_name MoveFacing extends Node

enum FacingStart { LEFT, RIGHT }
enum FacingType { MOVE, TARGET }

@export var move_character: MoveCharacter = null
@export var initial_facing: FacingStart = FacingStart.RIGHT
@export var facing_type: FacingType = FacingType.MOVE
@export var sprite: Sprite2D = null
@export var flip_x_nodes: Array[Node2D] = []

var last_x_direction: float = 1
var flipped_direction: bool = false

func _physics_process(_delta: float) -> void:
	if move_character.move_direction.x != 0 && last_x_direction != 0 && sign(move_character.move_direction.x) != sign(last_x_direction):
		flip_nodes()
		
	match facing_type:
		FacingType.MOVE:
			facing_type_move()
			
	last_x_direction = move_character.move_direction.x
	
func facing_type_move() -> void:
	if move_character.move_direction.x != 0:
		if initial_facing == FacingStart.RIGHT:
			sprite.flip_h = move_character.move_direction.x < 0
		elif initial_facing == FacingStart.LEFT:
			sprite.flip_h = move_character.move_direction.x > 0
	
func flip_nodes() -> void:
	for node: Node2D in flip_x_nodes:
		if node.position.x != 0:
			node.position.x *= -1
