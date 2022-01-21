extends KinematicBody2D

export var speed = 64
export var health = 1
var motion = Vector2.ZERO
var gravity = 1200
var move_direction = -1
var hit = false # para verificar as colisões da cabeça do inimigo com o jogador

func _physics_process(delta: float) -> void:
	
	motion.x = speed * move_direction
	motion.y += gravity * delta
	
	motion = move_and_slide(motion)
	
	if move_direction == 1:
		$texture.flip_h = true
	else:
		$texture.flip_h = false
		
	_set_animation()
	


func _on_anim_animation_finished(anim_name: String) -> void:
	if anim_name == "idle":
		$texture.flip_h != $texture.flip_h
		$ray_wall.scale.x *= -1
		move_direction *= -1
		$anim.play("run")
		
func _set_animation():
	var anim = "run" #Estado padrão
	
	if $ray_wall.is_colliding(): # Se houver colisão lateral
		anim = "idle"
	elif motion.x != 0:
		anim = "run"
	
	if hit:
		anim = "hit"
		
	if $anim.assigned_animation != anim:
		$anim.play(anim)

func _on_hitbox_body_entered(body):
	hit = true
	body.velocity.y -= 300
	health -= 1
	yield(get_tree().create_timer(0.2), "timeout") #timer para troca posterior de animação
	hit = false
	if health < 1:
		queue_free()
		get_node("hitbox/CollisionShape2D").set_deferred('disabled', true)
		get_node("hitbox2/CollisionShape2D").set_deferred('disabled', true)
