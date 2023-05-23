extends Control


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.




func _on_start_button_pressed():
	TransitionScene.change_scene("res://scenes/World_1.tscn")

func _on_extras_button_pressed():
	pass # Replace with function body.


func _on_exit_button_pressed():
		get_tree().quit()
