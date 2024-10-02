extends Node

var platform_scene:PackedScene = preload("res://Scenes/platform.tscn")
var pool_size:int = 4
var platform_pool:Array = []

# Called when the node enters the scene tree for the first time.
func _ready():
	for i in range(pool_size):
		var platformTemp: Node2D = platform_scene.instantiate()
		platformTemp.show()
		
#		platform size is the length
		platformTemp.platform_size = 3
		platformTemp.set_platform()
		
#		platform position is where the platform will be placed
		platformTemp.position = Vector2(i*(40*3), 200)
		platform_pool.append(platformTemp)
		add_child(platformTemp)
