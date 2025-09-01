extends Node2D
class_name LevelParent

var laser_scene: PackedScene = preload("res://scenes/projectiles/laser.tscn")
var grenade_scene: PackedScene = preload("res://scenes/projectiles/grenade.tscn")
func _on_player_grenade(pos, player_direction):
	var grenade = grenade_scene.instantiate() as RigidBody2D
	grenade.position = pos
	grenade.linear_velocity = player_direction *grenade.speed
	$Projectiles.add_child(grenade)
	$UI.update_laser_text()


func _on_player_laser(pos, direction):
	var laser = laser_scene.instantiate() as Area2D
	laser.position = pos
	laser.rotation_degrees = rad_to_deg(direction.angle())
	laser.direction = direction
	$Projectiles.add_child(laser)
	
	
	


func _on_house_player_entered():
	var tween = get_tree().create_tween()
	tween.tween_property($Player/Camera2D2,"zoom",Vector2(1,1),1)
	
	
	 
	print($Player/Camera2D2.zoom) # Replace with function body.


func _on_house_player_exited() -> void:
	var tween = get_tree().create_tween()
	tween.tween_property($Player/Camera2D2,"zoom",Vector2(.5,.5),2)
	print($Player/Camera2D2.zoom) # Replace with function body.
