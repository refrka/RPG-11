class_name Location extends Node2D

@export var ground_tile_map: TileMapLayer

@export var scene_tile_map: TileMapLayer

@export var entities_root: Node2D

@export var environment_root: Node2D

var _world: World





func _ready() -> void:

	scene_tile_map.child_entered_tree.connect(_on_child_entered_scene_tile_map)




func _initialize() -> void:

	pass




func get_entities() -> Array:

	return entities_root.get_children()




func _open() -> void:

	pass



func _close() -> void:

	pass







func _on_child_entered_scene_tile_map(child: Node) -> void:

	if child is EnvironmentObject:

		child.reparent.call_deferred(environment_root)