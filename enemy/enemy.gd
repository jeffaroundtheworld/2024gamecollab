extends CharacterBody3D
@onready var player = get_parent().get_parent().get_parent().get_node(\"Player\")
@onready var spawner = get_parent()
@export var move_speed = 4

var dir_x
var dir_z
var dir_y
const attack_range = 2
const hide_range = 15


func _physics_process(delta):
	var dir = player.global_position - global_position
	dir = dir.normalized()
	dir_x = abs(abs(player.global_position.x) - abs(global_position.x))
	dir_z = abs(abs(player.global_position.z) - abs(global_position.z))
	dir_y = abs(abs(player.global_position.y) - abs(global_position.y))
	
	velocity = dir * move_speed
	
	if (dir_x<attack_range) and (dir_z<attack_range) and (dir_y<0.5):
		player.attack = 1
	else:
		player.attack = 0
	
	if (dir_x>hide_range) or (dir_z>hide_range) or (dir_y>hide_range):
		spawner.count = 0
		queue_free()
	
	move_and_slide()
