extends Area2D

@export var rotation_speed:int = 4
var available_option = ['health','health','grenade','grenade','grenade','grenade','laser','laser','laser','laser']
var type = available_option[randi()%len(available_option)]
var direction:Vector2
var distance:int = randf_range(150,250)


func _ready() -> void:
	if type =='health':
		$Sprite2D.modulate = Color(0,1,0,1)
	if type =='grenade':
		$Sprite2D.modulate = Color(1,0,0,1)
	if type =='laser':
		$Sprite2D.modulate = Color(0,0,1,1)
	var target_pos = position+direction*distance
	var tween = create_tween()
	tween.set_parallel(true)
	tween.tween_property(self,"position",target_pos,0.5)
	tween.tween_property(self,"scale",Vector2(1,1),0.3).from(Vector2(0,0))


func _process(delta):
	rotation += rotation_speed * delta
	


func _on_body_entered(body:CharacterBody2D):
	call_deferred("idk",body)

func idk(body):
	if type == 'laser':
		Globals.laser_amount += 5
	if type == 'grenade':
		Globals.grenade_amount += 2
	if type == "health":
		Globals.health += 10
	print("Collided with:", body.name, "collision_layer:", body.collision_layer, "collision_mask:", body.collision_mask)
	print("Collided with:", name, "collision_layer:", collision_layer, "collision_mask:", collision_mask)
	
	queue_free()
