extends Node


signal game_state_changed(new_state: GameState)


enum GameState {

	MAIN_MENU,

	GAME_ACTIVE,

	GAME_PAUSED,

}

var game_state: GameState





## Load the current save or start a new one and change game_state to GameState.GAME_ACTIVE
func start() -> void:

	pass


## Exit the game and return to the main menu
func exit() -> void:

	pass


## Close the game application
func quit() -> void:

	get_tree().quit()


## Reset the save data
func reset() -> void:

	pass


## Pause/unpause the game.
func set_pause_state(_state: bool) -> void:

	pass






func set_game_state(_game_state: GameState) -> void:

	if game_state == _game_state:

		return

	game_state = _game_state

	game_state_changed.emit(game_state)