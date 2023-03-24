extends Node2D
var lives=5
var coin=0


func _ready():
	get_tree().call_group("GUI","add_lives",lives)
	#add_to_group("Rules")

func hurt():
	$Player.hurt()
	lives-=1
	if lives<1:
		finish_game()
	get_tree().call_group("GUI","remove_lives",lives)

#щбільшення кількості монет
func coin_get():
	coin+=1
	get_tree().call_group("GUI","coins_add",coin)
	#print(coin)
	
func finish_game():
	get_tree().change_scene("res://Scences/GameOver.tscn")
