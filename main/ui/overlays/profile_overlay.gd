class_name ProfileOverlay extends Overlay








func _activate() -> void:

	super()

	Game.add_pause_source()




func _deactivate() -> void:

	super()

	Game.remove_pause_source()






func _unhandled_input(event: InputEvent) -> void:

	if event.is_action_pressed("profile"):

		if visible:

			UI.remove_overlay(self)
			
		else:

			UI.add_overlay(self)