extends CharacterBody2D

@export var speed := 150.0  # Velocidad de movimiento del personaje

var last_direction: Vector2 = Vector2.DOWN  # Dirección inicial predeterminada

func _process(delta: float) -> void:
	# Obtener la dirección de entrada del jugador
	var direction = Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")

	if direction != Vector2.ZERO:
		# Actualizar la velocidad y la última dirección conocida cuando hay movimiento
		velocity = direction * speed
		last_direction = direction  # ¡Actualizamos aquí la dirección válida!

		# Reproducir animaciones de movimiento
		if direction.y > 0:
			$Alchemist.play("walk_down")
		elif direction.y < 0:
			$Alchemist.play("walk_up")
		elif direction.x > 0:
			$Alchemist.play("walk_right")
		elif direction.x < 0:
			$Alchemist.play("walk_left")
	else:
		# Detener la velocidad y usar la última dirección para animaciones de idle
		velocity = Vector2.ZERO

		# Animación basada en la última dirección conocida
		if last_direction.y > 0:
			$Alchemist.play("idle_down")
		elif last_direction.y < 0:
			$Alchemist.play("idle_up")
		elif last_direction.x > 0:
			$Alchemist.play("idle_right")
		elif last_direction.x < 0:
			$Alchemist.play("idle_left")

	# Mover al personaje
	move_and_slide()
