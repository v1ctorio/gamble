extends Button
@export var marble_scene: PackedScene
@export var spawn_pos: Vector2 = Vector2(-475.0,-200)


var _duration_pressed = 0.0
var _charging = false

func _ready() -> void:
	button_down.connect(_on_button_down)
	button_up.connect(_on_button_up)


func _process(delta: float) -> void:
	if _charging:
		_duration_pressed += delta
		$ProgressBar.progress = _duration_pressed


func _on_button_down() -> void:
	_charging = true
	_duration_pressed = 0.0

func _on_button_up() -> void:
	_charging = false
	var angle = deg_to_rad(-45)
	var dir = Vector2.RIGHT.rotated(angle)
	
	if _duration_pressed > 2.0:
		_duration_pressed = 2.0
	
	var vel = 300.0 * (_duration_pressed+1)
	
	spawn_marble_with_v(spawn_pos, dir, vel)
	
	await get_tree().create_timer(0.1).timeout
	$ProgressBar.progress = 0
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
