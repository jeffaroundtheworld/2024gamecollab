extends Control



var dialogue = [
'...name? IS THAT YOU???',
'Yes I-',
'I THOUGHT I WAS ALL ALONE *SOB* I THOUGHT I WAS GONNA DIE',
'Friend do you-',
'IM SO GLAD YOU ARE OKAY I-',
'*SNIFF*...Sorry. Im sorry', #choice1
'Sorry, Im just..im okay. Im glad you are here', #choice2
'So... do you know anything about the...things?'
]


var dialogue_list = 0
var dialoguechoice1 = 5
var dialoguechoice2 = 4
#var dialogue2_list = 0
#var dialogue3_list = 0
var finished = false


func _ready():
	if Input.is_action_just_pressed("enter"):
		play_dialogue()
		if dialogue_list == dialoguechoice1:
			dialogue_list += 2
		if dialogue_list == dialoguechoice1:
			dialogue_list += 1
			
			
	$playersprites.frame=0
	$friendsprites.frame=0
	$youlabel.visible = true
	$friendlabel.visible = false
	$box.visible = true
	$boxflipped.visible = false
	$choice1.visible = false
	$choice2.visible = false
	$text2.visible = false
	
func play_dialogue():
	if dialogue_list < dialogue.size():
		$text.bbcode_text = dialogue[dialogue_list]
	dialogue_list += 1
	$friendsprites.frame+=1
	$playersprites.frame+=1
	if dialogue_list%2==0: 
		$friendlabel.visible = true
		$boxflipped.visible = true
		$box.visible = false
		$youlabel.visible = false
	if dialogue_list%2!=0:
		$box.visible = true
		$youlabel.visible = true
		$friendlabel.visible = false
		$boxflipped.visible = false

func _process(delta):
	_ready()
	#if Input.is_action_just_pressed("enter"):
		#play_dialogue()
		#if dialogue_list < dialogue.size():
			#$text.bbcode_text = dialogue[dialogue_list]
		#dialogue_list += 1
		#$friendsprites.frame+=1
		#$playersprites.frame+=1
	#if dialogue_list%2==0: 
		#$friendlabel.visible = true
		#$boxflipped.visible = true
		#$box.visible = false
		#$youlabel.visible = false
	#if dialogue_list%2!=0:
		#$box.visible = true
		#$youlabel.visible = true
		#$friendlabel.visible = false
		#$boxflipped.visible = false
	#if dialogue_list > dialogue.size():
	if dialogue_list > dialoguechoice1:
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
	dialogue_list += 1
	$friendsprites.frame+=1
	$playersprites.frame+=1
	#$choice1.visible = false
	#$choice2.visible = false
	#$friendsprites.visible = true
	#$playersprites.visible = true
	#if dialogue2_list < dialogue2.size():
		#$text2.bbcode_text = dialogue2[dialogue2_list]
		#$text2.text = dialogue2[dialogue2_list]
	#play_dialogue2()


func _on_choice_2_pressed():
	dialogue_list += 2
	$friendsprites.frame+=2
	$playersprites.frame+=2
