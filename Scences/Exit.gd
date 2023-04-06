extends Node2D


func _ready():
	pass


func _on_Area2D_body_entered(body):
	#get_tree().change_scene("res://Scences/Win.tscn")
	print(get_tree().get_current_scene().get_name())
	if (get_tree().get_current_scene().get_name()=="Level2"):
		get_tree().change_scene("res://Scences/Win.tscn")
	else:
		get_tree().change_scene("res://Levels/Level2.tscn")
	pass # Replace with function body.

