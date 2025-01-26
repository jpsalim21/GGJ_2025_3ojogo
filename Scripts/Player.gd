extends CharacterBody2D

@export var speed : float = 200  # Velocidade horizontal (para direita/esquerda)
@export var vertical_speed : float = 30  # Velocidade constante para baixo
@export var tilt_speed : float = 5.0  # Velocidade de rotação do sprite
@export var max_tilt_angle : float = 45.0  # Ângulo máximo de inclinação (em graus)
var direcao : float = 0.0

@onready var sprite : Sprite2D = $Sprite2D  # Referência ao Sprite filho

func _physics_process(delta):
	# Define o movimento constante para baixo
	print(vertical_speed)
	velocity.y = vertical_speed
	direcao = Input.get_axis("Esquerda", "Direita")
	velocity.x = direcao * speed

	# Inclina o sprite com base na direção
	if direcao != 0:
		# Calcula o ângulo de inclinação desejado (em radianos)
		var target_angle = deg_to_rad(direcao * max_tilt_angle)
		sprite.rotation = lerp(sprite.rotation, target_angle, tilt_speed * delta)
	else:
		# Retorna lentamente à posição inicial
		sprite.rotation = lerp(sprite.rotation, 0.0, tilt_speed * delta)

	# Move o personagem
	move_and_slide()
