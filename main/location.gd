class_name Location extends Node2D

@export var ground_tile_map: TileMapLayer

@export var scene_tile_map: TileMapLayer

@export var entities_root: Node2D

var _world: World




func _initialize() -> void:

	pass




func get_entities() -> Array:

	return entities_root.get_children()




func _open() -> void:

	pass



func _close() -> void:

	pass

