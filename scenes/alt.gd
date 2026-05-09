extends Node3D

var xr_interface: XRInterface
@onready var alt_world_node = $SubViewportContainer/SubViewport/alt_world
@onready var alt_camera = $SubViewportContainer/SubViewport/Camera3D


func _ready():
	xr_interface = XRServer.find_interface("OpenXR")
	if xr_interface and xr_interface.initialize():
		get_viewport().use_xr = true
	else:
		print("OpenXR not initialized")
		
	$XROrigin3D/LeftHand.left_input.connect(_on_left_input)
	$XROrigin3D/RightHand.right_input.connect(_on_right_input)
	

func _on_left_input(l_input,x,y, d):
	alt_world_node.handle_joystick_rotation(l_input,x,y, d)
	
func _on_right_input(r_input, d):
	alt_camera.handle_camera_orbit(r_input, d)
