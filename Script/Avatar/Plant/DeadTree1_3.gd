extends KinematicBody2DPlant

func _ready():
	SetAvatarTypeID(TableManager.AVATARTYPEID_DEADTREE1_3)
	
	SetRandomAmountOfGrass(0, 900, 900, 1000)
