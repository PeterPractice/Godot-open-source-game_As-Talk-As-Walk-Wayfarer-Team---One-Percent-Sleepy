extends KinematicBody2DSheep
class_name Sheep

func _ready():
	SetAvatarTypeID(TableManager.AVATARTYPEID_SHEEP)
	
	SetRandomHungerValue(100, 120)
