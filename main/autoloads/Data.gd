extends Node


signal save_data_changed(save_data: SaveData)

const SAVE_PATH = "user://save.json"

var _current_save_data: SaveData





func create_save_data() -> void:

	var save_data = SaveData.new()

	_set_current_save_data(save_data)





func load_save_data(save_dict: Dictionary) -> SaveData:

	var save_data = SaveData.from_dict(save_dict)

	_set_current_save_data(save_data)

	return save_data




func save() -> void:

	if not _current_save_data:

		return

	var save_dict = _current_save_data.to_dict()

	_write_dict_to_file(save_dict, SAVE_PATH)





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