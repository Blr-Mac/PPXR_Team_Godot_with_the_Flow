extends Camera3D

@export var target_node: Node3D        
@export var rotation_speed: float = 2.0
@export var deadzone: float = 0.1

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func handle_camera_orbit(input: Vector2, delta: float):
	if not target_node or input.length() < deadzone:
		return

	# 1. Get the current vector from the target to the camera
	var offset = global_position - target_node.global_position
	
	# 2. Horizontal Rotation (Left/Right)
	# We rotate around the global UP axis (Y)
	var horizontal_angle = -input.x * rotation_speed * delta
	offset = offset.rotated(Vector3.UP, horizontal_angle)
	
	# 3. Vertical Rotation (Up/Down)
	# We rotate around the camera's local RIGHT axis (X)
	var vertical_angle = -input.y * rotation_speed * delta
	var right_axis = global_transform.basis.x
	
	# Calculate the potential new offset
	var temp_offset = offset.rotated(right_axis, vertical_angle)
	
	# 4. Prevent "Flipping" (Clamping)
	# We check the angle between the offset and the Up vector
	# to stop the camera from going past 89 degrees up or down.
	var dot = temp_offset.normalized().dot(Vector3.UP)
	if abs(dot) < 0.98: # Stay away from the exact poles
		offset = temp_offset

	# 5. Apply the new position relative to the target
	global_position = target_node.global_position + offset
	
	# 6. Keep the camera focused on the target
	look_at(target_node.global_position)
