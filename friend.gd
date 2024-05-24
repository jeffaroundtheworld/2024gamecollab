extends Area3D

var cutscene = preload("res://dialogue scene/dialogue_scene.tscn")



func _ready():
	$friendalert.play()



func _on_body_entered(body):
	if body.name == "Player":
		get_tree().paused = true
		var newcutscene = cutscene.instantiate()
		add_child(newcutscene)
		$CollisionShape3D.queue_free()
	

func _on_friendalert_finished():

	if get_node("CollisionShape3D") != null:
		$friendalert.play()
	else:
		$friendalert.queue_free()

