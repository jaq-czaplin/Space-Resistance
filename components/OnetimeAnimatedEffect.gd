class_name OnetimeAnimatedEffect extends AnimatedSprite2D

@onready var audio_stream_player: VariablePitchAudioStreamPlayer = $VariablePitchAudioStreamPlayer

func _ready() -> void:
	animation_finished.connect(queue_free)
	animation_looped.connect(queue_free)
