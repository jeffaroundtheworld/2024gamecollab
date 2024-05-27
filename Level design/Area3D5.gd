extends Area3D

func _on_body_entered(body):
	Globals.respawn = 1
	get_tree().change_scene_to_file("res://Level design/loading scene 2.tscn")
