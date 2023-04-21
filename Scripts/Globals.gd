extends Node
var lives;
var coin;

const GRAVITY=200
const LEVEL_LIMIT=3000
const UP=Vector2(0,-1)

func _ready():
	lives=5
	coin=0
