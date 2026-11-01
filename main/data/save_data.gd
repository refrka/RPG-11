class_name SaveData extends Resource



var game_data:= {

	"last_save_time": -1

}









func to_dict() -> Dictionary:

	return {

		"game_data": game_data,

	}



static func from_dict(dict: Dictionary) -> SaveData:

	var save_data = SaveData.new()

	save_data.game_data = dict.game_data

	return save_data