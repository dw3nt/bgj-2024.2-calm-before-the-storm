class_name Enemy extends CharacterBody2D

@export var target: Node2D

@onready var chase_target: ChaseTarget = $ChaseTarget

func _ready() -> void:
	chase_target.target = target
