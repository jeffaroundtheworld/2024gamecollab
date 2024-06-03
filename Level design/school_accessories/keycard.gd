extends Area3D


# Called when the node enters the scene tree for the first time.
func _ready():
	if Globals.ending > 0:
		queue_free()


func _on_body_entered(body):
	if body.name == "Player":
		Globals.ending += 1
		$keycardgrab.play()



func _on_keycardgrab_finished():
	queue_free()
