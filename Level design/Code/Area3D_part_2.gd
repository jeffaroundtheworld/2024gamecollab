extends Area3D
func _on_body_entered(body):
	if body.name == "Player":
		#get_tree().change_scene_to_file("res://Menu Screen/win_screen.tscn")
		#You saved your friend
		if Globals.ending > 1:
			get_tree().change_scene_to_file("res://Menu Screen/win_screen.tscn")
		elif Globals.ending < 2: # you did not save friend
			get_tree().change_scene_to_file("res://Menu Screen/endscreen.tscn")

			#^^^^^^^different ending code, but the scenes arent done 
