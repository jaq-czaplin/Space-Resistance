class_name EnemyGenerator extends Node2D

@onready var green_enemy_spawn_timer: Timer = $GreenEnemySpawnTimer
@onready var yellow_enemy_spawn_timer: Timer = $YellowEnemySpawnTimer
@onready var pink_enemy_spawn_timer: Timer = $PinkEnemySpawnTimer
@onready var enemy_spawner_component: SpawnerComponent = $EnemySpawnerComponent

@export var game_stats: GameStats

@export var green_enemy_scene: PackedScene
@export var green_enemy_base_spawn_time: float = 1

@export var yellow_enemy_scene: PackedScene
@export var yellow_enemy_base_spawn_time: float = 30
@export var yellow_enemy_spawn_start_on_score = 50

@export var pink_enemy_scene: PackedScene
@export var pink_enemy_base_spawn_time: float = 60
@export var pink_enemy_spawn_start_on_score = 100


@export var margin: float = 10;
@export var y_spawn_position: float = -16

var left_edge: float = 0;
var right_edge: float = ProjectSettings.get_setting("display/window/size/viewport_width")

func _ready() -> void:
	green_enemy_spawn_timer.timeout.connect(spawn_enemy.bind(green_enemy_scene, green_enemy_spawn_timer, green_enemy_base_spawn_time))
	yellow_enemy_spawn_timer.timeout.connect(spawn_enemy.bind(yellow_enemy_scene, yellow_enemy_spawn_timer, yellow_enemy_base_spawn_time))
	pink_enemy_spawn_timer.timeout.connect(spawn_enemy.bind(pink_enemy_scene, pink_enemy_spawn_timer, pink_enemy_base_spawn_time))
	game_stats.score_changed.connect(func(score: int):
		if score > yellow_enemy_spawn_start_on_score:
			yellow_enemy_spawn_timer.process_mode = Node.PROCESS_MODE_INHERIT
		if score > pink_enemy_spawn_start_on_score:
			pink_enemy_spawn_timer.process_mode = Node.PROCESS_MODE_INHERIT
	)

func spawn_enemy(enemy_scene: PackedScene, timer: Timer, time_offset: float = 1.0) -> void:
	enemy_spawner_component.scene = enemy_scene
	enemy_spawner_component.spawn(Vector2(randf_range(left_edge + margin, right_edge - margin), y_spawn_position))
	var spawn_rate = _calculate_spawn_rate_from_score(game_stats.score, time_offset)
	timer.start(spawn_rate + randf_range(0.25, 0.5))
	
func _calculate_spawn_rate_from_score(score: float, time_offset: float) -> float:
	return max(1.1, time_offset * 8.0 / (1.5 + (float(score) + 1.1 / 10.0) * 0.1))
