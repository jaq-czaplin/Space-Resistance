class_name YellowEnemy extends Enemy

func _ready() -> void:
	super()
	randomize()
	move_component.velocity.x = [move_component.velocity.x, -move_component.velocity.x].pick_random()
