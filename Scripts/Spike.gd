extends Area2D


func _ready():
	pass


func _on_Spike_body_entered(body):
	if body.has_method("hurt"):
		get_tree().call_group("Rules","hurt")
		#body.hurt()
	#if body.name=="Player"
	#if body in KinematicBody2D
	#print("Ой-йой!!!")
