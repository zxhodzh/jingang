extends Node2D

var speed = 0
signal gamepass
signal gamefail


func _on_金刚area_2d_area_entered(area: Area2D) -> void:
	if area.is_in_group("bi"):
		$AnimatedSprite2D.play("up")
	if area.name == "蜂窝Area2D":
		$AnimatedSprite2D.play("die")
		gamepass.emit()

func _on_animated_sprite_2d_animation_finished() -> void:
	if $AnimatedSprite2D.animation == "up":
		$AnimatedSprite2D.play("down")


func _on_animated_sprite_2d_frame_changed() -> void:
	if $AnimatedSprite2D.animation == "down":
		if $AnimatedSprite2D.frame == 1 or $AnimatedSprite2D.frame == 4:
			position.y += 4
			if position.y >= 115:
				gamefail.emit()
	if $AnimatedSprite2D.animation == "up":
		if $AnimatedSprite2D.frame == 1 or $AnimatedSprite2D.frame == 4:
			position.y -= 2
