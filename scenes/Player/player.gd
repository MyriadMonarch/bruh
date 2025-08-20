extends CharacterBody2D
signal laser_released
signal grenade_released
var can_laser: bool = true
var can_grenade: bool = true

func _process(_delta):
	#player movement
	var direction = Input.get_vector("Left","Right","Up","Down")
	
	velocity += 10 *direction
	move_and_slide()
	
	#laser shoting
	if Input.is_action_pressed("Laser") and can_laser:
		laser_released.emit()
		
		
		can_laser = false
		$Laser.start()
	
	if Input.is_action_pressed("Grenade") and can_grenade:
		grenade_released.emit()
		can_grenade = false
		$Grenade.start()
	




func _on_grenade_timeout():
	can_grenade = true # Replace with function body.


func _on_laser_timeout():
	can_laser = true # Replace with function body.
