class_name Laser extends Node2D

@onready var visible_on_screen_notifier: VisibleOnScreenNotifier2D = $VisibleOnScreenNotifier
@onready var scale_sprite_component: ScaleSpriteComponent = $ScaleSpriteComponent

func _ready() -> void:
	scale_sprite_component.tween_scale()
	visible_on_screen_notifier.screen_exited.connect(destroy)

func destroy() -> void:
	queue_free()
