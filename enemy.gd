extends KinematicBody2D
var velocity=Vector2()


func _ready():
	pass
	
	
func _physics_process(delta):
	velocity.y+=20
	
	move_and_slide(velocity,Vector2.UP)
