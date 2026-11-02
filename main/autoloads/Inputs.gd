extends Node


var input_config: InputConfig


@onready var game_state_input_configs:= {

	Game.GameState.MAIN_MENU: preload("res://resources/config/main_menu_input_config.tres"),

	Game.GameState.GAME_ACTIVE: preload("res://resources/config/game_active_input_config.tres"),

}



func _ready() -> void:

	process_mode = PROCESS_MODE_ALWAYS

	Game.game_state_changed.connect(_on_game_state_changed)





func is_action_allowed(action: StringName) -> bool:

	return input_config.allowed_actions.has(action)





func _on_game_state_changed(game_state: Game.GameState) -> void:

	input_config = game_state_input_configs[game_state]





func _input(event: InputEvent) -> void:

	if event is InputEventMouseMotion or event is InputEventMouseButton:

		return

	var actions = input_config.allowed_actions
	
	for action in actions:

		var events = InputMap.action_get_events(action)

		for _event in events:

			if _event.physical_keycode == event.physical_keycode:

				return

	get_viewport().set_input_as_handled()

	


