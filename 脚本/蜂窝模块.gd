extends Node2D



func _on_area_2d_area_entered(area: Area2D) -> void:
	if area.name == "金刚Area2D":
		queue_free()
