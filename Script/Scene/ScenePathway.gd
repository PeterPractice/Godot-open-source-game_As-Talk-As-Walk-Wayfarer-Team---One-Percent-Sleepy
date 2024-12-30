extends Node2D

onready var nPCArticleTriggerDoor8_2 = $node2DNPCArticleTrigger/nPCArticleTriggerDoor8_2

func _ready():
	UpdateScene()

func UpdateScene():
	nPCArticleTriggerDoor8_2.TrySetDoorOpened()
