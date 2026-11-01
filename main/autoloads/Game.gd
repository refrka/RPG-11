extends Node


signal game_state_changed(new_state: GameState)


enum GameState {

	MAIN_MENU,

	GAME_ACTIVE,

	GAME_PAUSED,

}

var game_state: GameState












func set_game_state(_game_state: GameState) -> void:

	if game_state == _game_state:

		return

	game_state = _game_state

	game_state_changed.emit(game_state)