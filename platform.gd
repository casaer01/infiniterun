extends TileMapLayer

var speed: int = 100
var platform_size:int = 2

func _ready():
	for i in range(platform_size):
		set_cell(Vector2(i,0), 0, Vector2(0,0), 0)

func _physics_process(delta: float):
	position.x -= speed * delta
