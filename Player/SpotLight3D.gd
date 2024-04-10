extends SpotLight3D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	print(light_energy)
	if Input.is_action_just_pressed("on"):
		
		if light_energy==1:
			light_energy=0
		else:
			light_energy=1

