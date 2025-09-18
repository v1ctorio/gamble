extends Node2D

@export var giving_score: int = 0
@export var color: Color

func _ready() -> void:
	$Label.text = str(giving_score)
	$Area2D.body_entered.connect(_on_body_entered)
	if color: 
		$ColorRect.color = color
		$ColorRect2.color = color 


func _on_body_entered(body) -> void:
	if body is Marble:
		dispatch_score()
		
func dispatch_score():
	global_state.score += giving_score
	print(global_state.score)
