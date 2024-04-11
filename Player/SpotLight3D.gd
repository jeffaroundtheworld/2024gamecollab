extends SpotLight3D
var CorrectSound = preload("res://sound effects/Flashlight Sound.mp3")

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_just_pressed("on"):
		$AudioStreamPlayer3D.stream = CorrectSound
		$AudioStreamPlayer3D.play()
		if light_energy==1:
			light_energy=0
		else:
			light_energy=1

