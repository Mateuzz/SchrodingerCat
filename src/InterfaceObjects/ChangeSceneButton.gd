extends Button
tool

export(String, FILE) var scene := ""

# Mensagem de erro no editor se não colocar a cena que o botão vai levar
func _get_configuration_warning() -> String:
	if scene == "":
		return "ChangeSceneButton must have scene attached"
	return ""

# Muda a cena quando o botão é soltado
func _on_ChangeSceneButton_button_up() -> void:
	get_tree().change_scene(scene)
