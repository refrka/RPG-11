extends Node





var overlay_registry: Dictionary[Script, Overlay]


var active_overlays: Array[Overlay]





func _ready() -> void:

	process_mode = PROCESS_MODE_ALWAYS





func register_overlay(overlay: Overlay) -> void:

	overlay_registry[overlay.get_script()] = overlay






func add_overlay(overlay: Overlay) -> void:

	active_overlays.append(overlay)

	overlay._activate()



func remove_overlay(overlay: Overlay) -> void:

	overlay._deactivate()

	active_overlays.erase(overlay)