extends KinematicBody2D

var velocity=Vector2(0,0)
const SPEED=180
const FORCEJUMP=-1100
const GRAVITY=35

func _physics_process(delta):
	if Input.is_action_pressed("right"):
		velocity.x=SPEED
		$Sprite.play("walk")
	elif Input.is_action_pressed("left"):
		velocity.x=-SPEED
		$Sprite.play("walk")
	else:
		$Sprite.play("idle")
		
	if not is_on_floor():
		$Sprite.play("jump")
		
	velocity.y+=GRAVITY	
	
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y=FORCEJUMP
	
	velocity=move_and_slide(velocity,Vector2.UP)
	
	velocity.x=lerp(velocity.x,0,0.2)