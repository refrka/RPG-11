class_name EnvironmentObject extends Sprite2D



@export var area: Area2D

@export var anim_player: AnimationPlayer




func _ready() -> void:

	area.body_entered.connect(_on_body_entered_area)

	area.body_exited.connect(_on_body_exited_area)

	if anim_player:

		anim_player.animation_finished.connect(_on_animation_finished)





func _on_body_entered_area(_body: PhysicsBody2D) -> void:

	if _body.velocity == Vector2.ZERO:

		return

	if anim_player.has_animation("shake"):

		anim_player.play("shake")




func _on_body_exited_area(_body: PhysicsBody2D) -> void:

	pass




func _on_animation_finished(_anim_name: StringName) -> void:

	anim_player.play("idle")