class_name GameStats extends Resource

signal score_changed(new_score: int)

@export var score: int = 0:
	set(value):
		score = value
		score_changed.emit(score)
		
@export var high_score: int = 0
