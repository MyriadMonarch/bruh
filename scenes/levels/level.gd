extends Node2D


func _on_gate_player_entered_gate(body):
	print('player has entered gate') 
	


func _on_player_grenade_released():
	print('grenade from level') # Replace with function body.


func _on_player_laser_released():
	print('laser from level') # Replace with function body.


func _on_gate_player_exited_gate(body: Variant) -> void:
	print('player has exited gate') 
