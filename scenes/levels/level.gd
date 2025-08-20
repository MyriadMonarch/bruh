extends Node2D

var laser_scene: PackedScene = preload("res://scenes/projectiles/laser.tscn")
var grenade_scene: PackedScene = preload("res://scenes/projectiles/grenade.tscn")
func _on_player_grenade(pos, player_direction):
	var grenade = grenade_scene.instantiate() as RigidBody2D
	grenade.position = pos
	grenade.linear_velocity = player_direction *grenade.speed
	$Projectiles.add_child(grenade)


func _on_player_laser(pos, player_direction):
	var laser = laser_scene.instantiate() 
	var speed = 500
	laser.global_position = pos
	var direction = player_direction*speed
	position += speed*direction
	$Projectiles.add_child(laser)
	
