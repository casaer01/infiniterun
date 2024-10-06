extends Node

var platform_scene: PackedScene = preload("res://Scenes/platform.tscn") # Replace with the path to your platform scene
var pool_size: int = 4
var platform_pool: Array = []
var spawn_timer: float = 2.0 # Adjust this to control platform spawn frequency
var player: Node = null

func _ready() -> void:
	for i in range(pool_size):
		var platform: Node2D = platform_scene.instantiate() as Node2D # Adjust the type if your platform is a different type
		platform.show()  # Show the platform initially, adjust according to your logic
		platform.platformSize = 3
		platform.set_platform()
		platform.position = Vector2(i * (40 * 3), 200)
		platform_pool.append(platform)
		add_child(platform)
	
func _physics_process(delta: float) -> void:
	if get_node("../Player").position.x < -100:
		get_node("../GameOverUI").game_over()
	for platform in platform_pool:
		if platform.position.x < -200:
			reset_platform(platform)
			add_platform()

func create_platform() -> Node2D:
	for platform in platform_pool:
		if not platform.visible:
			return platform as Node2D
	var platform: Node2D = platform_scene.instantiate() as Node2D
	platform.hide()
	platform_pool.append(platform)
	add_child(platform)
	return platform


func reset_platform(platform: Node2D) -> void:
	platform.global_position = Vector2(-1000, -1000)
	platform.hide()

func add_platform() -> void:
	for platform in platform_pool:
		if not platform.visible:
			var pos: int = platform_pool.find(platform)
			platform.show()
			platform.platformSize = randi_range(2, 5)
			platform.position.y = randi_range(80, 200)
			
			var spawnPosX: float
			if pos > 0:
				spawnPosX = platform_pool[pos - 1].global_position.x + (platform_pool[pos - 1].platformSize * 40) + 80
			else:
				spawnPosX = platform_pool[pool_size - 1].global_position.x + (platform_pool[pool_size - 1].platformSize * 40) + 80
			
			platform.global_position.x = spawnPosX
			platform.set_platform()
			platform.add_coins()
