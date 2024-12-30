extends Node2D

export var nPCTriggerTypeID: int = 0

onready var textureRect1 = $textureRect1

var m_IsHadProducedNPC: bool = false
var m_AvatarInstance: KinematicBody2DPlayerNPC = null
var m_AssignAvatarTypeID: int = 0

func _ready():
	textureRect1.visible = false

func _process(_delta: float):
	if not GetIsValid():
		return
	
	if not SceneManager.IsCurrentSceneNode2DAvatarValid():
		return
	
	if not m_IsHadProducedNPC:
		m_IsHadProducedNPC = true
		
		var nPCTriggerInfo: Dictionary = TableManager.GetNPCTriggerInfo(nPCTriggerTypeID)
		var avatarTypeID = GetNPCTriggerAvatarTypeID()
		m_AvatarInstance = AvatarManager.GetAvatarTypePreloadResourceInstance(avatarTypeID)
		AvatarManager.AddNPCToCurrentScene(m_AvatarInstance, self.position, avatarTypeID, nPCTriggerInfo.nPCManner, nPCTriggerInfo.spriteToLeft_flip_h_TimerStep)
		m_AvatarInstance.AvatarStart_IDLE()
		m_AvatarInstance.SetNPCTrigger(self)

func SetNPCTriggerTypeID(aNPCTriggerTypeID: int):
	self.nPCTriggerTypeID = aNPCTriggerTypeID

func GetNPCTriggerTypeID() -> int:
	return nPCTriggerTypeID

func SetAssignAvatarTypeID(assignAvatarTypeID: int):
	m_AssignAvatarTypeID = assignAvatarTypeID

func GetAssignAvatarTypeID() -> int:
	return m_AssignAvatarTypeID

func SetIsHadProducedNPCFalse():
	m_IsHadProducedNPC = false

func GetNPCTriggerAvatarTypeID() -> int:
	var nPCTriggerInfo: Dictionary = TableManager.GetNPCTriggerInfo(nPCTriggerTypeID)
	var avatarTypeID = nPCTriggerInfo.avatarTypeID
	if 0 < m_AssignAvatarTypeID:
		avatarTypeID = m_AssignAvatarTypeID
	
	return avatarTypeID

func GetIsValid():
	return (0 < nPCTriggerTypeID) and self.visible

func SetInvalid():
	self.visible = false

func SetValid():
	self.visible = true

func SetAvatarInvalid():
	if is_instance_valid(m_AvatarInstance):
		m_AvatarInstance.SetInvalid()

func SetAvatarValid():
	if is_instance_valid(m_AvatarInstance):
		m_AvatarInstance.SetValid()

func SetAllInvalid():
	SetInvalid()
	SetAvatarInvalid()

func SetAllValid():
	SetValid()
	SetAvatarValid()

func CheckInvalidResult(aNPCTriggerAvatarTypeID: int, wrangleDialogTypeID: int, currentWrangleDialogTypeID: int) -> bool:
	var nPCTriggerAvatarTypeID: int = 0
	if 0 < aNPCTriggerAvatarTypeID:
		nPCTriggerAvatarTypeID = aNPCTriggerAvatarTypeID
	else:
		nPCTriggerAvatarTypeID = GetNPCTriggerAvatarTypeID()
	
	var isHas: bool = false
	var resultAvatarInfo: Dictionary = SaveGameManager.GetSaveGameData_Archive_AvatarList_AvatarInfoByAvatarTypeID(nPCTriggerAvatarTypeID)
	if resultAvatarInfo.isHas:
		isHas = true
	else:
		var isHasSuccess: bool = SaveGameManager.IsHasSaveGameData_Archive_TaskList_TaskInfoByWrangleDialogTypeIDAndlastChoiceWrangleDialogTypeID(wrangleDialogTypeID, currentWrangleDialogTypeID)
		if isHasSuccess:
			isHas = true
	
	return isHas

func CheckInvalid(aNPCTriggerAvatarTypeID: int, wrangleDialogTypeID: int, currentWrangleDialogTypeID: int, isIncludeAvatar: bool = false):
	var isHas: bool = CheckInvalidResult(aNPCTriggerAvatarTypeID, wrangleDialogTypeID, currentWrangleDialogTypeID)
	if isHas:
		SetInvalid()
		if isIncludeAvatar:
			SetAvatarInvalid()

func _on_area2D1_area_entered(area: Area2DInteraction):
#	HQH.Log("_on_area2D1_area_entered")
	if not area:
		return
	
	if not area.IsArea2DInteraction():
		return
	
	if not GetIsValid():
		return
	
	if not m_IsHadProducedNPC:
		return
	
	var avatarBase: KinematicBody2DAvatarBase = area.get_parent()
	if m_AvatarInstance == avatarBase:
		return
	
	if AvatarManager.IsPlayerNPC(avatarBase):
		UIManager.NPCTrigger_on_area2D1_area_entered(avatarBase, m_AvatarInstance, TableManager.NPC_TRIGGER_TYPE.NPC_AVATAR, nPCTriggerTypeID)

func _on_area2D1_area_exited(area: Area2DInteraction):
#	HQH.Log("_on_area2D1_area_exited")
	if not area:
		return
	
	if not area.IsArea2DInteraction():
		return
	
	if not GetIsValid():
		return
	
	if not m_IsHadProducedNPC:
		return
	
	var avatarBase: KinematicBody2DAvatarBase = area.get_parent()
	if m_AvatarInstance == avatarBase:
		return
	
	if AvatarManager.IsPlayerNPC(avatarBase):
		UIManager.NPCTrigger_on_area2D1_area_exited(avatarBase, m_AvatarInstance)
