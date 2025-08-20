extends CharacterBody2D
signal laser(pos, player_direction)
signal grenade(pos, player_direction)
var can_laser: bool = true
var can_grenade: bool = true


func _process(_delta):
	#player movement
	var direction = Input.get_vector("Left","Right","Up","Down")
	velocity += 500 *direction
	move_and_slide()
	velocity = Vector2.ZERO
	
	#rotate player
	look_at(get_global_mouse_position())
	
	
	#laser shoting
	if Input.is_action_pressed("Laser") and can_laser:
		var laser_marker = $LaserStartPosition.get_children()
		var player_direction = (get_global_mouse_position() - position).normalized()
		var selected_LASER = laser_marker[randi() % laser_marker.size()]
		can_laser = false #laser false
		$Laser.start() #cooldown timer
		laser.emit(selected_LASER.global_position, player_direction)
		 # signal for level so that laser can be released
	
	if Input.is_action_pressed("Grenade") and can_grenade:
		var pos = $GrenadeStartPosition.get_children()[0].global_position

		
		
		can_grenade = false #grenade false
		$Grenade.start() #cooldown timer
		
		var player_direction = (get_global_mouse_position() - position).normalized()
		print(player_direction)
		grenade.emit(pos, player_direction) # signal for level
	




func _on_grenade_timeout():
	can_grenade = true # Replace with function body.


func _on_laser_timeout():
	can_laser = true # Replace with function body.
