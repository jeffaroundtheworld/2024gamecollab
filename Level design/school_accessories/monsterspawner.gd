extends Node3D
var count = 0
var enemy = preload("res://enemy/enemy.tscn")

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass



func _on_triggerspawn_body_entered(body):
	if body.name == "Player" and count == 0:
		count = 1
		var newenemy = enemy.instantiate()
		add_child(newenemy)


func _on_triggerspawn_2_body_entered(body):
	pass # Replace with function body.
