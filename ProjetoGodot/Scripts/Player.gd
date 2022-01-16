extends KinematicBody2D

# Criação de variáveis

var velocity = Vector2.ZERO #Movimentação no eixo x e y
var move_speed = 480 # Velocidade do Jogador
var gravity = 1200 # Adição de gravidade para o jogador cair, pois o KinematicBody não tem por padrão
var jump_force = -720 # Força de pulo

func _physics_process(delta: float) -> void:
	
	#Ajuste gravidade
	velocity.y += gravity * delta
	
	#Ajuste movimentação no eixo X
	var move_direction = int(Input.is_action_pressed("move_right")) - int(Input.is_action_pressed("move_left"))
	velocity.x = move_speed * move_direction
	
	#Configuração de Pulo
	if Input.is_action_pressed("jump"):
		velocity.y = jump_force / 2
		
	move_and_slide(velocity)
	
