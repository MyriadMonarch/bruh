extends CharacterBody2D


func _process(_delta):
	#player movement
	var direction = Input.get_vector("Left","Right","Up","Down")
	
	velocity += 10 *direction
	move_and_slide()
	
	#laser shoting
	if Input.is_action_pressed("Laser"):
		
		print('shoot laser')
		
	
	if Input.is_action_pressed("Grenade"):
		print('launch grenade')
	
