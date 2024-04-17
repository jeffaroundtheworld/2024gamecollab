extends Camera3D
@export var damages = 0
@onready var pain = $AnimationPlayer

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if damages == 1:
		pain.play("damage")
