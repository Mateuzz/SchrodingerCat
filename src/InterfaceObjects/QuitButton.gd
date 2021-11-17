extends Button

# Fecha o jogo quando o botão de sair é soltado
func _on_QuitButton_button_up() -> void:
	get_tree().quit()
