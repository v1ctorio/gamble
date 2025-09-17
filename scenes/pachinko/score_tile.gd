extends Node2D


func _ready() -> void:
	$Area2D.connect("body_entered", _on_pickable_area_body_entered)

func _on_pickable_area_body_entered(body):
	print("body detected", body)
	if body is Marble:
		consume()


func consume():
	self.queue_free()
