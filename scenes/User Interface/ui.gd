extends CanvasLayer

@onready var laser_label:Label =  $LaserCounter/VBoxContainer/Label
@onready var grenade_label:Label = $GrenadeCounter/VBoxContainer/Label

func _ready():
	laser_label.text = str(Globals.laser_amount)
	grenade_label.text = str(Globals.grenade_amount)

func update_laser_text():
	print(Globals.laser_amount)
	laser_label.text = str(Globals.laser_amount)

func update_grenade_text():
	print(Globals.grenade_amount)
	grenade_label.text = str(Globals.grenade_amount)
