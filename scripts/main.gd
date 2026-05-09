extends Node3D

var xr_interface: XRInterface

var lvl_num = 1
@onready var level_scene = $Level1

func _ready():
	xr_interface = XRServer.find_interface("OpenXR")
	if xr_interface and xr_interface.initialize():
		get_viewport().use_xr = true
	else:
		print("OpenXR not initialized")
	
	level_scene.level_finished.connect(_on_level_finished)

func _on_level_finished(lvl):
	if lvl == 1:
		print("going to lvl 2")
		swap_level("res://scenes/level_2.tscn")
	if lvl == 2:
		print("going to lvl 3")
		swap_level("res://scenes/level_3.tscn")
	if lvl == 3:
		$AudioStreamPlayer3D.play()
		await get_tree().create_timer(1.0).timeout
		get_tree().change_scene_to_file("res://scenes/menu.tscn")

func swap_level(new_level_path: String):
	$AudioStreamPlayer3D.play()
	var level_scene_tmp = load(new_level_path)
	var new_level_node = level_scene_tmp.instantiate()
	
	for child in get_children():
		print(child.name)
		if "Level" in child.name:
			child.queue_free()
	add_child(new_level_node)
	var rt = $globe.get_node("RemoteTransform3D")
	rt.remote_path = new_level_node.get_path()
	new_level_node.level_finished.connect(_on_level_finished)
	
