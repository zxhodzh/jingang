extends Node2D

var can_shoot = true
signal gameover
var speed = 2
@export var fire_bullets : PackedScene
func _ready() -> void:
	pass


func _process(_delta: float) -> void:
	position.x = clamp(position.x,77,179)
	var dir := Input.get_axis("ui_left", "ui_right")
	if dir:
		position.x += dir * speed
		scale.x = dir * -1
		$AnimationPlayer.play("run")
	else:
		$AnimationPlayer.play("idle")
	
	if Input.is_action_pressed("fire") and can_shoot:
		var a = fire_bullets.instantiate()
		#$"../子弹".add_child(a)
		get_parent().get_node("子弹").add_child(a)
		a.global_position = $Marker2D.global_position
		$AudioStreamPlayer.play()
		can_shoot = false
		$"射击Timer".start()
	
	
	
func _on_area_2d_area_entered(area: Area2D) -> void:
	if area.is_in_group("bees") or area.name == "金刚Area2D":
		set_process(false)
	$AnimationPlayer.play("die")
	


func _on_animation_player_animation_finished(anim_name: StringName) -> void:
	if anim_name == "die":
		gameover.emit()


func _on_射击timer_timeout() -> void:
	can_shoot = true
