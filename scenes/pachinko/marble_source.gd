extends Marker2D

@export var trigger_event: StringName
@export var initial_rotation_deg: int 

@export var marble_scene: PackedScene = load("res://scenes/pachinko/marble.tscn")

var spawn_pos = self.global_position
var _duration_pressed = 0.0
var _charging = false

func _process(delta: float) -> void:
	if Input.is_action_just_pressed(trigger_event):
		_on_button_down()
	if Input.is_action_just_released(trigger_event):
		_on_button_up()
	
	if _charging:
		_duration_pressed += delta


func _on_button_down() -> void:
	_charging = true
	_duration_pressed = 0.0

func _on_button_up() -> void:
	_charging = false
	var angle = deg_to_rad(initial_rotation_deg)
	var dir = Vector2.RIGHT.rotated(angle)
	
	if _duration_pressed > 2.0:
		_duration_pressed = 2.0
	
	var vel = 300.0 * (_duration_pressed+1)
	
	spawn_marble_with_v(spawn_pos, dir, vel)
	
	await get_tree().create_timer(0.1).timeout
	print(_duration_pressed)
	_duration_pressed = 0.0

func spawn_marble_with_v(pos: Vector2, direction: Vector2, speed: float):
	
	var remaining_marbles = int($'../MarblesLabel'.text)
	if remaining_marbles <= 0:
		pass
	else:
		$"../MarblesLabel".text = str(remaining_marbles-1)
		
	var m := marble_scene.instantiate() as RigidBody2D
	add_child(m)
	m.freeze = true
	m.linear_velocity = direction.normalized() * speed
	m.angular_velocity = 5.0
	m.sleeping = false
	m.freeze = false
