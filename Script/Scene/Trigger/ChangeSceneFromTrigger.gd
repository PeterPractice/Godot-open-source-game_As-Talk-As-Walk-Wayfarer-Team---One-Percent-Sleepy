extends Node2D

export var changeToSceneTypeID: int = 0
export var changeToChangeSceneToTriggerTypeID: int = 0

onready var colorRect1 = $colorRect1

func  _ready():
	colorRect1.visible = false

func _on_area2D1_area_entered(area: Area2DInteraction):
	if not area:
		return
	
	if not area.IsArea2DInteraction():
		return
	
	var avatarBase: KinematicBody2DAvatarBase = area.get_parent()
	if AvatarManager.IsPlayerNPC(avatarBase):
		HQH.Log("ChangeSceneFromTrigger, _on_area2D1_area_entered, changeSceneTypeID: %s, changeToChangeSceneToTriggerTypeID: %s" % [changeToSceneTypeID, changeToChangeSceneToTriggerTypeID])
		SceneManager.ChangeSceneFromTrigger(changeToSceneTypeID, changeToChangeSceneToTriggerTypeID)
