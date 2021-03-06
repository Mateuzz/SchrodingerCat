# Classe básica para players e inimigos

extends KinematicBody2D
class_name Actor

const FLOOR_NORMAL = Vector2.UP

export var speed := Vector2(300, 500)
export var gravity := 2000

var velocity := Vector2.ZERO

# Calcula a velocidade adicional que a aceleração da gravidade infringiu sobre o 
func calculate_gravity() -> float:
	return gravity * get_physics_process_delta_time()
