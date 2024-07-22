class_name Menu extends Control

func _process(_delta: float) -> void:
	if Input.is_action_just_pressed("accept"):
		get_tree().change_scene_to_file("res://scenes/game/Game.tscn")
