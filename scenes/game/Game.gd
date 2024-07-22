class_name Game extends Node2D

@onready var ship: Ship = $Ship
@onready var score_label: Label = $ScoreLabel

@export var game_stats: GameStats

func _ready() -> void:
	update_score_label(game_stats.score)
	game_stats.score_changed.connect(update_score_label)
	
	ship.tree_exiting.connect(func():
		await get_tree().create_timer(1.0).timeout
		get_tree().change_scene_to_file("res://scenes/game_over/GameOver.tscn")	
	)

func update_score_label(score: int) -> void:
	score_label.text = "SCORE " + str(score)
