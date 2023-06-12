extends TextureRect

@onready var mapbuttonv: TextureRect = $MapButton

var _texture1 = preload("res://assets/mapscreens/floar1map.png")
var _texture2 = preload("res://assets/mapscreens/floar2map.png")
var _texture3 = preload("res://assets/mapscreens/floar3map.png")

func _on_floar_1_pressed() -> void:
	$".".set_texture(_texture1)
	pass


func _on_floar_2_pressed():
	$".".set_texture(_texture2)
	pass # Replace with function body.


func _on_floar_3_pressed():
	$".".set_texture(_texture3)
	pass # Replace with function body.
