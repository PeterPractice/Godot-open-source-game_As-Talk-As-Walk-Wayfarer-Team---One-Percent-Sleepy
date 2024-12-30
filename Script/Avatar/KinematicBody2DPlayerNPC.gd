extends KinematicBody2DAvatarBase
class_name KinematicBody2DPlayerNPC

const ANIMATION_ATTACK_NAME: String = "attackToLeft"
const ANIMATION_TALK_NAME: String = "talkToLeft"

onready var spriteIdleToLeft = $spriteIdleToLeft
onready var spriteWalkToLeft = $spriteWalkToLeft
onready var spriteTalkToLeft = $spriteTalkToLeft
onready var spriteAttackToLeft = $spriteAttackToLeft
onready var spriteAttackToLeft_spriteAttackEquip = $spriteAttackToLeft/spriteAttackEquip
onready var animationPlayer1 = $animationPlayer1
onready var node2DEquip_Head = $node2DEquip_Head
onready var area2DAttack_collisionShape2D3 = $area2DAttack/collisionShape2D3

enum PLAYER_NPC_STATE {
	IDLE,
	WALK,
	TALK,
	ATTACK,
	FOLLOW_IDLE,
	FOLLOW_WALK,
}
#var m_CurrentAvatarState: int = PLAYER_NPC_STATE.IDLE
#For each Avatar State, also need 3 function(example: IDLE):
#func CheckStateIn_IDLE()
#func ChangeToState_IDLE()
#func DoStateActionIn_IDLE()

var m_CurrentMotionDirection: Vector2 = Vector2.ZERO
var m_SpriteToLeft_flip_h: bool = false
var m_SpriteToLeft_flip_h_TimerStep: float = 0.0
var m_SpriteToLeft_flip_h_Timer: float = 0.0
#var m_AvatarObjectID: int = 0 # 0: invalid ID. 1-n: valid ID.
#var m_AvatarTypeID: int = 0
var m_IsNPC: bool = false
var m_NPCManner: int = HQH.NPC_MANNER_TYPE.NPC_MANNER_FRIENDLY
var m_NPCTrigger: Node2D = null
const AREA2DATTACK_ENTERED_AVATARBASELIST_MAX: int = 128
var m_Area2DAttack_Entered_AvatarBaseList: Array = []
var m_IsATTACKedAvatar: bool = false
var m_IsHasAttackEquip: bool = false
var m_IsHasAttackEquipAndCanUse: bool = false
var m_EquipTypeID_Head: int = 0

func _ready():
	SetAvatarBehaviorType(AvatarManager.AVATAR_BEHAVIOR_TYPE.PLAYER_NPC)
	
	spriteIdleToLeft.material = spriteIdleToLeft.material.duplicate(true)
	spriteWalkToLeft.material = spriteWalkToLeft.material.duplicate(true)
	spriteTalkToLeft.material = spriteTalkToLeft.material.duplicate(true)
	spriteAttackToLeft.material = spriteAttackToLeft.material.duplicate(true)
	
#	self.input_pickable = true
	
	AvatarStart_IDLE()

func DisposePhysicsProcess(delta: float):
	if IsAvatarInState_FOLLOW():
		var avatarInfo: Dictionary = AvatarManager.GetAvatarInfo_From_CurrentActiveAvatarInfoList_By_AvatarObjectID(GetAvatarObjectID())
		var motion: Vector2 = Vector2.ZERO
		if not avatarInfo.empty():
			motion = Vector2(avatarInfo.walkPosition.x - self.position.x, avatarInfo.walkPosition.y - self.position.y)
			m_CurrentMotionDirection = motion.normalized()
			m_SpriteToLeft_flip_h = avatarInfo.spriteToLeft_flip_h
		
		if AvatarManager.GetIsNeedCompleteAll_FOLLOW_WALK(GetAvatarObjectID()):
			if not avatarInfo.empty():
#				if (SceneManager.MOTION_LENGTH_SQUARED_MIN_30 > abs(motion.x)) and (SceneManager.MOTION_LENGTH_SQUARED_MIN_30 > abs(motion.y)):
					AvatarManager.AddNeedCompleteAll_FOLLOW_WALK_DelayIndexNumber(GetAvatarObjectID())
			else:
				AvatarManager.SetIsNeedCompleteAll_FOLLOW_WALK(GetAvatarObjectID(), false)
				AvatarManager.ResetNeedCompleteAll_FOLLOW_WALK_DelayIndexNumber(GetAvatarObjectID())
				if AvatarManager.GetIsAll_NeedCompleteAll_FOLLOW_WALK_false():
					AvatarManager.ResetCurrentActiveAvatarInfoList()
					
					UIManager.SetUI_INPUT_ACTION_EVENT_TYPE_COMMONBUTTONITEM_TEXTUREBUTTON1_PRESSED_EVENT_Stop()
	else:
		if m_IsNPC:
			m_CurrentMotionDirection = Vector2.ZERO
			if UIManager.GetIsInInteraction():
				if 0.0 < m_SpriteToLeft_flip_h_TimerStep:
