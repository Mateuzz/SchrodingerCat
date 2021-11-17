extends Button
tool

export(String, FILE) var scene := ""

func _get_configuration_warning() -> String:
	if scene == "":
		return "ChangeSceneButton must have scene attached"
	return ""

func _on_ChangeSceneButton_button_up() -> void:
	get_tree().change_scene(scene)
