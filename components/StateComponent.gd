class_name StateComponent extends Node

signal enabled()
signal disabled()
signal state_finished()

func disable() -> void:
	disabled.emit()
	process_mode = Node.PROCESS_MODE_DISABLED # Disable node and its children

func enable() -> void:
	enabled.emit()
	process_mode = Node.PROCESS_MODE_INHERIT # Enable node and its children
