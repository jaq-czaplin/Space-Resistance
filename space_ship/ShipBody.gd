class_name ShipBody extends Node2D

@export var move_component: MoveComponent
@onready var animated_sprite: AnimatedSprite2D = $AnimatedSprite2D
@onready var flame_animated_sprite: AnimatedSprite2D = $FlameAnimatedSprite2D

func _process(_delta: float) -> void:
	if move_component.velocity.x < 0:
		animated_sprite.play("fly_left")
		flame_animated_sprite.play("left")
	elif move_component.velocity.x > 0:
		animated_sprite.play("fly_right")
		flame_animated_sprite.play("right")
	else:
		animated_sprite.play("fly")
		flame_animated_sprite.play("center")
