extends KinematicBody2D

# Criação de variáveis

var velocity = Vector2.ZERO #Movimentação no eixo x e y
var move_speed = 480 # Velocidade do Jogador
var gravity = 1200 # Adição de gravidade para o jogador cair, pois o KinematicBody não tem por padrão
var jump_force = -720 # Força de pulo
var is_grounded # Verificar se o jogador está no chão ou em um local que o permita pular
var health = 2 # vida do jogador
var hurt = false
# impulso de ser acertado
var knockback_dir = 1
var knockback_int = 300
onready var raycasts = $raycasts

func _physics_process(delta: float) -> void:
	
	#Ajuste gravidade
	velocity.y += gravity * delta
	
	#Ajuste movimentação no eixo X
	_get_input()
	
	#Configurações de ambiente
	velocity = move_and_slide(velocity)
	
	#Configuração de Pulo
	is_grounded = _check_is_grounded()
		
	#Configurações	de animação
	_set_animation()
	
	
func _get_input():
	velocity.x = 0
	#Ajuste movimentação no eixo X
	var move_direction = int(Input.is_action_pressed("move_right")) - int(Input.is_action_pressed("move_left"))
	velocity.x = lerp(velocity.x, move_speed * move_direction, 0.2) # learp é uma função de interpolação, auxilia na movimentação
	
	#Para que o player saiba a direção e mude sua orientação
	if move_direction != 0:
		$texture.scale.x = move_direction
		knockback_dir = move_direction
	
	
# Configurações de Pulo
func _input(event: InputEvent) -> void:
	if event.is_action_pressed("jump") && is_grounded:
		velocity.y = jump_force / 2

func _check_is_grounded():
	for raycast in raycasts.get_children():
		if raycast.is_colliding():
			return true
	return false
	
# Configuração de Animações
func _set_animation():
	var anim = "idle" #Estado padrão
	
	if !is_grounded: # Se não estiver no chão
		anim = "jump"
	elif velocity.x != 0:
		anim = "run"
	
	if velocity.y > 0 and !is_grounded:
		anim = "fall"
		
	if hurt:
		anim = "hit"
	
	if $animation.assigned_animation != anim:
		$animation.play(anim)

func knockback():
	velocity.x = -knockback_dir * knockback_int
	move_and_slide(velocity)

func _on_hurtbox_body_entered(body):
	health -= 1
	hurt = true
	knockback()
	yield(get_tree().create_timer(0.5), "timeout")
	hurt = false
	
	if health < 1:
		queue_free()
		get_tree().reload_current_scene()
