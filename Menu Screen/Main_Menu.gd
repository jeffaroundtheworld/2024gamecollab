extends Control

func _ready():
	DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_FULLSCREEN)
	
func _on_play_pressed():
	get_tree().change_scene_to_file("res://Cutscene/introcutscene.tscn")



func _on_quit_pressed():
	get_tree().quit()


func _on_options_pressed():
	get_tree().change_scene_to_file("res://options_screen.tscn")
