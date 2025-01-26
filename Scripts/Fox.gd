extends CharacterBody2D

@export var vertical_speed : float = 20  # Velocidade constante para baixo
@export var follow_speed : float = 110  # Velocidade para seguir o peixe no eixo X
@export var delay_time : float = 0.5  # Tempo de atraso antes de começar a seguir o peixe
@export var tolerance : float = 1.0  # Margem de tolerância para parar o movimento (em pixels)

var delay_timer : float = 0.0  # Temporizador para o atraso
var seguir_x : bool = false  # Define se a raposa já deve seguir o peixe no eixo X

@onready var peixe: CharacterBody2D = $"../CharacterBody2D"
@onready var sprite : Sprite2D = $Sprite2D  # Referência ao Sprite filho

func _physics_process(delta):
	velocity.y = vertical_speed
	var diff_x = position.x - peixe.position.x  # Diferença no eixo X
	if diff_x > tolerance:
		velocity.x = -follow_speed  # Move para a esquerda em direção ao peixe
	elif diff_x < -tolerance:
		velocity.x = follow_speed  # Move para a direita em direção ao peixe
	else:
		seguir_x = false
		velocity.x = 0  # Para de mover no eixo X

	# Move o personagem
	move_and_slide()
