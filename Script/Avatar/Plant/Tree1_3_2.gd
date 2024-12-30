extends KinematicBody2DPlant

func _ready():
	SetAvatarTypeID(TableManager.AVATARTYPEID_TREE1_3_2)
	
	SetRandomAmountOfGrass(0, 500, 500, 1000)
