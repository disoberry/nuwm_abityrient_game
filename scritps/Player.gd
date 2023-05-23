extends CharacterBody2D

@onready var actionable_finder: Area2D = $Direction/ActionableFinder


const SPEED = 5.0
func _unhandled_input(_event: InputEvent) -> void:
	if Input.is_action_pressed("interact"):
		var actionables = actionable_finder.get_overlapping_areas()
		if actionables.size() > 0:
			actionables[0].action()
			return


func _physics_process(_delta):
	if IsDr.is_dialogue_running == "true":
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
		
	
	
	
	if velocity == Vector2.ZERO:
		$AnimationTree.get("parameters/playback").travel("idle")
	else:
		$AnimationTree.get("parameters/playback").travel("walk")
		$AnimationTree.set("parameters/idle/blend_position", velocity)
		$AnimationTree.set("parameters/walk/blend_position", velocity)
	
	move_and_collide(velocity * SPEED)

