extends Control


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.




func _on_start_button_pressed():
	get_tree().change_scene_to_file("res://scenes/piece_of_paper.tscn")	

func _on_extras_button_pressed():
	pass # Replace with function body.


func _on_exit_button_pressed():
		get_tree().quit()
