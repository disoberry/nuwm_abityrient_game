extends CanvasLayer

var dis_number = "0"

# Called when the node enters the scene tree for the first time.
func change_scene(target: String, dis_number: String, room_number: String) -> void:
	$AnimationPlayerText.stop()
	$AnimationPlayer.play('dissolve')
	get_tree().change_scene_to_file(target)	
	$AnimationPlayerText.play('dissolveroom')
	$AnimationPlayer.play_backwards('dissolve')
	if dis_number == "1":
		$TextInfo.text = (room_number + " Кімната")
	else:
		$TextInfo.text = (room_number + " Поверх")
