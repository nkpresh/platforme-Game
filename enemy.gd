extends KinematicBody2D

var velocity=Vector2()
export var direction=-1

func _ready():
	pass
	
	
func _physics_process(delta):
	velocity.y+=20
	
	velocity.x=50*direction
	
	move_and_slide(velocity,Vector2.UP)
