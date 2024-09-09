class_name Enemy extends CharacterBody2D

@export var max_hp: float = 1.0
@export var target: Node2D

@onready var attack_cooldown_timer: Timer = $AttackCooldownTimer
@onready var chase_target: ChaseTarget = $ChaseTarget
@onready var health: Health = $Health
@onready var hitbox: Hitbox = $Hitbox
@onready var hurtbox: Hurtbox = $Hurtbox
@onready var move_character: MoveCharacter = $MoveCharacter

func _ready() -> void:
	health.setup_health(max_hp)
	chase_target.target = target
	
func trigger_death() -> void:
	move_character.move_speed = 0
	hurtbox.set_deferred("monitorable", false)
	await get_tree().create_timer(0.1).timeout
	queue_free()
	
func _on_attack_cooldown_timer_timeout() -> void:
	hitbox.set_deferred("monitoring", true)

func _on_health_no_health() -> void:
	trigger_death()

func _on_hitbox_hurtbox_hit(_hurtbox: Hurtbox) -> void:
	hitbox.set_deferred("monitoring", false)
	attack_cooldown_timer.start()

func _on_hurtbox_hurtbox_hit(_hitbox: Hitbox) -> void:
	health.damage(hitbox.damage)
