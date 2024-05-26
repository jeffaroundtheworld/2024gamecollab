extends Area3D
@export var loading_screen = "res://Level design/loading scene.tscn"
func _on_body_entered(body):
	if body.name == "Player": 
		#if get_tree().current_scene.name == "Sketchfab_Scene_1":
		body.respawn = 1
		get_tree().change_scene_to_file(loading_screen)
		
