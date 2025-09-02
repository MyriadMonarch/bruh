extends Node

signal health_change

@export var laser_amount:int = 20
@export var grenade_amount:int = 5

var _health: int = 60

var health: int:
	get:
		return _health
	set(value):
		_health = value
		health_change.emit()
