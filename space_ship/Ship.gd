class_name Ship
extends Node2D

@onready var canon_left: Marker2D = $CanonLeft
@onready var canon_right: Marker2D = $CanonRight
@onready var spawner_component: SpawnerComponent = $SpawnerComponent
@onready var canon_fire_timer: Timer = $CanonFireTimer
@onready var scale_sprite_component: ScaleSpriteComponent = $ScaleSpriteComponent

func _ready() -> void:
	canon_fire_timer.timeout.connect(fire_canons)

func fire_canons() -> void:
	spawner_component.spawn(canon_left.global_position, get_parent())
	spawner_component.spawn(canon_right.global_position, get_parent())
	scale_sprite_component.tween_scale()
