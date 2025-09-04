extends Area2D
@export var speed:int =1000
var direction: Vector2 = Vector2.UP


func _ready() -> void:
	$Timer.start()
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	position += speed*direction*delta

func _on_body_entered(body):
	if "hit" in body:
		body.hit()
		
	print(body.name)
	queue_free()

func _on_timer_timeout() -> void:
	queue_free() # Replace with function body.
