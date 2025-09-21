extends Node2D
#
#func _ready() -> void:
	#_obstacles_spawn()
	#_score_tiles_spawn()
	#
#
#
#@export var count: int = 9
#@export var per_row: int = 3
#@export var beggining: Vector2
#@export var horizontal_spacing: Vector2 = Vector2(50.0,0.0)
#@export var row_spacing: Vector2 = Vector2(100.0,100.0)
#var obstacle: PackedScene = load("res://scenes/pachinko/obstacle.tscn")
#
#
#func _obstacles_spawn():
	#for i in count:
		#var row = i / per_row
		#var col = i % per_row
		#var obs := obstacle.instantiate() as StaticBody2D
		#add_child(obs)
		#obs.position = beggining + horizontal_spacing * col + row_spacing * row
		#
#
#var score_tile: PackedScene = load("res://scenes/pachinko/score_tile.tscn")
#
#var possibleLocations: Array[Vector2] = [Vector2(0.0,0.0)]
#
##func _score_tiles_spawn():
	#for i in len(possibleLocations):
		#var tile := score_tile.instantiate() as Node2D
		#add_child(tile)
		#tile.position = possibleLocations[i]
		#
	#pass
