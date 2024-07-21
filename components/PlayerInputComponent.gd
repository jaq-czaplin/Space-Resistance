class_name PlayerInputComponent
extends Node

@export var move_component: MoveComponent

func _ready() -> void:
	# TODO: Auto find move component if not set?
	pass

func _process(_delta: float) -> void:
	var move_axies = Input.get_axis("move_left", "move_right")
	move_component.velocity = Vector2(move_axies * 50, 0)
