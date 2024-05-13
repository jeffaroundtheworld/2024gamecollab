extends CharacterBody3D

var cutscene = preload("res://dialogue_testing.tscn")



func _ready():
	cutscene.instantiate()
#func _on_body_entered(body):
	#if body.name == "player":
		#instanciate the scene fo te dialogue


