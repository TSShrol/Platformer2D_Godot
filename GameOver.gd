extends Control


func _ready():
	pass


func _on_RestartGameBtn_pressed():
	get_tree().change_scene("res://Levels/Level1.tscn")


func _on_EndGameBtn_pressed():
	get_tree().quit()
