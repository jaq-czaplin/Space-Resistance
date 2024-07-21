class_name Laser extends Node2D

@onready var visible_on_screen_notifier: VisibleOnScreenNotifier2D = $VisibleOnScreenNotifier
@onready var scale_sprite_component: ScaleSpriteComponent = $ScaleSpriteComponent
@onready var flash_sprite_component: FlashSpriteComponent = $FlashSpriteComponent


func _ready() -> void:
	scale_sprite_component.tween_scale()
	flash_sprite_component.flash()
	visible_on_screen_notifier.screen_exited.connect(destroy)

func destroy() -> void:
	queue_free()
