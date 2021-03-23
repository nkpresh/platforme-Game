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
	
	if Coins==3:
		get_tree().change_scene("res://Level1.tscn")
		


func _on_fallzone_body_entered(body):
	get_tree().change_scene("res://Level1.tscn")
	
func add_Coin():
	Coins+=1
	print("I now have this many coins: ",Coins)
