extends StaticBody3D

func _process(delta):
	if Globals.talked == 1:
		hide()
		position.x = -39
		position.y = 16
