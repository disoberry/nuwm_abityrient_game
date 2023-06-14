extends CharacterBody2D

@onready var actionable_finder: Area2D = $Direction/ActionableFinder
@onready var hint_e_popup: Label = $Hint_E
var maptogglebool = "0"
var pausemeter = "0"


const SPEED = 5.0

# Взаємодія із об'єктами та картою

func _unhandled_input(_event: InputEvent) -> void:
	
	if Input.is_action_pressed("interact"):
		var actionables = actionable_finder.get_overlapping_areas()
		if actionables.size() > 0:
			actionables[0].action()
			return
			
	if Input.is_action_just_pressed("maptoggle") and maptogglebool == "0":
		$CanvasLayer/MapButton.show()
		IsDr.is_dialogue_running = "true"
		maptogglebool = "1"
		return
	elif Input.is_action_just_pressed("maptoggle") and maptogglebool == "1":
		$CanvasLayer/MapButton.hide()
		IsDr.is_dialogue_running = "false"
		maptogglebool = "0"
		return
		
	if Input.is_action_pressed("pause"):
		if pausemeter == "0":
			maptogglebool = "2"
			$CanvasLayer/MapButton.hide()
			$CanvasLayer/PausePop.show()
			IsDr.is_dialogue_running = "true"
			pausemeter = "1"
		elif pausemeter == "1":
			maptogglebool = "0"
			$CanvasLayer/PausePop.hide()
			IsDr.is_dialogue_running = "false"			
			pausemeter = "0"

func _physics_process(_delta):
	# Система Діалогу та Переміщення
	
	
	if IsDr.is_dialogue_running == "true":
		velocity = Vector2.ZERO 
		hint_e_popup.hide()
		pass
		
	else:
		velocity = Vector2.ZERO 
		if Input.is_action_pressed("left"):
			velocity.x -= 1.0
		if Input.is_action_pressed("right"):
			velocity.x += 1.0
		if Input.is_action_pressed("down"):
			velocity.y += 1.0
		if Input.is_action_pressed("up"):
			velocity.y -= 1.0
		velocity = velocity.normalized()
		
		# Підказка коли підходиш до об'єкта з яким можна взаємодіяти
		hint_e_popup.hide()
		var actionables = actionable_finder.get_overlapping_areas()
		if actionables.size() > 0:
			hint_e_popup.show()
	
	# Анімація
	
	if velocity == Vector2.ZERO:
		$AnimationTree.get("parameters/playback").travel("idle")
	else:
		$AnimationTree.get("parameters/playback").travel("walk")
		$AnimationTree.set("parameters/idle/blend_position", velocity)
		$AnimationTree.set("parameters/walk/blend_position", velocity)
	
# Основна функція переміщення
	move_and_collide(velocity * SPEED)

	

