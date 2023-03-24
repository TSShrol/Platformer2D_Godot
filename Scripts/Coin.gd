extends Node2D
var coin_taken=false

func _ready():
	pass


func _on_Area2D_body_entered(body):
	#if not coin_taken:
	if coin_taken==false:
		get_tree().call_group("Rules","coin_get")
		$Area2D/AudioStreamPlayer2D.play()
		$Area2D/Sprite.hide()
		$Area2D/Timer.start()
		coin_taken=true
	



func _on_Timer_timeout():
	queue_free()
