extends Node2D



func _ready() -> void:
	pass # Replace with function body.


func _process(_delta: float) -> void:
	position.y -= 5


func _on_visible_on_screen_notifier_2d_screen_exited() -> void:
	queue_free()


func _on_area_2d_area_entered(_area: Area2D) -> void:
	queue_free()
