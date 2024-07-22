class_name GemOver extends Control

@onready var score_value_label: Label = %ScoreValueLabel
@onready var high_score_value_label: Label = %HighScoreValueLabel

@export var game_stats: GameStats

func _ready() -> void:
	if game_stats.score > game_stats.high_score:
		game_stats.high_score = game_stats.score
	score_value_label.text = str(game_stats.score)
	high_score_value_label.text = str(game_stats.high_score)

func _process(_delta: float) -> void:
	if Input.is_action_just_pressed("accept"):
		game_stats.score = 0
		get_tree().change_scene_to_file("res://menus/Menu.tscn")
