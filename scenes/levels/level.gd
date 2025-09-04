extends Node2D
class_name LevelParent

var laser_scene: PackedScene = preload("res://scenes/projectiles/laser.tscn")
var grenade_scene: PackedScene = preload("res://scenes/projectiles/grenade.tscn")
var item_scene: PackedScene = preload("res://scenes/Items/item.tscn")
func _ready() -> void:
	for node in get_tree().get_nodes_in_group("container"):
		var container := node as ItemContainer
		if container:
			if not container.open.is_connected(on_container_opened):
				container.open.connect(on_container_opened)


func on_container_opened(pos, direction):
	var item = item_scene.instantiate()
	item.position = pos
	item.direction = direction
	$Items.call_deferred('add_child',item)
	

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
		print(Globals.laser_amount)
		$Projectiles.add_child(laser)
