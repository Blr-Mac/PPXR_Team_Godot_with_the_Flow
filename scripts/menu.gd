extends Node3D

var xr_interface: XRInterface
var scene_path_1 = "res://scenes/main.tscn"
var scene_path_2 = "res://scenes/alt.tscn"

@onready var right_menu_cont = $XROrigin3D/RightHand

func _ready():
	xr_interface = XRServer.find_interface("OpenXR")
	if xr_interface and xr_interface.initialize():
		get_viewport().use_xr = true
	else:
		print("OpenXR not initialized")
	right_menu_cont. mright_input.connect(_handler)

func _handler(button, delta):
	if button == "a":
		get_tree().change_scene_to_file(scene_path_1)
	if button == "b":
		get_tree().change_scene_to_file(scene_path_2)
		


func _process(delta: float) -> void:
	pass
