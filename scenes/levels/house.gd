extends Area2D
signal player_exited
signal player_entered


func _on_body_entered(body: CharacterBody2D) -> void:
	player_entered.emit()  # Replace with function body.


func _on_body_exited(body: CharacterBody2D) -> void:
	player_exited.emit()  # Replace with function body.
