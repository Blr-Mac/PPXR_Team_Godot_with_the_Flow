extends XRController3D

signal right_input(r_input, d)
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	var input_vector: Vector2 = get_vector2("primary")
	right_input.emit(input_vector, delta)
