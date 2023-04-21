extends KinematicBody2D

var velocity=Vector2.ZERO #Vector2(0,0)
var direction=1 # 1 - right, -1 - left
var timer_started=false

const THROW_VELOCITY=Vector2(1400,-1000)

func _ready():
	launch()
	$AudioStreamPlayer2D.play()
	
func _physics_process(delta):
	velocity.y+=Globals.GRAVITY*0.5
	var collision=move_and_collide(velocity*delta)
	if collision!=null or position.y>Globals.LEVEL_LIMIT:
		if (!timer_started):
			$Timer.start()
			timer_started=true
		$Sprite.hide()
		$CollisionShape2D.disabled=true


func launch():
	velocity=THROW_VELOCITY*Vector2(direction, 1)


func _on_Timer_timeout():
	queue_free()
