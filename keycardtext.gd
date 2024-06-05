extends CanvasLayer


# Called when the node enters the scene tree for the first time.
func _ready():
	visible = false

func _on_timer_timeout():
	queue_free()


func _on_keycard_body_entered(body):
	if body.name == "Player":
		$Timer.start()
		visible = true
