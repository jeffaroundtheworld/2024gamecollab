extends Node3D

var enemy = preload("res://enemy/enemy.tscn")

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_triggerspawn_body_entered(body,triggerspawn):
	if body.name == "Player":
		var newenemy = enemy.instantiate()
		add_child(newenemy)
