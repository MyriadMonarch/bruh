extends Area2D

@export var rotation_speed:int = 4
var available_option = ['health','health','grenade','grenade','grenade','grenade','laser','laser','laser','laser']
var type = 'health'#available_option[randi()%len(available_option)]

func _ready() -> void:
	if type =='health':
		$Sprite2D.modulate = Color(0,1,0,1)
	if type =='grenade':
		$Sprite2D.modulate = Color(1,0,0,1)
	if type =='laser':
		$Sprite2D.modulate = Color(0,0,1,1)

func _process(delta: float) -> void:
	rotation += rotation_speed * delta
	


func _on_body_entered(body: Node2D) -> void:
	body.add_item(type)
	queue_free()
