extends Node2D

onready var nPCArticleTriggerDoor6 = $node2DNPCArticleTrigger/nPCArticleTriggerDoor6
onready var nPCArticleTriggerDoor7 = $node2DNPCArticleTrigger/nPCArticleTriggerDoor7

func _ready():
	UpdateScene()

func UpdateScene():
	nPCArticleTriggerDoor6.TrySetDoorOpened()
	nPCArticleTriggerDoor7.TrySetDoorOpened()
