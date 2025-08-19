extends Sprite2D
var pos: Vector2 = Vector2.ZERO  #(0,0)
const speed: int = 10

func _ready():
	pos = Vector2(65,65)
	position = pos



func _process(delta):
	pos.x += 10
	position = pos
