extends Sprite2D
var pos: Vector2 = Vector2.ZERO  #(0,0)
var sca: float = 1
const speed: int = 10

func _ready():
	pos = Vector2(65,65)
	
	var test_rotation = 45
	rotation_degrees = test_rotation



func _process(delta):
	pos.x += 10
	position = pos
	sca += .01
	scale = Vector2(sca,sca)
	
