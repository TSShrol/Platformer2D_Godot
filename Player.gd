extends KinematicBody2D

var linear_velocity=Vector2(0,0)
const SPEED=100
const GRAVITY=200
const UP=Vector2(0,-1)
const JUMP_SPEED=2000

#var sprite=get_nod("Sprite")
#var sprite=get_nod($Sprite)
onready var sprite=$Sprite


func _physics_process(delta):
	apply_gravity()
	move()	
	jump()
	move_and_slide(linear_velocity,UP)
	animate()	

func apply_gravity():
	if is_on_floor():
		linear_velocity.y=0
	elif is_on_ceiling():
		linear_velocity.y=1
	else:
		linear_velocity.y+=GRAVITY

#function for mivong player
func move():
	if Input.is_action_pressed("left") and not Input.is_action_pressed("right"):
		linear_velocity.x+=-SPEED
	elif Input.is_action_pressed("right") and not Input.is_action_pressed("left"):
		linear_velocity.x+=SPEED
	else:
		linear_velocity.x=0


func jump():
	if Input.is_action_pressed("jump") and is_on_floor():
		linear_velocity.y-=JUMP_SPEED


func animate():
	if linear_velocity.y<0:
		sprite.play("jump")
	elif linear_velocity.x>0: #вправо
		sprite.play("walk")
		sprite.flip_h=false
	elif linear_velocity.x<0: #вліво
		sprite.play("walk")
		sprite.flip_h=true
	else:
		sprite.play("idle")
		
