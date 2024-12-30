extends Node2D
class_name DoorCollision

onready var collisionShape2D1 = $staticBody2D1/collisionShape2D1

var m_IsBodyEntered: bool = false

func _ready():
	self.visible = false

func _process(_delta: float):
	if not GetDisabled():
		if m_IsBodyEntered:
			if NavigationManager.AStarIsBegin():
				UIManager.DownPanel_AddJournalRecordWithStringKey("NAVIGATIONMANAGER_END_OBSTRUCTIONS_NEARBY")
			
			NavigationManager.AStarEnd()

func GetDisabled() -> bool:
	return collisionShape2D1.disabled

func SetDisabledTrue():
	collisionShape2D1.disabled = true

func SetDisabledFalse():
	collisionShape2D1.disabled = false

func _on_area2D1_area_entered(area: Area2DInteraction):
	if not area:
		return
	
	if not area.IsArea2DInteraction():
		return
	
	var avatarBase: KinematicBody2DAvatarBase = area.get_parent()
	if AvatarManager.IsPlayerNPC(avatarBase):
		m_IsBodyEntered = true

func _on_area2D1_area_exited(area: Area2DInteraction):
	if not area:
		return
	
	if not area.IsArea2DInteraction():
		return
	
	var avatarBase: KinematicBody2DAvatarBase = area.get_parent()
	if AvatarManager.IsPlayerNPC(avatarBase):
		m_IsBodyEntered = false
