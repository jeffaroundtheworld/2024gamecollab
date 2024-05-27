extends CharacterBody3D

@export var playerSpeed = 7.0
@export var playerAcceleration = 5.0
@export var cameraSensitivity =0.25
@export var cameraAcceleration = 5.0
@export var jumpForce = 5.4
@export var gravity = 12.0
var attack = 0


@onready var head =$Head
@onready var camera = $Head/Camera3D
@onready var hand = $Hand
@onready var flashlight = $Hand/SpotLight3D
@onready var spawn_point = get_parent().get_node("Area3D2")


var direction = Vector3.ZERO
var head_y_axis =0.0
var camera_x_axis =0.0
var health = 100
var climb = 0
var climb2 = 0
var phase = 0
var CorrectSound = preload("res://Player/concrete-footsteps-6752.mp3")

func _ready():
	
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED) #Capture mouse
	#DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_FULLSCREEN) # Full screen

func _input(event):
#Calculate camera and flashlight motion
	if event is InputEventMouseMotion:
		head_y_axis += event.relative.x * cameraSensitivity
		camera_x_axis += event.relative.y * cameraSensitivity
		camera_x_axis = clamp(camera_x_axis, -90.0 , 90.0)

# Return to main menu on escape key pushed
	if Input.is_key_pressed(KEY_ESCAPE):
		get_tree().change_scene_to_file("res://Menu Screen/title_screen.tscn")
		Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
	
	

func _process(delta):
#Spawn to correct point in level 2
	if Globals.respawn == 1: 
		if get_tree().current_scene.name == "Sketchfab_Scene_2":
			Globals.respawn = 0
			position.x = -5
			position.y = -30
			position.z = 61
		else:
			Globals.respawn = 0
	print(Globals.respawn)
#Going through hole in wall in level 2
	if get_tree().current_scene.name == "Sketchfab_Scene_2" and position.y<-20: 
		if position.x<-35.5 and position.x>-35.6:
			$CollisionShape3D.set_deferred("disabled", true)
			phase = 1
		if position.x<-38.54:
			phase = 0
			$CollisionShape3D.set_deferred("disabled", false)
		if position.x>-38.53 and position.x<-38.43:
			phase = 1
			$CollisionShape3D.set_deferred("disabled", true)
		if position.x>-35.0:
			phase = 0
			$CollisionShape3D.set_deferred("disabled", false)
	
#Play footstep sound
	if abs(velocity.x)>0.5 or abs(velocity.z)>0.5:
		if !$AudioStreamPlayer3D.is_playing():
			$AudioStreamPlayer3D.stream = CorrectSound
			$AudioStreamPlayer3D.play()
	else: 
		$AudioStreamPlayer3D.stop()
	
#New player imput controls for ladder climbing
	if climb == 1 or climb2 == 1:
		if Input.is_key_pressed(KEY_W):
			velocity.y = 5
		if Input.is_key_pressed(KEY_S):
			velocity.y = -5
		if !Input.is_key_pressed(KEY_S) and !Input.is_key_pressed(KEY_W):
			velocity.y = 0
		
#Center player on ladder in level 3
	if climb == 1:
		position.x = 33.460
		position.z = -0.02
		if Input.is_key_pressed(KEY_S):
			if position.y<1.9:
				climb = 0
		if position.y>14.5:
			position.z = 1.5
			climb = 0
#Center player on ladder in level 2
	if climb2 == 1:
		position.x = -43.7
		position.z = -44.14
		if Input.is_key_pressed(KEY_S):
			if position.y<-23.8:
				climb2 = 0
		if position.y>19.5:
			position.z = -43
			climb2 = 0

#Regular player controls
	if climb == 0 and climb2 == 0:
		direction = Input.get_axis("left","right")* head.basis.x + Input.get_axis("forewards", "backwards") * head.basis.z
		velocity = velocity.lerp(direction * playerSpeed + velocity.y * Vector3.UP, playerAcceleration * delta)
		if Input.is_action_just_pressed("jump") and is_on_floor():
			velocity.y += jumpForce
		else:
			velocity.y -= gravity * delta
			
#Going through hole in wall
	if phase == 1:
		position.z = -42.4
		velocity.z = 0
		velocity.y = 0
	
#Camera look and flashlight
	head.rotation.y = lerp(head.rotation.y, -deg_to_rad(head_y_axis), cameraAcceleration *delta )
	camera.rotation.x = lerp(camera.rotation.x, -deg_to_rad(camera_x_axis), cameraAcceleration *delta )
	hand.rotation.y = -deg_to_rad(head_y_axis)
	flashlight.rotation.x = -deg_to_rad(camera_x_axis)
	
#Monster damage from attack
	if health>0:
		if attack == 1:
			health = health-1
			camera.damages = 1
		else:
			camera.damages = 0
	else:
		get_tree().quit()

#Write motion
	move_and_slide()
