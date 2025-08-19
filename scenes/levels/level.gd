extends Node2D

var drone: int =50


func _ready():

	print('level node is ready')
	

func _process(delta):
	
	$Drone.position.x += drone*delta
	if $Drone.position.x > 1000:
		$Drone.position.x = 0
	

func test_function():
	print('hey test')
