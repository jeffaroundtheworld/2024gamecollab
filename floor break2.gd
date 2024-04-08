extends MeshInstance3D

signal floor_break
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _on_body_entered(body):
	if body.name == "character test":
		emit_signal("floor_break")
		
		queue_free()

