extends Node2D

onready var nPCArticleTriggerDoor1 = $node2DNPCArticleTrigger/nPCArticleTriggerDoor1
onready var nPCArticleTriggerDoor2 = $node2DNPCArticleTrigger/nPCArticleTriggerDoor2
onready var nPCArticleTriggerDoor3 = $node2DNPCArticleTrigger/nPCArticleTriggerDoor3

func _ready():
	UpdateScene()

func UpdateScene():
	nPCArticleTriggerDoor1.TrySetDoorOpened()
	nPCArticleTriggerDoor2.TrySetDoorOpened()
	nPCArticleTriggerDoor3.TrySetDoorOpened()
