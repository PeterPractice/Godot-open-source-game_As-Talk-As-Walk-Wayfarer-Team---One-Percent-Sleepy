extends KinematicBody2DPlant

func _ready():
	SetAvatarTypeID(TableManager.AVATARTYPEID_FLOWER4_1_2)
	
	SetRandomAmountOfGrass(0, 50, 50, 100)
