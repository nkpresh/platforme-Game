extends KinematicBody2D

var velocity=Vector2()
export var direction=-1

func _ready():
	if direction==1:
		$Sprite.flip_h=true
	$floor_Checker.position.x=$CollisionShape2D.shape.get_extents().x*direction
	
	
func _physics_process(delta):
	
	if is_on_wall():
		direction*=-1
		$Sprite.flip_h=not $Sprite.flip_h
	
	velocity.y+=20
	
	velocity.x=50*direction
	
	velocity=move_and_slide(velocity,Vector2.UP)
