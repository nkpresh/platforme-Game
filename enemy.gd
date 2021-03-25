extends KinematicBody2D

var speed=50
var velocity=Vector2()
export var direction=-1
export var detects_cliffs=true

func _ready():
	if direction==1:
		$Sprite.flip_h=true
	$floor_Checker.position.x=$CollisionShape2D.shape.get_extents().x*direction
	$floor_Checker.enabled=detects_cliffs
	
	
func _physics_process(delta):
	
	if is_on_wall() or not $floor_Checker.is_colliding() and detects_cliffs and is_on_floor():
		direction*=-1
		$Sprite.flip_h=not $Sprite.flip_h
		$floor_Checker.position.x=$CollisionShape2D.shape.get_extents().x*direction
	
	velocity.y+=20
	
	velocity.x=speed*direction
	
	velocity=move_and_slide(velocity,Vector2.UP)


func _on_top_checker_body_entered(body):
	$Sprite.play("squashed")
	speed=0
	set_collision_layer_bit(4,false)
	set_collision_mask_bit(0,false)
	$top_checker.set_collision_layer_bit(4,false)
	$top_checker.set_collision_mask_bit(0,false)
	$sides_checker.set_collision_layer_bit(4,false)
	$sides_checker.set_collision_mask_bit(0,false)
	
	


func _on_sides_checker_body_entered(body):
	print("entered")
	get_tree().change_scene("res://Level1.tscn")
