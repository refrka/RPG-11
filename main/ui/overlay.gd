class_name Overlay extends MarginContainer







func _ready() -> void:

	UI.register_overlay(self)

	_deactivate()








func _activate() -> void:

	show()




func _deactivate() -> void:

	hide()













func is_active() -> bool:

	return visible