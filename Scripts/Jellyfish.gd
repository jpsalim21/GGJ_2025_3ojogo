extends Area2D

@export var velocidade : float = 1.0  # Velocidade da oscilação (controle do ritmo do movimento)
@export var posicao_maxima_x : float = 90.0  # Posição máxima em X (direita)
@export var posicao_minima_x : float = -100.0  # Posição mínima em X (esquerda)
@export var bonus_speed : float = 40  # Velocidade horizontal (para direita/esquerda)
var time : float = 0.0  # Variável para controlar o tempo da função seno

func _physics_process(delta: float) -> void:
	time += delta * velocidade
	var deslocamento_x = (sin(time) * 0.5 + 0.5) * (posicao_maxima_x - posicao_minima_x) + posicao_minima_x
	position.x = deslocamento_x
	
func _on_body_entered(body: Node2D) -> void:
	body.vertical_speed -= bonus_speed
	#SceneController.reloadCurrentScene()
	pass # Replace with function body.
