class_name LaserProjectile extends Node2D

@onready var visible_on_screen_notifier: VisibleOnScreenNotifier2D = $VisibleOnScreenNotifier
@onready var scale_component: ScaleComponent = $ScaleComponent
@onready var flash_component: FlashComponent = $FlashComponent
@onready var hitbox_component: HitboxComponent = $HitboxComponent


func _ready() -> void:
	scale_component.tween_scale()
	flash_component.flash()
	visible_on_screen_notifier.screen_exited.connect(destroy)
	# hit_hurtbox signal expects callback to take one argument. 
	# Using unbind(1) "unbinds" 1 argument from callback call
	hitbox_component.hit_hurtbox.connect(destroy.unbind(1))  

func destroy() -> void:
	queue_free()
