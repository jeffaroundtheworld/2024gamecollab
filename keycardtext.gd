extends Control


# Called when the node enters the scene tree for the first time.
func _ready():
	$text.visible = false


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Globals.ending == 1:
		$text.visible = true
		$Timer.start()


func _on_timer_timeout():
	$text.visible = false
	queue_free()
