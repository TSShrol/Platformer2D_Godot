extends CanvasLayer


func _ready():
	pass

func add_lives(live_count):
	while live_count>$Control/HeartsContainer.get_child_count():
		$Control/HeartsContainer.add_child(load("res://Scences/heart.tscn").instance())
	
func remove_lives(live_count):
	if live_count<$Control/HeartsContainer.get_child_count():
		var heart=$Control/HeartsContainer.get_child(0)
		heart.queue_free()
		# АБО
		# $Control/HeartsContainer.get_child(0).queue_free()

func coins_add(coins_count):
	$Control/CoinsContainer/Label.text=str(coins_count)
