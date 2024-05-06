extends CharacterBody3D
const SPEED = 8 #Movement speed
const JUMP_VELOCITY = 4.5 #Jump speed
@export var sensitivity = 200 #Mouse movement sensitivity
const upLook_limit = -45 #Limit of looking up (degrees)
const downLook_limit = 0  # Limit of looking down (degrees)

#Jumping variables
var jumps_remaining = 2

#Movement variables
var acc_left = 0
var acc_right = 0
var acc_up = 0
var acc_down = 0
var acc_x = 0
var acc_y = 0
var speed_x = 0
var speed_y = 0
var angle = 0

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/3d/default_gravity")

func _physics_process(delta):
	# Add the gravity.
	if not is_on_floor():
		velocity.y -= gravity * delta
	else:
		jumps_remaining = 2

	#Character Jump
	if Input.is_action_just_pressed("jump") and jumps_remaining > 0:
		velocity.y = JUMP_VELOCITY

	# get directional imput and calculate vectors
	if Input.is_action_pressed("left"):
		acc_left = SPEED
	else:
		acc_left = 0
	if Input.is_action_pressed("right"):
		acc_right = SPEED
	else:
		acc_right = 0
	if Input.is_action_pressed("backwards"):
		acc_down = SPEED
	else:
		acc_down = 0
	if Input.is_action_pressed("forewards"):
		acc_up = SPEED
	else:
		acc_up = 0
	acc_x = acc_right - acc_left
	acc_y = acc_down - acc_up
	
	#Calculate movement vectors
	speed_x = (cos(angle)*acc_x) - (sin(angle)*acc_y)
	speed_y = (sin(angle)*acc_x) + (cos(angle)*acc_y)
	
	#apply motion to character
	velocity.x = speed_x 
	velocity.z = speed_y
	move_and_slide()


# Handles camera and flashlight following mouse movement
func _input(event):
	if event is InputEventMouseMotion:
		#character rotation left/right
		rotation.y -= event.relative.x / sensitivity
		
		#Camera and flashlight movement up/down
		$CameraPivot.rotation.x -= event.relative.y / sensitivity
		$CameraPivot.rotation.x = clamp($CameraPivot.rotation.x, deg_to_rad(upLook_limit), deg_to_rad(downLook_limit))

		# Get rotation angle to create motion vectors
		angle += ((event.relative.x / sensitivity))