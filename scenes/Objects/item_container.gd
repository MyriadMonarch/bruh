extends StaticBody2D
class_name ItemContainer

signal open(pos,direction)

@onready var current_direction:Vector2 = Vector2.DOWN.rotated(rotation)

func _ready() -> void:
	collision_layer =3
	collision_mask = 4
