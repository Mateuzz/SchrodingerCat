extends Area2D
tool

export(String, FILE) var next_floor := ""

func _get_configuration_warning() -> String:
	if next_floor == "":
		return "Stairs must have next floor attached"
	return ""

func _on_StairsChangeFloor_body_entered(body: Node) -> void:
	$DialogBox.visible = true

func _on_StairsChangeFloor_body_exited(body: Node) -> void:
	$DialogBox.visible = false

func _unhandled_input(event: InputEvent) -> void:
	if event.is_action_pressed("ui_accept") and $DialogBox.visible:
		on_enter_stairs()

func on_enter_stairs() -> void:
	$AnimationPlayer.play("Fade Out")
	yield($AnimationPlayer, "animation_finished")
	get_tree().change_scene(next_floor)
