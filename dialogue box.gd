extends Control



var dialogue = [
'hey its me, the player',
'now its me, your friend!!!!!!!!',
'i can\'tbelieve its me, the player, the one and only, again!!!!',
'back to me, the friend!!'
]

var dialogue2 = [
	'Im so sorry oh my god oh god we are going to die',
	'just be quiet, okay?',
	'okay.',
]

var dialogue_list = 0
var finished = false


func _ready():
	play_dialogue()
	$playersprites.frame=0
	$friendsprites.frame=0
	$youlabel.visible = true
	$friendlabel.visible = false
	$box.visible = true
	$boxflipped.visible = false
	$choice1.visible = false
	$choice2.visible = false
	

func _process(delta):
	if Input.is_action_just_pressed("enter"):
		play_dialogue()
		$friendsprites.frame+=1
		$playersprites.frame+=1
	if dialogue_list%2==0: 
		$friendlabel.visible = true
		$boxflipped.visible = true
		$box.visible = false
		$youlabel.visible = false
	else:
		$box.visible = true
		$youlabel.visible = true
		$friendlabel.visible = false
		$boxflipped.visible = false
	

	


func play_dialogue():
	if dialogue_list < dialogue.size():
		$text.bbcode_text = dialogue[dialogue_list]
	else:
		queue_free()
		$choice1.visible = true
		$choice2.visible = true
	dialogue_list += 1




