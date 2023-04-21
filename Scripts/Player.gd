extends KinematicBody2D

var linear_velocity=Vector2(0,0)
var facing="right"

const SPEED=100
const JUMP_SPEED=2000



#var sprite=get_nod("Sprite")
#var sprite=get_nod($Sprite)
onready var sprite=$Sprite


func _physics_process(delta):
	apply_gravity()
	move()	
	jump()
	move_and_slide(linear_velocity,Globals.UP)
	animate()	
	attack()

func apply_gravity():
	if position.y>Globals.LEVEL_LIMIT:
		get_tree().call_group("Rules","finish_game")
		#finish_game()
	if is_on_floor() and linear_velocity.y>0:
		linear_velocity.y=0
	elif is_on_ceiling():
		linear_velocity.y=1
	else:
		linear_velocity.y+=Globals.GRAVITY

#function for mivong player
func move():
	if Input.is_action_pressed("left") and not Input.is_action_pressed("right"):
		linear_velocity.x+=-SPEED
		facing="left"
	elif Input.is_action_pressed("right") and not Input.is_action_pressed("left"):
		linear_velocity.x+=SPEED
		facing="right"
	else:
		linear_velocity.x=0


func jump():
	if Input.is_action_pressed("jump") and is_on_floor():
		linear_velocity.y-=JUMP_SPEED
		$JumpSound.play()
		#$AudioStreamPlayer.stream=load("res://Sounds/jump.ogg")
		#$AudioStreamPlayer.play()


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
		


	

func hurt():
	position.y-=1
	yield(get_tree(),"idle_frame")
	linear_velocity.y=JUMP_SPEED*0.9
	$PainSound.play()
	
	
func attack():
	if Input.is_action_just_pressed("attack"):
		#інстанціюємо (додаємо на сцену снаряд)
		var projectile=load("res://Scences/FireProjectile.tscn").instance()
		# тепер якщо в змінній зберігається нод, то можна доступитися до його змінним
		if facing=="left":
			projectile.direction=-1
		else:
			projectile.direction=1
		#для того, щоб снаряд інстанціювався (зявлявся)  біля персонажа (Player)
		# потрібно зробити його дочірнім об'єктом для Player
		add_child(projectile)
		# снаряд повине пропадати при зіткненні із enemy або з level
		#щоб снаряд не був привязаний до персонажа і не міняв положення разом з ним g
		#projectile.set_as_toplevel(true)	# тепер координати гравця не будуть впливати на координати снаряду
	
