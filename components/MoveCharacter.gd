class_name MoveCharacter extends MoveNode2D

@export var character: CharacterBody2D = null

func _ready() -> void:
	node2d = character

func _physics_process(_delta: float) -> void:
	character.velocity = move_direction * move_speed
	character.move_and_slide()
