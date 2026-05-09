extends XRController3D

signal left_input(l_input, x, y, d)
var scene_path = "res://scenes/menu.tscn"
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	var input_vector: Vector2 = get_vector2("primary")
	var x_pressed = is_button_pressed("ax_button")
	var y_pressed = is_button_pressed("by_button")
	left_input.emit(input_vector,x_pressed,y_pressed, delta)
	if is_button_pressed("menu_button"):
		get_tree().change_scene_to_file(scene_path)
