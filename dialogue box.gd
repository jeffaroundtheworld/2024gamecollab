extends Control



var dialogue = [
'!!!',
'...name? IS THAT YOU???',
'Yes I-',
'I THOUGHT I WAS ALL ALONE *SOB* I THOUGHT I WAS GONNA DIE',
'Friend do you-',
'IM SO GLAD YOU ARE OKAY I-',
'what the sigma.'
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
	elif dialogue_list%2!=0:
		$box.visible = true
		$youlabel.visible = true
		$friendlabel.visible = false
		$boxflipped.visible = false
	elif dialogue_list > dialogue.size():
		options()
		

		
func play_dialogue():
	if dialogue_list < dialogue.size():
		$text.bbcode_text = dialogue[dialogue_list]
	dialogue_list += 1

func options():
	$choice1.visible = true 
	$choice2.visible = true
	$friendlabel.visible = false
	$boxflipped.visible = false
	$box.visible = false
	$youlabel.visible = false