#					var currentActiveAvatar: KinematicBody2DPlayerNPC = AvatarManager.GetCurrentActiveAvatarInstance() # Here can not use KinematicBody2DPlayerNPC type. Otherwise it will cause "ERROR: Resources still in use at exit", when close the project.
					var currentActiveAvatar: KinematicBody2DAvatarBase = AvatarManager.GetCurrentActiveAvatarInstance()
					if currentActiveAvatar.position.x < self.position.x:
						m_SpriteToLeft_flip_h = false
					else:
						m_SpriteToLeft_flip_h = true
			else:
				if 0.0 < m_SpriteToLeft_flip_h_TimerStep:
					m_SpriteToLeft_flip_h_Timer += delta
					if m_SpriteToLeft_flip_h_TimerStep < m_SpriteToLeft_flip_h_Timer:
						m_SpriteToLeft_flip_h_Timer = 0.0
						
						m_SpriteToLeft_flip_h = HQH.RandomBool()
		else:
			m_CurrentMotionDirection = SceneManager.GetCurrentInputMotionDirection()
			if 0.0 < m_CurrentMotionDirection.x:
				m_SpriteToLeft_flip_h = true
			elif 0.0 > m_CurrentMotionDirection.x:
				m_SpriteToLeft_flip_h = false
	
	CheckState()
	DoStateAction()

func CheckStateIn_IDLE():
	if HQH.IsVector2AbsGreaterThan0(m_CurrentMotionDirection):
		AvatarStart_WALK()

func ChangeToState_IDLE():
	pass

func DoStateActionIn_IDLE():
	DoStateAction_IDLE()

func SetSpriteIdleToLeft_flip_h(flip_h: bool):
	spriteIdleToLeft.flip_h = flip_h

func DoStateAction_IDLE():
	spriteIdleToLeft.flip_h = m_SpriteToLeft_flip_h
	SetEquipFlipH()

func CheckStateIn_WALK():
	if (0.0 == m_CurrentMotionDirection.x) and (0.0 == m_CurrentMotionDirection.y):
		AvatarStart_IDLE()

func ChangeToState_WALK():
	pass

func DoStateActionIn_WALK():
	DoStateAction_WALK()
	
	if AvatarManager.IsCurrentActiveAvatar(GetAvatarObjectID()):
		AvatarManager.AddCurrentActiveAvatarInfoList(self.position.x, self.position.y, m_SpriteToLeft_flip_h)

func DoStateAction_WALK():
	spriteWalkToLeft.flip_h = m_SpriteToLeft_flip_h
	SetEquipFlipH()
	
	animationPlayer1.play("walkToLeft")
	
	move_and_slide(m_CurrentMotionDirection * SceneManager.GetAvatarMotionSpeed())

func CheckStateIn_TALK():
	pass

func ChangeToState_TALK():
	pass

func DoStateActionIn_TALK():
	DoStateAction_TALK()

func DoStateAction_TALK():
	spriteTalkToLeft.flip_h = m_SpriteToLeft_flip_h
	SetEquipFlipH()
	
	animationPlayer1.play(ANIMATION_TALK_NAME)

func CheckStateIn_ATTACK():
	pass

func SetCheck_ATTACK():
	if SaveGameManager.IsBagHas_NumberingRod():
		m_IsHasAttackEquip = true
		if 0 < SaveGameManager.GetNumberingRodCount():
			m_IsHasAttackEquipAndCanUse = true
		else:
			m_IsHasAttackEquipAndCanUse = false
			UIManager.DownPanel_AddJournalRecordWithStringKey("NEED_CHARGING_NUMBERING")
	else:
		m_IsHasAttackEquip = false
	
	if m_IsHasAttackEquip:
		spriteAttackToLeft_spriteAttackEquip.visible = true
	else:
		spriteAttackToLeft_spriteAttackEquip.visible = false
	
	if m_IsHasAttackEquipAndCanUse:
		area2DAttack_collisionShape2D3.visible = true
	else:
		area2DAttack_collisionShape2D3.visible = false

