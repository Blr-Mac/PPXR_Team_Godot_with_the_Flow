extends Node3D

@export var rotation_speed: float = 2.0
@export var deadzone: float = 0.1

var lvl_num = 1
@onready var level_scene = $Level1

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	level_scene.level_finished.connect(_on_level_finished)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func handle_joystick_rotation(input: Vector2, x, y, delta: float):
	if x:
			rotate_z(rotation_speed * delta)
			print(x)
	if y:
		print(x)
		rotate_z(-rotation_speed * delta)
	if input.length() > deadzone:
		var rot_x = input.y * rotation_speed * delta
		var rot_y = input.x * rotation_speed * delta
		rotate_y(rot_y)
		rotate_x(rot_x)
		
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
	new_level_node.level_finished.connect(_on_level_finished)
