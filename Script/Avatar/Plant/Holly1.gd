extends KinematicBody2DPlant

func _ready():
	SetAvatarTypeID(TableManager.AVATARTYPEID_HOLLY1)
	
	SetRandomAmountOfGrass(0, 500, 500, 1000)
