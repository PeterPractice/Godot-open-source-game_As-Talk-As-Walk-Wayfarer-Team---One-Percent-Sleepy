extends KinematicBody2DPlant

func _ready():
	SetAvatarTypeID(TableManager.AVATARTYPEID_TREE2_3)
	
	SetRandomAmountOfGrass(0, 300, 300, 600)
