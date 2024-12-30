extends "res://Script/Scene/Trigger/NPCArticleTrigger.gd"

#func TrySetDoorOpened():
#	var doorCollision: DoorCollision = self.get_node(DOORCOLLISION_NAME)
#	if is_instance_valid(doorCollision):
#		var isHas: bool = SceneManager.IsHas_DoorOpened_NPCArticleTriggerTypeIDList(GetNPCArticleTriggerTypeID())
#		if isHas:
#			doorCollision.SetDisabledTrue()
#			SetRectScaleX_0_25()
#
#func CloseDoor():
#	var doorCollision: DoorCollision = self.get_node(DOORCOLLISION_NAME)
#	if is_instance_valid(doorCollision):
#		doorCollision.SetDisabledFalse()
#		SetRectScaleX_1()
