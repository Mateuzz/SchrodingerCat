extends Area2D
tool

export(String, FILE) var next_floor := ""

# ainda nao utilizado
export var next_floor_spawn_location := Vector2.ZERO

# Mensagem de erro no editor se não colocar próximo andar na escada
func _get_configuration_warning() -> String:
	if next_floor == "":
		return "Stairs must have next floor attached"
	return ""

# Abre a caixa de texto ao enconstar na escada
func _on_StairsChangeFloor_body_entered(body: Node) -> void:
	$DialogBox.visible = true

# Fecha a caixa de texto ao enconstar na escada
func _on_StairsChangeFloor_body_exited(body: Node) -> void:
	$DialogBox.visible = false

# Pega o input de confirmação do usuário e desce/sobe as escadas
func _unhandled_input(event: InputEvent) -> void:
	if event.is_action_pressed("ui_accept") and $DialogBox.visible:
		on_enter_stairs()

# Função que muda a cena em si da escada e mostra a animação da tela ficando preta
func on_enter_stairs() -> void:
	$AnimationPlayer.play("Fade Out")
	yield($AnimationPlayer, "animation_finished")
	get_tree().change_scene(next_floor)
