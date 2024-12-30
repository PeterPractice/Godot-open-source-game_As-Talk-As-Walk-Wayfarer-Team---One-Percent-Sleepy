extends KinematicBody2DPlant

func _ready():
	SetAvatarTypeID(TableManager.AVATARTYPEID_TREE3_3_2)
	
	SetRandomAmountOfGrass(0, 300, 300, 600)
