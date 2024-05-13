extends Control



var dialogue = [
'..Rory?',
'...Sasha? IS THAT YOU???',
'Yes I-',
'I THOUGHT I WAS ALL ALONE *SOB* I THOUGHT I WAS GONNA DIE',
'Rory do you-',
'IM SO GLAD YOU ARE OKAY I-'
]

var dialogue1 = [
'space',
'*SNIFF*...Sorry. Im sorry. The last thing we need is one of them hearing us..', 
'"Them".....You saw that thing?',
'That thing..Those things.. I didnt just see them. They...I think know them',
'Know them?',
'*Sigh*...Im not really sure..The last few hours have been such a blur....but there used to be other students running around here...until they..',
'....Other students..Those things did look somewhat.. "Human"..',
'Ugh..Id really rather not think about that right now..Whatver they are they are NOT friendly..',
'Right. lets get you out of there *rattle rattle* huh? *rattle rattle*',
'Its locked. Trust me *sniff* I tried.',
'How did you even get in there?',
'Well during this whole comotion, I got scared and was running from..something. It was dark and I didnt know where to go. The gate was open when I entered, but as soon as I shut it it clicked into place..',
'hmmmm....Did you look for a key?',
'No luck. Besides, I think it needs a keycard...Could you find it?'
]

var dialogue2 = [
	'space',
	'Sorry, Im just..im okay. Im glad you are here',
	'Its alright, you aren\'t alone anymore. Can you tell me what happened?',
	'*Sigh*...Im not really sure..The last few hours have been such a blur....but there used to be other students running around here...until they..',
	'Did something happen to them?',
	'...Im not sure honestly. But students were screaming, and it didnt sound quite...human.. ',
	'Not quite human...Like that "thing" I saw...What happened?',
	'There was this big comotion.. I got scared and was running from..something. It was dark and I didnt know where to go. The gate was open when I entered, but as soon as it shut it clicked into place..',
	'You\'re locked in? *rattle rattle* do you see a key?',
	'Ive looked all over. If there was one I would have found it. Besides, this door seems to require a keycard... Could you find it?'
	]
	
var dialogue3 = [
	'space',
	'You want me to just wait here? I..I guess so. Though if you do find the keycard...Well..Take care.',
	'Goodbye'
]
var dialogue4 = [
	'space',
	'Sasha....Please stay safe. Ill do my best to stay calm here. Thank you.',
	'Of course. Goodbye, Ill see you soon. TEST TEST TEST'
]
var dialogue_list = 0
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
	$choice3.visible = false
	$choice4.visible = false
		

	
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
	if Input.is_action_just_pressed("enter"):
		play_dialogue()
	if dialogue_list > dialogue.size():
		options()


func options():
	if dialogue_list < 14:
		$choice1.visible = true 
		$choice2.visible = true
	else:
		$choice3.visible = true
		$choice4.visible = true
	$friendlabel.visible = false
	$boxflipped.visible = false
	$box.visible = false
	$youlabel.visible = false
	$text.visible = false


func _on_choice_1_pressed():
	dialogue += dialogue1
	$friendsprites.frame+=1
	$playersprites.frame+=1
	$choice1.visible = false 
	$choice2.visible = false
	$text.visible = true
	play_dialogue()
	


func _on_choice_2_pressed():
	dialogue += dialogue2
	$friendsprites.frame+=1
	$playersprites.frame+=1
	$choice1.visible = false 
	$choice2.visible = false
	$text.visible = true
	play_dialogue()


func _on_choice_3_pressed():
	dialogue += dialogue3
	$friendsprites.frame+=1 #fix it so it doesnt skip ahead. this isnt needed
	$playersprites.frame+=1
	$choice3.visible = false 
	$choice4.visible = false
	$text.visible = true
	play_dialogue()


func _on_choice_4_pressed():
	dialogue += dialogue4
	$friendsprites.frame+=2
	$playersprites.frame+=2
	$choice3.visible = false 
	$choice4.visible = false
	$text.visible = true
	play_dialogue()
