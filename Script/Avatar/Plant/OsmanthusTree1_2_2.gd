extends KinematicBody2DPlant

func _ready():
	SetAvatarTypeID(TableManager.AVATARTYPEID_OSMANTHUSTREE1_2_2)
	
	SetRandomAmountOfGrass(0, 500, 500, 1000)
