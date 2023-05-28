extends CanvasLayer


# Called when the node enters the scene tree for the first time.
func change_scene(target: String, floar_number: String, room_number: String) -> void:
	$AnimationPlayerText.stop()
	$AnimationPlayer.play('dissolve')
	get_tree().change_scene_to_file(target)	
	$AnimationPlayerText.play('dissolveroom')
	$AnimationPlayer.play_backwards('dissolve')
	$TextInfo.text = (floar_number + " Поверх " + room_number + " Кімната")
