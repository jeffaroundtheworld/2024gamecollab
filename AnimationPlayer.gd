extends AnimationPlayer



# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_detector_body_entered(body):
	if body.name == ("character test"):
		play("ground break")
