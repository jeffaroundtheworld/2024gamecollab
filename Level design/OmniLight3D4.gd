extends OmniLight3D

func _process(delta):
	if Globals.talked == 1:
		position.y = 15.7