func ChangeToState_ATTACK():
	SetCheck_ATTACK()

func DoStateActionIn_ATTACK():
	DoStateAction_ATTACK()

func DoStateAction_ATTACK():
	if 0 == m_CurrentAvatarState_DoStateActionCount:
		m_IsATTACKedAvatar = false
		if m_IsHasAttackEquip:
			AudioManager.PlayByName_Whoosh()
	
	if m_IsATTACKedAvatar:
		return
	
#	HQH.Log("DoStateAction_ATTACK")
	
	spriteAttackToLeft.flip_h = m_SpriteToLeft_flip_h
	SetEquipFlipH()
	if m_SpriteToLeft_flip_h:
		if area2DAttack_collisionShape2D3.visible:
			area2DAttack_collisionShape2D3.position.x = abs(area2DAttack_collisionShape2D3.position.x)
		
		if spriteAttackToLeft_spriteAttackEquip.visible:
			spriteAttackToLeft_spriteAttackEquip.flip_h = true
			spriteAttackToLeft_spriteAttackEquip.offset.x = abs(spriteAttackToLeft_spriteAttackEquip.offset.x)
	else:
		if area2DAttack_collisionShape2D3.visible:
			area2DAttack_collisionShape2D3.position.x = -abs(area2DAttack_collisionShape2D3.position.x)
		
		if spriteAttackToLeft_spriteAttackEquip.visible:
			spriteAttackToLeft_spriteAttackEquip.flip_h = false
			spriteAttackToLeft_spriteAttackEquip.offset.x = -abs(spriteAttackToLeft_spriteAttackEquip.offset.x)
	
	animationPlayer1.play(ANIMATION_ATTACK_NAME)
	
	if m_IsHasAttackEquipAndCanUse:
		var avatarBaseFound: KinematicBody2DAvatarBase = null
		var avatarBaseFoundMinY: KinematicBody2DAvatarBase = null
		for iv in m_Area2DAttack_Entered_AvatarBaseList:
			if 0 == iv.GerNumbering():
				if avatarBaseFound:
					if iv.GetPosition().y < avatarBaseFound.GetPosition().y:
						avatarBaseFound = iv
				else:
						avatarBaseFound = iv
			
			if avatarBaseFoundMinY:
				if iv.GetPosition().y < avatarBaseFoundMinY.GetPosition().y:
					avatarBaseFoundMinY = iv
			else:
				avatarBaseFoundMinY = iv
		
		var avatarBaseFoundResult: KinematicBody2DAvatarBase = null
		if avatarBaseFound:
			avatarBaseFoundResult = avatarBaseFound
		elif avatarBaseFoundMinY:
			avatarBaseFoundResult = avatarBaseFoundMinY
		
		if avatarBaseFoundResult:
			m_IsATTACKedAvatar = true
			UIManager.DownPanel_Bag_Decrease_NumberingRodCount(1, false)
			if 0 == avatarBaseFoundResult.GerNumbering():
				AvatarManager.AddSheepNumbering()
			
			avatarBaseFoundResult.SetLabelNumberVisible_True()

func CheckStateIn_FOLLOW_IDLE():
	if AvatarManager.IsCurrentActiveAvatarInState_WALK(GetAvatarObjectID()):
		var isOK: bool = AvatarManager.CheckCurrentActiveAvatarInfoListCount(GetAvatarObjectID())
		if isOK:
			AvatarStart_FOLLOW_WALK()

func ChangeToState_FOLLOW_IDLE():
	pass

func DoStateActionIn_FOLLOW_IDLE():
	DoStateAction_IDLE()

func CheckStateIn_FOLLOW_WALK():
	if not AvatarManager.IsCurrentActiveAvatarInState_WALK(GetAvatarObjectID()):
		AvatarStop_FOLLOW_WALK()

func ChangeToState_FOLLOW_WALK():
	pass

func DoStateActionIn_FOLLOW_WALK():
	DoStateAction_WALK()

func ShowSpriteByState(showState: int):
	spriteIdleToLeft.visible = ((PLAYER_NPC_STATE.IDLE == showState) or (PLAYER_NPC_STATE.FOLLOW_IDLE == showState))
	spriteWalkToLeft.visible = ((PLAYER_NPC_STATE.WALK == showState) or (PLAYER_NPC_STATE.FOLLOW_WALK == showState))
	spriteTalkToLeft.visible = (PLAYER_NPC_STATE.TALK == showState)
	spriteAttackToLeft.visible = (PLAYER_NPC_STATE.ATTACK == showState)
	if PLAYER_NPC_STATE.ATTACK != showState:
		spriteAttackToLeft_spriteAttackEquip.visible = false
		area2DAttack_collisionShape2D3.visible = false

