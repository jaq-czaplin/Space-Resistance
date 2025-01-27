class_name Enemy extends Node2D

@onready var move_component: MoveComponent = $MoveComponent
@onready var stats_component: StatsComponent = $StatsComponent
@onready var visible_on_screen_notifier: VisibleOnScreenNotifier2D = $VisibleOnScreenNotifier2D
@onready var scale_component: ScaleComponent = $ScaleComponent
@onready var flash_component: FlashComponent = $FlashComponent
@onready var shake_component: ShakeComponent = $ShakeComponent
@onready var hitbox_component: HitboxComponent = $HitboxComponent
@onready var hurtbox_component: HurtboxComponent = $HurtboxComponent
@onready var destroyed_component: DestroyedComponent = $DestroyedComponent
@onready var score_component: ScoreComponent = $ScoreComponent
@onready var audio_stream_player: VariablePitchAudioStreamPlayer = $VariablePitchAudioStreamPlayer


func _ready() -> void:
	visible_on_screen_notifier.screen_exited.connect(destroy)
	hurtbox_component.hurt.connect(hurt)
	hitbox_component.hit_hurtbox.connect(destroyed_component.destroy.unbind(1)) # Enemy hit player ship
	stats_component.no_health.connect(destroy)
	stats_component.no_health.connect(add_score)

func destroy() -> void:
	queue_free()

func hurt(_hit_box: HitboxComponent) -> void:
	audio_stream_player.play_with_variance()
	scale_component.tween_scale()
	flash_component.flash()
	shake_component.tween_shake()

func add_score() -> void:
	score_component.adjust_score()
