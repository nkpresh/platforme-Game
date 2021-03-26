extends KinematicBody2D

var velocity=Vector2(0,0)
var Coins=0
const SPEED=250
const FORCEJUMP=-1100
const GRAVITY=35

func _physics_process(delta):
	if Input.is_action_pressed("right"):
		velocity.x=SPEED
		$Sprite.play("walk")
		$Sprite.flip_h=false
	elif Input.is_action_pressed("left"):
		velocity.x=-SPEED
		$Sprite.play("walk")
		$Sprite.flip_h=true
	else:
		$Sprite.play("idle")
	if not is_on_floor():
		$Sprite.play("jump")
		
	velocity.y+=GRAVITY	
	
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y=FORCEJUMP
	
	velocity=move_and_slide(velocity,Vector2.UP)
	
	velocity.x=lerp(velocity.x,0,0.2)
		


func _on_fallzone_body_entered(body):
	get_tree().change_scene("res://GameOver.tscn")
	
	
func bounce():
	velocity.y=FORCEJUMP*0.5
	
func ouch(var enemyposx):
	set_modulate(Color(1,0.3,0.3,0.3))
	velocity.y=FORCEJUMP*0.5
	
	if position.x<enemyposx:
		velocity.x=-800
	elif position.x>enemyposx:
		velocity.x=800
	Input.action_release("left")
	Input.action_release("right")
	
	$Timer.start()


func _on_Timer_timeout():
	get_tree().change_scene("res://GameOver.tscn")
