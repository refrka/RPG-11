extends Node


signal save_data_changed(save_data: SaveData)

const SAVE_PATH = "user://save.json"

var _current_save_data: SaveData









func _ready() -> void:

	_load_current_save_file()




## Create new SaveData and set to current
func create_save_data() -> void:

	var save_data = SaveData.new()

	_write_dict_to_file(save_data.to_dict(), SAVE_PATH)

	_set_current_save_data(save_data)




## Load a SaveData with the dict and set to current
func load_save_data(save_dict: Dictionary) -> SaveData:

	var save_data = SaveData.from_dict(save_dict)

	_set_current_save_data(save_data)

	return save_data



## Write the SaveData dict to file
func save() -> void:

	if not _current_save_data:

		return

	var save_dict = _current_save_data.to_dict()

	_write_dict_to_file(save_dict, SAVE_PATH)



func set_game_data_value(property_name: String, value: Variant) -> void:

	if not _current_save_data or not _current_save_data.game_data.has(property_name):

		return

	_current_save_data.game_data.set(property_name, value)	




func get_game_data_value(property_name: String) -> Variant:

	if not _current_save_data:

		return null

	return _current_save_data.game_data.get(property_name, null)








func _load_current_save_file() -> void:

	if not FileAccess.file_exists(SAVE_PATH):

		create_save_data()

	else:

		_read_dict_from_file(SAVE_PATH)







func _set_current_save_data(save_data: SaveData) -> void:

	_current_save_data = save_data

	save_data_changed.emit(save_data)




func _write_dict_to_file(dict: Dictionary, path: String) -> void:

	var file = FileAccess.open(path, FileAccess.WRITE)

	file.store_string(JSON.stringify(dict, " "))

	file.close()




func _read_dict_from_file(path: String) -> Dictionary:

	var file = FileAccess.open(path, FileAccess.READ)

	if not file:

		return {}

	var json = JSON.new()

	json.parse(file.get_as_text())

	file.close()

	return json.data