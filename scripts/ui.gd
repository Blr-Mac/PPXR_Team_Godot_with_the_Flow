extends MeshInstance3D

#@export var target_viewport: SubViewport

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	#await get_tree().process_frame
	#if target_viewport:
		#var mat = get_active_material(0)
		#
		#var v_tex = ViewportTexture.new()
		#v_tex.viewport_path = target_viewport.get_path()
#
		#mat.albedo_texture = v_tex
	#else:
		#printerr("Error: No SubViewport assigned to the Mesh script!")
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
