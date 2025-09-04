extends CharacterBody2D
signal laser(pos, direction)
signal grenade(pos, direction)

@export var can_laser: bool = true
@export var can_grenade: bool = true

@export var max_speed:int = 500
var speed:int = max_speed

func _process(_delta):
	#player movement
	var direction = Input.get_vector("Left","Right","Up","Down")
	velocity += speed *direction
	move_and_slide()
	velocity = Vector2.ZERO
	
	#rotate player
	look_at(get_global_mouse_position())
	var player_direction = (get_global_mouse_position() - position).normalized()
	#laser shoting
	if Input.is_action_pressed("Laser") and can_laser and Globals.laser_amount > 0:
		
		var laser_marker = $LaserStartPosition.get_children()
		$GPUParticles2D.emitting = true
		var selected_LASER = laser_marker[randi() % laser_marker.size()]
		can_laser = false #laser false
		$Laser.start() #cooldown timer
		laser.emit(selected_LASER.global_position, player_direction)
		
		
		 # signal for level so that laser can be released
	
	if Input.is_action_pressed("Grenade") and can_grenade and Globals.grenade_amount > 0:
		var pos = $GrenadeStartPosition.get_children()[0].global_position
		can_grenade = false #grenade false
		$Grenade.start() #cooldown timer
		print(player_direction)
		grenade.emit(pos, player_direction) # signal for level

func _on_grenade_timeout():
	can_grenade = true # Replace with function body.

func _on_laser_timeout():
	can_laser = true # Replace with function body.
