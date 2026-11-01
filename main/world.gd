class_name World extends Node2D


signal current_location_changed(new_location: Location)


var current_location: Location





func _ready() -> void:

	load_location(get_child(0))






func load_location(location: Location) -> void:

	if not location.is_inside_tree():

		add_child(location)

	location._initialize()

	_set_current_location(location)






func _set_current_location(location: Location) -> void:
	
	if current_location:

		current_location._world = null

	current_location = location

	current_location._world = self

	current_location_changed.emit(location)




