extends XRController3D

var scene_path = "res://scenes/menu.tscn"

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if is_button_pressed("menu_button"):
		get_tree().change_scene_to_file(scene_path)
