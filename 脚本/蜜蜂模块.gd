extends Node2D

var velocity = Vector2(0,0)

func spawn_bee(pos,target):
	position = pos
	var dir = (target.position - position).normalized()
	velocity = dir * 50

func _process(delta: float) -> void:
	position += velocity * delta


func _on_area_2d_area_entered(area: Area2D) -> void:
	if area.is_in_group("bi"):
		$AudioStreamPlayer.play()
		$Timer.start()


func _on_visible_on_screen_notifier_2d_screen_exited() -> void:
	queue_free()





func _on_timer_timeout() -> void:
	queue_free()
