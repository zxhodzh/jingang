extends Node2D

@export var 胜利图片 : Texture2D
@export var 失败图片 : Texture2D
@export var bee : PackedScene



func _on_timer_timeout() -> void:
	var a = bee.instantiate()
	$"蜜蜂".add_child(a)
	var r = [-1 , 1].pick_random()
	if r == -1:
		a.spawn_bee($"蜂窝/蜂窝模块1".position , $"玩家模块")
	if r == 1:
		a.spawn_bee($"蜂窝/蜂窝模块2".position , $"玩家模块")


func _on_金刚模块_gamefail() -> void:
	$"提示牌".texture = 失败图片
	$"提示牌".show()
	get_tree().paused = true


func _on_金刚模块_gamepass() -> void:
	$"提示牌".texture = 胜利图片
	$"提示牌".show()
	get_tree().paused = true
	$AudioStreamPlayer.play()

func _on_玩家模块_gameover() -> void:
	$"提示牌".texture = 失败图片
	$"提示牌".show()
	get_tree().paused = true
