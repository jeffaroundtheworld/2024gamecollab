extends Area3D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_body_entered(body):
	if body.name == "Player":
		Globals.ending += 1
		print(Globals.ending)
		$keycardgrab.play()
		


func _on_keycardgrab_finished():
	queue_free()
