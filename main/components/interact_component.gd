class_name InteractComponent extends Component


@export var interact_area: Area2D



func _ready() -> void:

	super()

	interact_area.body_entered.connect(_on_body_entered_interact_area)

	interact_area.body_exited.connect(_on_body_exited_interact_area)

	var player_movement_component = _entity.get_component(PlayerMovementComponent)

	if player_movement_component:

		player_movement_component.face_dir_changed.connect(_on_face_dir_changed)





func get_interactable_entities() -> Array:

	var all_entities = interact_area.get_overlapping_bodies()
	
	var entities = []

	for entity in all_entities:

		if entity == _entity:

			continue

		if entity.is_interactable():

			entities.append(entity)

	return entities





func _get_nearest_entity(entity_list: Array) -> Entity:

	var nearest_entity: Entity = null

	var nearest_distance:= INF

	for entity in entity_list:

		var distance = _entity.global_position.distance_to(entity.global_position)

		if nearest_entity == null or distance < nearest_distance:

			nearest_entity = entity

	return nearest_entity





func _try_interact() -> void:

	var interactable_entities = get_interactable_entities()

	if interactable_entities.is_empty():

		return

	else:

		print(_get_nearest_entity(interactable_entities))























func _on_body_entered_interact_area(body: PhysicsBody2D) -> void:

	pass



func _on_body_exited_interact_area(body: PhysicsBody2D) -> void:

	pass



func _on_face_dir_changed(dir: Vector2) -> void:

	interact_area.rotation = dir.angle()




func _unhandled_input(event: InputEvent) -> void:

	if event.is_action_pressed("interact"):

		_try_interact()