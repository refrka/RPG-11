extends Node


signal current_scene_changed(new_scene: Node)


var _current_scene: Node

var _scene_registry: Dictionary[Script, Node]




func _ready() -> void:

	get_tree().node_added.connect(_on_node_added_to_tree)

	var scenes = get_tree().get_nodes_in_group("scene")

	for scene in scenes:

		_register_scene(scene)




func load_scene(scene_script: Script) -> Node:

	print("loading ", scene_script)

	var scene = get_scene(scene_script)

	if is_instance_valid(scene) and scene.is_inside_tree():

		_set_current_scene(scene)

	return scene



func get_scene(scene_script: Script) -> Node:

	if _scene_registry.has(scene_script):

		return _scene_registry[scene_script]

	return null





func _register_scene(scene: Node) -> void:

	_scene_registry[scene.get_script()] = scene






func _set_current_scene(current_scene: Node) -> void:

	if _current_scene != null:

		if current_scene == _current_scene:

			return
			
		_close_scene(_current_scene)

	_current_scene = current_scene

	_open_scene(_current_scene)

	current_scene_changed.emit(current_scene)







# No base class for scenes. Each scene requires some methods: _open(), _close()

func _open_scene(scene: Node) -> void:

	if scene.has_method("_open"):

		scene._open()

		scene.show()



func _close_scene(scene: Node) -> void:

	if scene.has_method("_close"):

		scene._close()

		scene.hide()












func _on_node_added_to_tree(node: Node) -> void:

	if node.is_in_group("scene"):

		_register_scene(node)