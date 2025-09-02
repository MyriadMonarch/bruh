extends Node

signal stat_change

var _health : int = 20
var _grenade_amount:int=5
var _laser_amount :int=20

var health:
	get:
		return _health
	set(value):
		_health = value
		stat_change.emit()
		
var grenade_amount:
	get:
		return _grenade_amount
	set(value):
		_grenade_amount = value
		stat_change.emit()
var laser_amount:
	get:
		return _laser_amount
	set(value):
		_laser_amount = value
		stat_change.emit()
