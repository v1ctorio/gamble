extends Node2D

@export var marble_scene: PackedScene
@export var count = 5
@export var spacing = 50.0
@export var start_pos = Vector2.ZERO

func _ready() -> void:
	if marble_scene == null:
		return
	for i in count:
		var m := marble_scene.instantiate() as RigidBody2D
		m.position = start_pos + Vector2(i * spacing, 0)
		add_child(m)
