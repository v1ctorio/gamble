extends Node2D

@export var count: int = 9
@export var per_row: int = 3
@export var beggining: Vector2
@export var horizontal_spacing: Vector2 = Vector2(50.0,0.0)
@export var row_spacing: Vector2 = Vector2(0.0,100.0)
var obstacle: PackedScene = load("res://scenes/pachinko/obstacle.tscn")

func _ready() -> void:
	var pos = beggining
	var j = 0
	var row = 0
	for i in count:
		j = j+1 
		var obs := obstacle.instantiate() as StaticBody2D
		add_child(obs)
		if j > per_row:
			row = row + 1
			j = 1
		
		
		obs.position = pos + row_spacing * row - horizontal_spacing * row
		pos = pos + horizontal_spacing
		
