extends CanvasLayer


func game_over() -> void:
	get_tree().paused = true
	self.show()
	get_node("../GUI").hide()
	$Finalscore.text = "Final Score:" + str(Game.score)

func _on_retry_pressed() -> void:
	Game.score = 0
	get_tree().paused = false
	get_tree().reload_current_scene()
