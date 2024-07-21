class_name EnemyGenerator extends Node2D

@onready var green_enemy_spawn_timer: Timer = $GreenEnemySpawnTimer
@onready var enemy_spawner_component: SpawnerComponent = $EnemySpawnerComponent

@export var green_enemy_scene: PackedScene

@export var margin: float = 10;
@export var y_spawn_position: float = -16

var left_edge: float = 0;
var right_edge: float = ProjectSettings.get_setting("display/window/size/viewport_width")

func _ready() -> void:
	green_enemy_spawn_timer.timeout.connect(spawn_enemy.bind(green_enemy_scene, green_enemy_spawn_timer))

func spawn_enemy(enemy_scene: PackedScene, timer: Timer) -> void:
	enemy_spawner_component.scene = enemy_scene
	enemy_spawner_component.spawn(Vector2(randf_range(left_edge + margin, right_edge - margin), y_spawn_position))
	timer.start()
