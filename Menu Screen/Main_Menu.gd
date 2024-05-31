extends Control

func _ready():
	DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_FULLSCREEN)
	Globals.ending = 0
	Globals.respawn = 0
	Globals.talked = 0 
	Globals.cough = 0
func _on_play_pressed():
	get_tree().change_scene_to_file("res://Cutscenes/introcutscene.tscn")








func _on_controls_pressed():
	get_tree().change_scene_to_file("res://Menu Screen/options_screen.tscn")
	
	
	


func _on_quit_pressed():
	get_tree().quit()
