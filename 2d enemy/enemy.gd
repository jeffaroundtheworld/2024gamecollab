extends CharacterBody3D

@onready var animated_sprite_3d = $AnimatedSprite3D
@export var move_speed = 2
@export var attack_range = 2

@onready var player = get_parent().get_node("Player")
var dead = false 

func _physics_process(delta):
	if dead : 
		return
	
	var dir = player.global_position - global_position
	var dir_y = 0
	dir = dir.normalized()
	
	velocity = dir * move_speed
	move_and_slide()
	
	
