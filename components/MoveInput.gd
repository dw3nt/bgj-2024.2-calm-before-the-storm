class_name MoveInput extends Node

@export var move_character: MoveCharacter = null

func _physics_process(_delta: float) -> void:
	var move_direction = Input.get_vector("move_left", "move_right", "move_up", "move_down")
	move_character.move_direction = move_direction.normalized()