func CheckState():
	match m_CurrentAvatarState:
		PLAYER_NPC_STATE.IDLE:
			CheckStateIn_IDLE()
		
		PLAYER_NPC_STATE.WALK:
			CheckStateIn_WALK()
		
		PLAYER_NPC_STATE.TALK:
			CheckStateIn_TALK()
		
		PLAYER_NPC_STATE.ATTACK:
			CheckStateIn_ATTACK()
		
		PLAYER_NPC_STATE.FOLLOW_IDLE:
			CheckStateIn_FOLLOW_IDLE()
		
		PLAYER_NPC_STATE.FOLLOW_WALK:
			CheckStateIn_FOLLOW_WALK()

func ChangeToState(newState: int):
	m_CurrentAvatarState = newState
	m_CurrentAvatarState_DoStateActionCount = 0
	ShowSpriteByState(m_CurrentAvatarState)
	match m_CurrentAvatarState:
		PLAYER_NPC_STATE.IDLE:
			ChangeToState_IDLE()
		
		PLAYER_NPC_STATE.WALK:
			ChangeToState_WALK()
		
		PLAYER_NPC_STATE.TALK:
			ChangeToState_TALK()
		
		PLAYER_NPC_STATE.ATTACK:
			ChangeToState_ATTACK()
		
		PLAYER_NPC_STATE.FOLLOW_IDLE:
			ChangeToState_FOLLOW_IDLE()
		
		PLAYER_NPC_STATE.FOLLOW_WALK:
			ChangeToState_FOLLOW_WALK()

func DoStateAction():
	match m_CurrentAvatarState:
		PLAYER_NPC_STATE.IDLE:
			DoStateActionIn_IDLE()
		
		PLAYER_NPC_STATE.WALK:
			DoStateActionIn_WALK()
		
		PLAYER_NPC_STATE.TALK:
			DoStateActionIn_TALK()
		
		PLAYER_NPC_STATE.ATTACK:
			DoStateActionIn_ATTACK()
		
		PLAYER_NPC_STATE.FOLLOW_IDLE:
			DoStateActionIn_FOLLOW_IDLE()
		
		PLAYER_NPC_STATE.FOLLOW_WALK:
			DoStateActionIn_FOLLOW_WALK()
	
	m_CurrentAvatarState_DoStateActionCount += 1

func IsAvatarInState_IDLE() -> bool:
	return (PLAYER_NPC_STATE.IDLE == m_CurrentAvatarState)

func IsAvatarInState_WALK() -> bool:
	return (PLAYER_NPC_STATE.WALK == m_CurrentAvatarState)

func IsAvatarInState_TALK() -> bool:
	return (PLAYER_NPC_STATE.TALK == m_CurrentAvatarState)

func IsAvatarInState_ATTACK() -> bool:
	return (PLAYER_NPC_STATE.ATTACK == m_CurrentAvatarState)

func IsAvatarInState_FOLLOW() -> bool:
	return (IsAvatarInState_FOLLOW_IDLE() or IsAvatarInState_FOLLOW_WALK())

func IsAvatarInState_FOLLOW_IDLE() -> bool:
	return (PLAYER_NPC_STATE.FOLLOW_IDLE == m_CurrentAvatarState)

func IsAvatarInState_FOLLOW_WALK() -> bool:
	return (PLAYER_NPC_STATE.FOLLOW_WALK == m_CurrentAvatarState)

func AvatarStart_IDLE():
	ChangeToState(PLAYER_NPC_STATE.IDLE)

func AvatarStart_WALK():
	ChangeToState(PLAYER_NPC_STATE.WALK)

func AvatarStart_TALK():
	ChangeToState(PLAYER_NPC_STATE.TALK)

func AvatarStop_TALK():
	AvatarStart_IDLE()

func AvatarStart_ATTACK():
	ChangeToState(PLAYER_NPC_STATE.ATTACK)

func AvatarStop_ATTACK():
	AvatarStart_IDLE()

func AvatarStart_FOLLOW_IDLE():
	ChangeToState(PLAYER_NPC_STATE.FOLLOW_IDLE)

func AvatarStart_FOLLOW_WALK():
	ChangeToState(PLAYER_NPC_STATE.FOLLOW_WALK)

