class_name Laser extends Node2D

@onready var visible_on_screen_notifier: VisibleOnScreenNotifier2D = $VisibleOnScreenNotifier

func _ready() -> void:
	visible_on_screen_notifier.screen_exited.connect(destroy)

func destroy() -> void:
	queue_free()
