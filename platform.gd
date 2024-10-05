extends TileMapLayer

var speed: int = 100
var platformSize:int = 1
@onready var coin:PackedScene = preload("res://Scenes/coin.tscn")

func set_platform():
	for i in range(platformSize):
		set_cell(Vector2(i,0), 0, Vector2(0,0), 0)

func _physics_process(delta: float) -> void:
	position.x -= speed * delta

func add_coins() -> void:
	for i in platformSize:
		var coinTemp = coin.instantiate()
		coinTemp.position = map_to_local(Vector2i(i,0)) + Vector2(0,-80)
		add_child(coinTemp)