func AvatarStop_FOLLOW_WALK():
	ChangeToState(PLAYER_NPC_STATE.FOLLOW_IDLE)

func _on_animationPlayer1_animation_finished(anim_name: String):
	match anim_name:
		ANIMATION_ATTACK_NAME:
#			HQH.Log("_on_animationPlayer1_animation_finished, AvatarStop_ATTACK")
			AvatarStop_ATTACK()
		
		ANIMATION_TALK_NAME:
			AvatarStop_TALK()

#func SetCurrentActive():
##	$camera2D1.make_current()
#
#	CameraManager.MountCurrentCamera()
#
#func SetCurrentUnactive():
#	CameraManager.UnmountCurrentCamera()
#
#func SetPosition(newPosition: Vector2):
#	self.position = newPosition
#
#func SetScale(newScale: Vector2):
#	self.scale = newScale
#
#func GetPosition() -> Vector2:
#	return self.position
#
#func SetAvatarObjectID(newID: int):
#	m_AvatarObjectID = newID
#
#func GetAvatarObjectID() -> int:
#	return m_AvatarObjectID
#
#func SetAvatarTypeID(newID: int):
#	m_AvatarTypeID = newID
#
#func GetAvatarTypeID() -> int:
#	return m_AvatarTypeID

func SetIsNPC(isNPC: bool, nPCManner: int):
	m_IsNPC = isNPC
	m_NPCManner = nPCManner

func GetIsNPC() -> bool:
	return m_IsNPC

func SetSpriteToLeft_flip_h_TimerStep(timerStep: float):
	m_SpriteToLeft_flip_h_TimerStep = timerStep

func SetInInteraction(isInInteraction: bool, isNeedShowOutline: bool = true):
	if isNeedShowOutline:
		if isInInteraction:
			ShowOutline()
		else:
			HideOutline()

func GetSpriteToLeft_flip_h() -> bool:
	return m_SpriteToLeft_flip_h

func SetEquipFlipH():
	if 0 < node2DEquip_Head.get_child_count():
		for iv in node2DEquip_Head.get_children():
			iv.SetFlipH(m_SpriteToLeft_flip_h)

func RemoveEquip(isRemoveAll: bool, equipTypeID: int) -> bool:
	var isRemoveSuccess: bool = false
	if isRemoveAll or ((0 < equipTypeID) and (m_EquipTypeID_Head == equipTypeID)):
		if 0 < node2DEquip_Head.get_child_count():
			isRemoveSuccess = true
			for iv in node2DEquip_Head.get_children():
				node2DEquip_Head.remove_child(iv)
				iv.queue_free()
				iv = null
	
	return isRemoveSuccess

func PutOnEquip(equipTypeID: int):
	RemoveEquip(true, 0)
	m_EquipTypeID_Head = equipTypeID
	
	var preloadResourcePath: String = TableManager.TableGetValue_EquipTable1_PreloadResourcePath(equipTypeID)
	var preloadResource: Resource = TableManager.Get_PRELOAD_RESOURCE_MAP(preloadResourcePath)
	var equipInstance = preloadResource.instance()
	equipInstance.SetHairColor(equipTypeID)
	
	node2DEquip_Head.add_child(equipInstance)

func GetCurrentMaterialByAvatarState() -> Material:
	var spriteMaterial: Material = null
	match m_CurrentAvatarState:
		PLAYER_NPC_STATE.IDLE:
			spriteMaterial = spriteIdleToLeft.material
		
		PLAYER_NPC_STATE.WALK:
			spriteMaterial = spriteWalkToLeft.material
		
		PLAYER_NPC_STATE.TALK:
			spriteMaterial = spriteTalkToLeft.material
		
		PLAYER_NPC_STATE.ATTACK:
			spriteMaterial = spriteAttackToLeft.material
		
		PLAYER_NPC_STATE.FOLLOW_IDLE:
			spriteMaterial = spriteIdleToLeft.material
		
		PLAYER_NPC_STATE.FOLLOW_WALK:
			spriteMaterial = spriteWalkToLeft.material
	
	return spriteMaterial

