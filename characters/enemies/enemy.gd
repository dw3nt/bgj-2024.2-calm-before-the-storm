class_name Enemy extends CharacterBody2D

@export var max_hp: float = 1.0
@export var target: Node2D

var hp: float

@onready var chase_target: ChaseTarget = $ChaseTarget
@onready var hurtbox: Hurtbox = $Hurtbox
@onready var move_character: MoveCharacter = $MoveCharacter

func _ready() -> void:
	chase_target.target = target
	
func trigger_death() -> void:
	move_character.move_speed = 0
	hurtbox.set_deferred("monitorable", false)
	await get_tree().create_timer(0.1).timeout
	queue_free()

func _on_hurtbox_hurtbox_hit(hitbox: Hitbox) -> void:
	hp -= hitbox.damage
	if hp <= 0:
		trigger_death()
