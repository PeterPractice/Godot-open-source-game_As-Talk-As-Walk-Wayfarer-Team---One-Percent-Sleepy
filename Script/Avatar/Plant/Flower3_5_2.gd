extends KinematicBody2DPlant

func _ready():
	SetAvatarTypeID(TableManager.AVATARTYPEID_FLOWER3_5_2)
	
	SetRandomAmountOfGrass(0, 50, 50, 100)
