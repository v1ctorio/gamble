extends Area2D

func _ready() -> void:
	body_entered.connect(_on_body_entered)


func _on_body_entered(body) -> void:
	if body is Marble:
		body.queue_free()
