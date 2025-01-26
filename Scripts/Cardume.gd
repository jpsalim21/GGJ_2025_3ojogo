extends Area2D


@export var bonus_speed : float = 30  # Velocidade horizontal (para direita/esquerda)
func _on_body_entered(body: Node2D) -> void:
	body.vertical_speed += bonus_speed
	#SceneController.reloadCurrentScene()
	pass # Replace with function body.
