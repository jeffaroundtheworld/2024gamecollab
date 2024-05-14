extends Area3D

var cutscene = preload("res://dialogue scene/dialogue_scene.tscn")



func _ready():
	pass



func _on_body_entered(body):
	if body.name == "player":
		var newcutscene = cutscene.instantiate()
		add_child(newcutscene)
