class_name MoveComponent extends Node

@export var actor: Node2D
@export var velocity: Vector2

func _ready():
	# if actor is not set use parent node
	if not actor: actor = get_parent()

func _process(delta: float) -> void:
	actor.translate(velocity * delta)
