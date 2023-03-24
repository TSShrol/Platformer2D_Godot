extends Node2D


func _ready():
	pass


func _on_Area2D_body_entered(body):
	#get_tree().change_scene("res://Scences/Win.tscn")
	get_tree().change_scene("res://Levels/Level2.tscn")
	pass # Replace with function body.

