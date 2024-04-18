extends Control

var dialogue = [
'yo, im testing out this dialogue yo, this is crazy yo',
'woah, me too bro, thats crazy bro. What the hell bro',
'i can\'t do this dawg, HELP ME IM STUUUUUUUUUCK!!!!'
]

var dialogue_list = 0
var finished = false


func _ready():
	play_dialogue()
	$playersprite.frame=0


func _process(delta):
	if Input.is_key_pressed(KEY_ENTER):
		play_dialogue()
		$playersprite.frame+=1

	

func play_dialogue():
	if dialogue_list < dialogue.size():
		$text.bbcode_text = dialogue[dialogue_list]
	else:
		queue_free()
	dialogue_list += 1
