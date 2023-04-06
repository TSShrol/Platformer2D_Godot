extends Node2D


func _ready():
	print(Globals.lives)
	get_tree().call_group("GUI","add_lives",Globals.lives)
	#add_to_group("Rules")

func hurt():
	$Player.hurt()
	Globals.lives-=1
	if Globals.lives<1:
		finish_game()
	get_tree().call_group("GUI","remove_lives",Globals.lives)

#щбільшення кількості монет
func coin_get():
	Globals.coin+=1
	get_tree().call_group("GUI","coins_add",Globals.coin)
	#print(coin)
	
func finish_game():
	get_tree().change_scene("res://Scences/GameOver.tscn")
