class_name GemOver extends Control

const SAVE_PATH = "user://stats.cfg"
const TEST_SAVE_PATH = "res://stats.cfg"

var save_path = SAVE_PATH

@onready var score_value_label: Label = %ScoreValueLabel
@onready var high_score_value_label: Label = %HighScoreValueLabel

@export var game_stats: GameStats

func _ready() -> void:
	load_highscore()
	if game_stats.score > game_stats.high_score:
		game_stats.high_score = game_stats.score
		save_highscore()
	score_value_label.text = str(game_stats.score)
	high_score_value_label.text = str(game_stats.high_score)
	

func _process(_delta: float) -> void:
	if Input.is_action_just_pressed("accept"):
		game_stats.score = 0
		get_tree().change_scene_to_file("res://menus/Menu.tscn")

func load_highscore() -> void:
	var config = ConfigFile.new()
	var error = config.load(save_path)
	if error != OK: return
	var high_score = config.get_value("game", "high_score")
	if high_score : game_stats.high_score = high_score
	
func save_highscore() -> void:
	var config = ConfigFile.new()
	config.set_value("game", "high_score", game_stats.high_score)
	config.save(save_path)
