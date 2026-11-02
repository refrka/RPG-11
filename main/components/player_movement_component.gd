class_name PlayerMovementComponent extends Component


signal face_dir_changed(dir: Vector2)


var face_dir: Vector2

var input_dir: Vector2




var _move_left_pressed:= false

var _move_right_pressed:= false

var _move_up_pressed:= false

var _move_down_pressed:= false






func _set_face_dir(dir: Vector2) -> void:

	face_dir = dir

	face_dir_changed.emit(dir)




func _unhandled_input(event: InputEvent) -> void:

	if event.is_action("move_left"):

		_move_left_pressed = event.is_pressed()

	if event.is_action("move_right"):

		_move_right_pressed = event.is_pressed()

	if event.is_action("move_up"):

		_move_up_pressed = event.is_pressed()

	if event.is_action("move_down"):

		_move_down_pressed = event.is_pressed()







func _physics_process(delta: float) -> void:

	var dir = Vector2.ZERO

	if _move_left_pressed:

		dir += Vector2.LEFT

	if _move_right_pressed:

		dir += Vector2.RIGHT

	if _move_up_pressed:

		dir += Vector2.UP

	if _move_down_pressed:

		dir += Vector2.DOWN

	input_dir = dir.normalized()

	if input_dir != Vector2.ZERO:

		_set_face_dir(input_dir)

	if Input.get_vector("move_left", "move_right", "move_up", "move_down") == Vector2.ZERO:

		input_dir = Vector2.ZERO

	var velocity = input_dir * (100.0)

	_entity.velocity = velocity

	_entity.move_and_slide()