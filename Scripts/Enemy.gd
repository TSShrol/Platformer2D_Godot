extends Area2D


func _ready():
	pass


func _on_Enemy_body_entered(body):
	if body.has_method("hurt"):
		get_tree().call_group("Rules","hurt")
		body.hurt()
	#if body.name=="Player"
	#if body in KinematicBody2D
	#print("Ой-йой!!!")





func _on_Area2D_body_entered(body):
	if body.is_in_group("Projectile"):
		$AudioStreamPlayer2D.play()
		$Timer.start()
		$CollisionShape2D.disabled=true
		$AnimatedSprite.hide()
		print("kill!!!")
		

func _on_Timer_timeout():
	queue_free()
