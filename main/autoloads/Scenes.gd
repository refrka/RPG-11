extends Node


signal current_scene_changed(new_scene: Node)


var _current_scene: Node





func _set_current_scene(current_scene: Node) -> void:

	_current_scene = current_scene

	current_scene_changed.emit(current_scene)