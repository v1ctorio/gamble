extends Container


@export var count: int = 5


var obstacle: PackedScene = load("res://scenes/pachinko/obstacle.tscn") 
func _ready() -> void:
	_spawn_row()
	


func _spawn_row():
	var spacing: float = (size.x / (count - 1.0) - 12.0) if count > 1 else 0.0
	
	for i in (count-1):
		var o := obstacle.instantiate() as StaticBody2D
		add_child(o)
		o.position = $obstacle.position + Vector2(spacing * (i+1),0)
		 
		pass
