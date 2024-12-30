extends Node2D

onready var nPCArticleTriggerBag = $node2DNPCArticleTrigger/nPCArticleTriggerBag
onready var nPCArticleTriggerNumberingRod = $node2DNPCArticleTrigger/nPCArticleTriggerNumberingRod
onready var nPCArticleTriggerDoor = $node2DNPCArticleTrigger/nPCArticleTriggerDoor

func _ready():
	UpdateScene()

func UpdateScene():
	if SaveGameManager.IsGoodsUsedHas_Bag():
		nPCArticleTriggerBag.SetInvalid()
	
	if SaveGameManager.IsBagHas_NumberingRod():
		nPCArticleTriggerNumberingRod.SetInvalid()
	
	nPCArticleTriggerDoor.TrySetDoorOpened()