func ShowOutline():
	var spriteMaterial: Material = GetCurrentMaterialByAvatarState()
	
	var outlineColor: Color = HQH.COLORPALETTE_AVATAR.COLOR_AVATAR_OUTLINE
	if m_IsNPC:
		match m_NPCManner:
			HQH.NPC_MANNER_TYPE.NPC_MANNER_FRIENDLY:
				outlineColor = HQH.COLORPALETTE_AVATAR.COLOR_NPC_FRIENDLY_OUTLINE
			
			HQH.NPC_MANNER_TYPE.NPC_MANNER_HOSTILITY:
				outlineColor = HQH.COLORPALETTE_AVATAR.COLOR_NPC_HOSTILITY_OUTLINE
			
			HQH.NPC_MANNER_TYPE.NPC_MANNER_ARTICLE:
				outlineColor = HQH.COLORPALETTE_AVATAR.COLOR_NPC_ARTICLE_OUTLINE
	else:
		outlineColor = HQH.COLORPALETTE_AVATAR.COLOR_AVATAR_OUTLINE
	
	ShowOutlineFunction(spriteMaterial, outlineColor)

func HideOutline():
	var spriteMaterial: Material = GetCurrentMaterialByAvatarState()
	HideOutlineFunction(spriteMaterial)

func _on_area2D1_input_event(_viewport: Object, event: InputEvent, _shape_idx: int):
	if event.is_action_pressed("focus_click"):
#		HQH.Log("_on_area2D1_input_event, m_AvatarTypeID: %s" % m_AvatarTypeID)
		
		AvatarStart_TALK()
		
		var clickAudioResource: String = TableManager.GetAvatarClickAudioResource(m_AvatarTypeID)
		if not clickAudioResource.empty():
			AudioManager.PlayByName(clickAudioResource)

func _on_area2D1_mouse_entered():
#	HQH.Log("_on_area2D1_mouse_entered, m_AvatarTypeID: %s" % m_AvatarTypeID)
	
	AudioManager.PlayByName_ButtonHover()
	ShowOutline()
	UIManager.UpNamePanel_ShowTipsByAvatarTypeID(m_AvatarTypeID)

func _on_area2D1_mouse_exited():
#	HQH.Log("_on_area2D1_mouse_exited, m_AvatarTypeID: %s" % m_AvatarTypeID)
	
	HideOutline()
	UIManager.UpNamePanel_HideTipsByAvatarTypeID(false, m_AvatarTypeID)

#func ReparentAndMoveTo0(newParent: Node2D):
#	get_parent().remove_child(self)
#	newParent.add_child(self)
#	newParent.move_child(self, 0)

func SetNPCTrigger(nPCTrigger: Node2D):
	m_NPCTrigger = nPCTrigger

func SetNPCTriggerInvalid():
	if is_instance_valid(m_NPCTrigger):
		m_NPCTrigger.SetInvalid()

#func SetInvalid():
#	self.visible = false
#
#func SetValid():
#	self.visible = true

func _on_area2DAttack_area_entered(area: Area2DInteraction):
#	HQH.Log("_on_area2DAttack_area_entered, area: %s" % area)
	if not area:
		return
	
#	HQH.Log("_on_area2DAttack_area_entered, area.IsArea2DInteraction(): %s" % area.IsArea2DInteraction())
	if not area.IsArea2DInteraction():
		return
	
	var avatarBase: KinematicBody2DAvatarBase = area.get_parent()
#	HQH.Log("_on_area2DAttack_area_entered, avatarBase.name: %s" % avatarBase.name)
	if AvatarManager.IsSheep(avatarBase):
		if AREA2DATTACK_ENTERED_AVATARBASELIST_MAX > m_Area2DAttack_Entered_AvatarBaseList.size():
			m_Area2DAttack_Entered_AvatarBaseList.append(avatarBase)

func _on_area2DAttack_area_exited(area: Area2DInteraction):
#	HQH.Log("_on_area2DAttack_area_exited, area: %s" % area)
	if not area:
		return
	
#	HQH.Log("_on_area2DAttack_area_exited, area.IsArea2DInteraction(): %s" % area.IsArea2DInteraction())
	if not area.IsArea2DInteraction():
		return
	
	var avatarBase: KinematicBody2DAvatarBase = area.get_parent()
#	HQH.Log("_on_area2DAttack_area_exited, avatarBase.name: %s" % avatarBase.name)
#	HQH.Log("_on_area2DAttack_area_exited, erase begin, m_Area2DAttack_Entered_AvatarBaseList.size(): %s" % m_Area2DAttack_Entered_AvatarBaseList.size())
	m_Area2DAttack_Entered_AvatarBaseList.erase(avatarBase)
#	HQH.Log("_on_area2DAttack_area_exited, erase end, m_Area2DAttack_Entered_AvatarBaseList.size(): %s" % m_Area2DAttack_Entered_AvatarBaseList.size())
