extends SpotLight3D
var CorrectSound = preload("res://sound effects/Flashlight Sound.mp3")

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

var MAX_TIME = 0.8
var RAND_INTERVAL = 550
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	$AudioStreamPlayer3D.stream = CorrectSound
	if randi_range(0, RAND_INTERVAL) == RAND_INTERVAL and light_energy == 1:
		light_energy = 0
		$AudioStreamPlayer3D.play()
		await get_tree().create_timer(randf_range(0.1, MAX_TIME)).timeout
		light_energy = 1
		$AudioStreamPlayer3D.play()
		
	if Input.is_action_just_pressed("on"):

		$AudioStreamPlayer3D.play()
		if light_energy==1:
			light_energy=0
		else:
			light_energy=1

