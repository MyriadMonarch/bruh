extends Area2D
signal player_exited
signal player_entered

func _on_body_entered(_body):
	player_entered.emit()



func _on_body_exited(_body):
	player_exited.emit() # Replace with function body.
