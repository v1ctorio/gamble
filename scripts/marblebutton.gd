extends Button
@export var marble_scene: PackedScene
func _pressed() -> void:
	if marble_scene == null:
		pass
	var m := marble_scene.instantiate() as RigidBody2D
	add_child(m)
