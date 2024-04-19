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
	$playersprites.frame=0
	$friendsprites.frame=0
	$youlabel.visible = false
	$friendlabel.visible = false
	$box.hide()
	$boxflipped.hide()
	

func _process(delta):
	if Input.is_action_just_pressed("enter"):
		play_dialogue()
		$playersprites.frame+=1
		$friendsprites.frame+=1
	if dialogue_list == [1,2]: #fix this
		$youlabel.visible = true
		$box.show()
	elif $box.visibility == true:
		$box.hide()
		
	else:
		$friendlabel.visible = true
		$boxflipped.show()
		


func play_dialogue():
	if dialogue_list < dialogue.size():
		$text.bbcode_text = dialogue[dialogue_list]
	else:
		queue_free()
	dialogue_list += 1
