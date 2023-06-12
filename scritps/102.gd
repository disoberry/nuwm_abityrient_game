extends Node2D

var resource = load("res://dialogues/nps.dialogue")
# Called when the node enters the scene tree for the first time.
var downpressed = false

func _physics_process(delta):
	if(downpressed != true):	
		if(Input.is_action_just_pressed("down")):
			downpressed = true
			await get_tree().create_timer(0.01).timeout
			DialogueManager.show_example_dialogue_balloon(resource, "v3p")
	else:
		pass

