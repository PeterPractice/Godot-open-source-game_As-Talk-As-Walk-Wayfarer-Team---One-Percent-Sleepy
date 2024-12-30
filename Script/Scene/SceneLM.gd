extends Node2D

onready var nPCArticleTriggerDoor8_2 = $node2DNPCArticleTrigger/nPCArticleTriggerDoor8_2
onready var nPCArticleTriggerDoor1 = $node2DNPCArticleTrigger/nPCArticleTriggerDoor1
onready var nPCArticleTriggerDoor2 = $node2DNPCArticleTrigger/nPCArticleTriggerDoor2
onready var nPCArticleTriggerDoor3 = $node2DNPCArticleTrigger/nPCArticleTriggerDoor3
onready var nPCArticleTriggerDoor6 = $node2DNPCArticleTrigger/nPCArticleTriggerDoor6
onready var nPCArticleTriggerDoor7 = $node2DNPCArticleTrigger/nPCArticleTriggerDoor7

func _ready():
	UpdateScene()

func UpdateScene():
	nPCArticleTriggerDoor8_2.TrySetDoorOpened()
	nPCArticleTriggerDoor1.TrySetDoorOpened()
	nPCArticleTriggerDoor2.TrySetDoorOpened()
	nPCArticleTriggerDoor3.TrySetDoorOpened()
	nPCArticleTriggerDoor6.TrySetDoorOpened()
	nPCArticleTriggerDoor7.TrySetDoorOpened()
