extends Control



var dialogue = [
'hey its me, the player',
'now its me, your friend!!!!!!!!',
'i can\'tbelieve its me, the player, the one and only, again!!!!',
'back to me, the friend!!'
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
	

func _process(delta):
	if Input.is_action_just_pressed("enter"):
		play_dialogue()
		$friendsprites.frame+=1
		$playersprites.frame+=1
	if dialogue_list%2==0: 
		$friendlabel.visible = true
		$boxflipped.visible = true
	elif $friendlabel.visible == true: #get rid of this ordering fixed
		$boxflipped.visible = true
		$box.visible = false
		$youlabel.visible = false
	elif $youlabel.visible == true:
		$box.visible = true
		$friendlabel.visible = false
		$boxflipped.visible = false
	else:
		$box.visible = true
		$youlabel.visible = true
	


func play_dialogue():
	if dialogue_list < dialogue.size():
		$text.bbcode_text = dialogue[dialogue_list]
	else:
		queue_free()
	dialogue_list += 1
