extends Area3D

var cutscene = preload("res://dialogue scene/dialogue_scene.tscn")
@onready var light = $OmniLight3D4


func _ready():
	$friendalert.play()



func _on_body_entered(body):
	if body.name == "Player":
		if Globals.ending == 1:
			pass
		else:
			get_tree().paused = true
			var newcutscene = cutscene.instantiate()
			add_child(newcutscene)
			$CollisionShape3D.queue_free()
			Globals.talked = 1
	

func _on_friendalert_finished():
	if get_node("CollisionShape3D") != null:
		$friendalert.play()
	else:
		$friendalert.queue_free()
