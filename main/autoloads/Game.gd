extends Node


signal game_state_changed(new_state: GameState)


enum GameState {

	INIT,

	MAIN_MENU,

	GAME_ACTIVE,

	GAME_PAUSED,

}

var game_state: GameState




func _ready() -> void:

	process_mode = PROCESS_MODE_ALWAYS





## Load the current save or start a new one and change game_state to GameState.GAME_ACTIVE
func start() -> void:

	set_game_state(GameState.GAME_ACTIVE)


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
func set_pause_state(state: bool) -> void:

	get_tree().paused = state



func save() -> void:

	Data.save()






func set_game_state(_game_state: GameState) -> void:

	if game_state == _game_state:

		return

	game_state = _game_state

	game_state_changed.emit(game_state)