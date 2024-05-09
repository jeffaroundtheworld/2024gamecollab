extends Control




func _on_video_stream_player_finished():
	get_tree().change_scene_to_file("res://Level design/school.tscn")
	
	


func _on_skip_pressed():
	get_tree().change_scene_to_file("res://Level design/school.tscn")
