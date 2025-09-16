extends Button
@export var marble_scene: PackedScene


var _duration_pressed = 0.0
var _charging = false

func _ready() -> void:
	button_down.connect(_on_button_down)
	button_up.connect(_on_button_up)


func _process(delta: float) -> void:
	if _charging:
		_duration_pressed += delta


func _on_button_down() -> void:
	_charging = true
	_duration_pressed = 0.0

func _on_button_up() -> void:
	_charging = false
	var angle = deg_to_rad(-45)
	var dir = Vector2.RIGHT.rotated(angle)
	spawn_marble_with_v(Vector2(-475, -200.0), dir, 300.0 * (_duration_pressed+1))
	print(_duration_pressed)
	_duration_pressed = 0.0


	

	
	
	
	
	
func spawn_marble_with_v(pos: Vector2, direction: Vector2, speed: float):
	var m := marble_scene.instantiate() as RigidBody2D
	add_child(m)
	m.freeze = true
	m.global_position = pos
	m.linear_velocity = direction.normalized() * speed
	m.angular_velocity = 5.0
	m.sleeping = false
	m.freeze = false
