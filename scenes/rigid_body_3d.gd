extends RigidBody3D

# Set this to slightly larger than your orb's internal radius
@export var max_distance: float = 1.2 

func _physics_process(_delta):
	# Measure distance from the center of the LevelPhysicsGroup
	# (Since the ball is a child of the group being moved by RemoteTransform)
	if position.length() > max_distance:
		# Reset velocity to stop the "yeet"
		linear_velocity = Vector3.ZERO
		angular_velocity = Vector3.ZERO
		# Teleport back to the center of the level
		position = Vector3.ZERO 
		print("Ball escaped! Teleporting back.")
