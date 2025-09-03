extends ItemContainer


func hit():
	$LidSprite.hide()
	var pos = $SpawnPosition.get_child(randi()%$SpawnPosition.get_child_count()).global_position
	
	open.emit(pos, current_direction)
	
