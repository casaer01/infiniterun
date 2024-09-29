extends ParallaxBackground

@onready var speed: int = 30

func _process(delta: float):
	scroll_offset.x -= speed * delta
