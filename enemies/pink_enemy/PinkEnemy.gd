class_name PinkEnemy extends Enemy

@onready var states: Node = $States
@onready var move_down_state: TimedStateComponent = %MoveDownState
@onready var move_side_state: TimedStateComponent = %MoveSideState
@onready var fire_state: StateComponent = %FireState
@onready var iddle_state: TimedStateComponent = %IddleState
@onready var move_down_component: MoveComponent = %MoveDownComponent
@onready var move_side_component: MoveComponent = %MoveSideComponent
@onready var projectile_spawner_component: SpawnerComponent = %ProjectileSpawnerComponent


func _ready() -> void:
	super()
	setup_states()
	

func setup_states() -> void:
	# Disable all states
	for state:StateComponent in states.get_children():
		state.disable()

	# Setup state sequence
	move_down_state.state_finished.connect(func():
		# Pick random direction to move_side_component
		randomize()
		move_side_component.velocity.x = [move_side_component.velocity.x, -move_side_component.velocity.x].pick_random()
		move_side_state.enable()
	)
	move_side_state.state_finished.connect(func():
		fire_state.enable()
		scale_component.tween_scale()
		projectile_spawner_component.spawn(global_position)
		fire_state.disable()
		fire_state.state_finished.emit()
	)
	fire_state.state_finished.connect(iddle_state.enable)
	iddle_state.state_finished.connect(move_down_state.enable)

	# Start sequence
	move_down_state.enable()
