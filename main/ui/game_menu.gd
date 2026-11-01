class_name GameMenu extends MarginContainer



@export var resume_button: Button

@export var exit_button: Button

@export var quit_button: Button




func _ready() -> void:

	resume_button.pressed.connect(_on_resume_pressed)

	exit_button.pressed.connect(_on_exit_pressed)

	quit_button.pressed.connect(_on_quit_pressed)



func _toggle_visible() -> void:

	visible = not visible





func _on_resume_pressed() -> void:

	_toggle_visible()



func _on_exit_pressed() -> void:

	Game.exit()



func _on_quit_pressed() -> void:

	Game.quit()





func _unhandled_input(event: InputEvent) -> void:

	if event.is_action_pressed("back"):

		match Game.game_state:

			Game.GameState.GAME_ACTIVE:

				_toggle_visible()

				get_viewport().set_input_as_handled()