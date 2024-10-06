extends ParallaxBackground

@onready var speed: int = 30

func _process(delta: float):
	scroll_offset.x -= speed * delta

func _on_area_2d_body_entered(body: Node2D) -> void:
	if "Player" in body.name:
		print("Game over")
		get_node("../GameOverUI").game_over()
