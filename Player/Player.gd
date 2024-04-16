extends CharacterBody3D

@export var playerSpeed = 7.0
@export var playerAcceleration = 5.0
@export var cameraSensitivity =0.25
@export var cameraAcceleration = 5.0
@export var jumpForce = 5.4
@export var gravity = 12.0
@export var attack = 0


@onready var head =$Head
@onready var camera = $Head/Camera3D
@onready var hand = $Hand
@onready var flashlight = $Hand/SpotLight3D


var direction = Vector3.ZERO
var head_y_axis =0.0
var camera_x_axis =0.0
var health = 100
var climb = 0
var CorrectSound = preload("res://Player/concrete-footsteps-6752.mp3")

func _ready():
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
	#DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_FULLSCREEN)

func _input(event):
	if event is InputEventMouseMotion:
		head_y_axis += event.relative.x * cameraSensitivity
		camera_x_axis += event.relative.y * cameraSensitivity
		camera_x_axis = clamp(camera_x_axis, -90.0 , 90.0)
	
	if Input.is_key_pressed(KEY_ESCAPE):
		get_tree().quit()
	
	

func _process(delta):
	print(velocity.z)
	if velocity.z>0.5 or velocity.z<(-0.5) or velocity.x>0.5 or velocity.x<(-0.5):
		$AudioStreamPlayer3D.stream = CorrectSound
		$AudioStreamPlayer3D.play()
	else:
		$AudioStreamPlayer3D.stop()
	if get_tree().current_scene.name == "Sketchfab_Scene_1" and position.z>-0.4 and position.z<0.23 and position.x>33.1 and position.x<33.7 and position.y<5 and Input.is_key_pressed(KEY_W) and head_y_axis<(-90) and head_y_axis>(-270):
		climb = 1
	if climb == 1:
		position.x = 33.460
		position.z = -0.02
		if Input.is_key_pressed(KEY_W):
			velocity.y = 5
		if Input.is_key_pressed(KEY_S):
			velocity.y = -5
			if position.y<1.9:
				climb = 0
		if !Input.is_key_pressed(KEY_S) and !Input.is_key_pressed(KEY_W):
			velocity.y = 0
		if position.y>14.5:
			position.z = 1.5
			climb = 0
	if climb == 0:
		direction = Input.get_axis("left","right")* head.basis.x + Input.get_axis("forewards", "backwards") * head.basis.z
		velocity = velocity.lerp(direction * playerSpeed + velocity.y * Vector3.UP, playerAcceleration * delta)
		if Input.is_action_just_pressed("jump") and is_on_floor():
			velocity.y += jumpForce
		else:
			velocity.y -= gravity * delta
	
	
	head.rotation.y = lerp(head.rotation.y, -deg_to_rad(head_y_axis), cameraAcceleration *delta )
	camera.rotation.x = lerp(camera.rotation.x, -deg_to_rad(camera_x_axis), cameraAcceleration *delta )
	
	hand.rotation.y = -deg_to_rad(head_y_axis)
	flashlight.rotation.x = -deg_to_rad(camera_x_axis)
	
	
	if health>0:
		if attack == 1:
			health = health-1
			camera.damages = 1
		else:
			camera.damages = 0
	else:
		get_tree().quit()
		
	move_and_slide()
