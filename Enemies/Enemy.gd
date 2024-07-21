class_name Enemy extends Node2D

@onready var move_component: MoveComponent = $MoveComponent
@onready var stats_component: StatsComponent = $StatsComponent
@onready var visible_on_screen_notifier: VisibleOnScreenNotifier2D = $VisibleOnScreenNotifier2D
@onready var scale_component: ScaleComponent = $ScaleComponent
@onready var flash_component: FlashComponent = $FlashComponent
@onready var shake_component: ShakeComponent = $ShakeComponent
@onready var hitbox_component: HitboxComponent = $HitboxComponent
@onready var hurtbox_component: HurtboxComponent = $HurtboxComponent

func _ready() -> void:
	visible_on_screen_notifier.screen_exited.connect(destroy)
	hurtbox_component.hurt.connect(hurt)
	stats_component.no_health.connect(destroy)

func destroy() -> void:
	queue_free()

func hurt(hit_box: HitboxComponent) -> void:
	scale_component.tween_scale()
	flash_component.flash()
	shake_component.tween_shake()
