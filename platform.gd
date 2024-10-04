extends TileMapLayer

var speed: int = 100
var platformSize:int = 1

func set_platform():
	for i in range(platformSize):
		set_cell(Vector2(i,0), 1, Vector2(0,0), 0)

func _physics_process(delta: float) -> void:
	position.x -= speed * delta
