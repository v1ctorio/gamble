extends Button
@export var marble_scene: PackedScene
func _pressed() -> void:
	if marble_scene == null:
		pass
	
	var angle = deg_to_rad(-45)
	var dir = Vector2.RIGHT.rotated(angle)
	
	spawn_marble_with_v(Vector2(0,-80.0),dir,400.0)
	
	
	
	
func spawn_marble_with_v(pos: Vector2, direction: Vector2, speed: float):
	var m := marble_scene.instantiate() as RigidBody2D
	add_child(m)
	m.freeze = true
	m.global_position = pos
	m.linear_velocity = direction.normalized() * speed
	m.angular_velocity = 5.0
	m.sleeping = false
	m.freeze = false
