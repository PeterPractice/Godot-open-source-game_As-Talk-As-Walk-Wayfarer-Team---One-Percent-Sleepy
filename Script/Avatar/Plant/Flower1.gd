extends KinematicBody2DPlant

func _ready():
	SetAvatarTypeID(TableManager.AVATARTYPEID_FLOWER1)
	
	SetRandomAmountOfGrass(0, 500, 500, 1000)
