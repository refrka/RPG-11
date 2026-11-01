extends Node


signal current_scene_changed(new_scene: Node)


var _current_scene: Node





func _set_current_scene(current_scene: Node) -> void:

	if current_scene:

		_close_scene(_current_scene)

	_current_scene = current_scene

	_open_scene(_current_scene)

	current_scene_changed.emit(current_scene)







# No base class for scenes. Each scene requires some methods: _open(), _close()

func _open_scene(scene: Node) -> void:

	if scene.has_method("_open"):

		scene._open()



func _close_scene(scene: Node) -> void:

	if scene.has_method("_open"):

		scene._close()

