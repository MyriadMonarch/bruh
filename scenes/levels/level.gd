extends Node2D
class_name LevelParent

var laser_scene: PackedScene = preload("res://scenes/projectiles/laser.tscn")
var grenade_scene: PackedScene = preload("res://scenes/projectiles/grenade.tscn")

func _on_player_grenade(pos: Vector2, player_direction: Vector2) -> void:
	if Globals.grenade_amount > 0:
		Globals.grenade_amount -= 1
		Globals.emit_signal("stat_change")

		var grenade = grenade_scene.instantiate() as RigidBody2D
		grenade.position = pos
		grenade.linear_velocity = player_direction * grenade.speed
		$Projectiles.add_child(grenade)

func _on_player_laser(pos: Vector2, direction: Vector2) -> void:
	if Globals.laser_amount > 0:
		Globals.laser_amount -= 1
		Globals.emit_signal("stat_change")

		var laser = laser_scene.instantiate() as Area2D
		laser.position = pos
		laser.rotation_degrees = rad_to_deg(direction.angle())
		laser.direction = direction
		$Projectiles.add_child(laser)

func _on_house_player_entered() -> void:
	var tween = get_tree().create_tween()
	tween.tween_property($Player/Camera2D2, "zoom", Vector2(1, 1), 1)
	tween.finished.connect(func():
		print("Zoom finished:", $Player/Camera2D2.zoom)
	)

func _on_house_player_exited() -> void:
	var tween = get_tree().create_tween()
	tween.tween_property($Player/Camera2D2, "zoom", Vector2(0.5, 0.5), 2)
	tween.finished.connect(func():
		print("Zoom finished:", $Player/Camera2D2.zoom)
	)

func _on_player_update_stats() -> void:
	Globals.emit_signal("stat_change")
