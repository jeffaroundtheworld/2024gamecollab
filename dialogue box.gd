extends Control



var dialogue = [
'...name? IS THAT YOU???',
'Yes I-',
'I THOUGHT I WAS ALL ALONE *SOB* I THOUGHT I WAS GONNA DIE',
'Friend do you-',
'IM SO GLAD YOU ARE OKAY I-'

]

var dialogue1 = ['*SNIFF*...Sorry. Im sorry', 
'About that thing...you saw it?',
'that thing..those things.. i didnt just see them. They...I think know them'
]

var dialogue2 = ['Sorry, Im just..im okay. Im glad you are here']

var dialogue_list = 0
#var dialogue2_list = 0
#var dialogue3_list = 0
var finished = false


func _ready():
	$playersprites.frame=0
	$friendsprites.frame=0
	$youlabel.visible = true
	$friendlabel.visible = false
	$box.visible = true
	$boxflipped.visible = false
	$choice1.visible = false
	$choice2.visible = false

	
func play_dialogue():
	if dialogue_list < dialogue.size():
		$text.bbcode_text = dialogue[dialogue_list]
	dialogue_list += 1
	$friendsprites.frame+=1
	$playersprites.frame+=1
	if dialogue_list%2!=0: 
		$friendlabel.visible = true
		$boxflipped.visible = true
		$box.visible = false
		$youlabel.visible = false
	if dialogue_list%2==0:
		$box.visible = true
		$youlabel.visible = true
		$friendlabel.visible = false
		$boxflipped.visible = false

func _process(delta):
	if Input.is_action_just_pressed("enter"):
		play_dialogue()
	if dialogue_list > dialogue.size():
		options()
	

		
#func play_dialogue():
	#if dialogue_list < dialogue.size():
		#$text.bbcode_text = dialogue[dialogue_list]
	#dialogue_list += 1

func options():
	$choice1.visible = true 
	$choice2.visible = true
	$friendlabel.visible = false
	$boxflipped.visible = false
	$box.visible = false
	$youlabel.visible = false
	$text.visible = false


#func play_dialogue2():
	#if dialogue2_list%2!=0: 
		#$friendlabel.visible = true
		#$boxflipped.visible = true
		#$box.visible = false
		#$youlabel.visible = false
		#$text2.visible = true
	#else:
		#$friendlabel.visible = false
		#$boxflipped.visible = false
		#$box.visible = true
		#$youlabel.visible = true
		#$text2.visible = false
	#dialogue2_list += 1
	#$friendsprites.frame+=1
	#$playersprites.frame+=1


func _on_choice_1_pressed():
	dialogue += dialogue1
	$friendsprites.frame+=1
	$playersprites.frame+=1
	$choice1.visible = false 
	$choice2.visible = false
	$text.visible = true
	pla_dialogue()
	


func _on_choice_2_pressed():
	dialogue += dialogue2
	dialogue_list += 1
	$friendsprites.frame+=2
	$playersprites.frame+=2
