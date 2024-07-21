class_name PlayerInputComponent
extends Node

@export var move_component: MoveComponent
@export var move_stats: MoveStatsResource

func _ready() -> void:
	# TODO: Auto find move component if not set?
	pass

func _process(_delta: float) -> void:
	var move_axies = Input.get_axis("move_left", "move_right")
	move_component.velocity = Vector2(move_axies * move_stats.speed, 0)
