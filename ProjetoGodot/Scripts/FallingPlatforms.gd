extends KinematicBody2D

# Converter os nós associados ao item em variáveis
# onready - verifica se o objeto já está "pronto"
onready var anim = $anim
onready var timer = $timer

onready var reset_position = global_position

var velocity = Vector2.ZERO
var gravity = 720
var is_triggered = false # verifica se a plataforma foi acionada
export var reset_timer = 3.0


func _ready():
	# inicialmente, colocar o processo físico associado à gravidade (cair) como falso
	set_physics_process(false)

func _physics_process(delta):
	velocity.y += gravity * delta
	position += velocity * delta


func collide_with(collision: KinematicCollision2D, collider: KinematicBody2D):
	if !is_triggered: # Caso o gatilho não tenha sido acionado
		is_triggered = true
		anim.play("shake")
		velocity = Vector2.ZERO


func _on_anim_animation_finished(anim_name):
	# a única animação que possui fim é a de "shake", logo, não é necessária verificação.
	set_physics_process(true)
	timer.start(reset_timer) # tempo de espera para que a plataforma seja restaurada
	

func _on_timer_timeout():
	set_physics_process(false) # para que a plataforma volte a flutuar
	yield(get_tree(), "physics_frame")
	var temp = collision_layer
	collision_layer = 0
	global_position = reset_position # voltar com a plataforma para seu local original
	yield(get_tree(), "physics_frame")
	collision_layer = temp
	is_triggered = false # plataforma volta ao seu estágio inicial
	anim.play("on") # para que a plataforma volte a rodar
