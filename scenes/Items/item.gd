extends Area2D

@export var rotation_speed:int = 4
var available_option = ['health','health','grenade','grenade','grenade','grenade','laser','laser','laser','laser']
var type = available_option[randi()%len(available_option)]

func _ready() -> void:
	if type =='health':
		$Sprite2D.modulate = Color(0,1,0,1)
	if type =='grenade':
		$Sprite2D.modulate = Color(1,0,0,1)
	if type =='laser':
		$Sprite2D.modulate = Color(0,0,1,1)

func _process(delta):
	rotation += rotation_speed * delta
	

func _on_body_entered(_body):
	if type == 'laser':
		Globals.laser_amount += 5
	if type == 'grenade':
		Globals.grenade_amount += 2
	if type == "health":
		Globals.health += 10
	queue_free()
