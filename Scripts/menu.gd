extends Node2D



func _on_quit_pressed() -> void:
	get_tree().change_scene_to_file("") #TODO

func _on_game_pressed() -> void:
	get_tree().quit()
