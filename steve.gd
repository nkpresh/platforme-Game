extends KinematicBody2D

var velocity=Vector2(0,0)
const SPEED=180
const FORCEJUMP=-900
const GRAVITY=30

func _physics_process(delta):
	if Input.is_action_pressed("right"):
		velocity.x=SPEED
	if Input.is_action_pressed("left"):
		velocity.x=-SPEED
		
	velocity.y+=GRAVITY	
	
	if Input.is_action_just_pressed("jump"):
		velocity.y=FORCEJUMP
	
	velocity=move_and_slide(velocity)
	
	velocity.x=lerp(velocity.x,0,0.1)
