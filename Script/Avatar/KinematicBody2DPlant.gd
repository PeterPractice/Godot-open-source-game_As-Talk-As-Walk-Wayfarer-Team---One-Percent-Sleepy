extends KinematicBody2DAvatarBase
class_name KinematicBody2DPlant

onready var textureRectBG = $textureRectBG
onready var spriteIdleToLeft = $spriteIdleToLeft
onready var spriteBeEatenToLeft = $spriteBeEatenToLeft
onready var spriteSwayToLeft = $spriteSwayToLeft
onready var animationPlayer1 = $animationPlayer1
onready var textureRectMulch = $textureRectMulch
onready var visibilityNotifier2DScreen = $visibilityNotifier2DScreen

enum PLANT_STATE {
	IDLE,
	BE_EATEN,
	SWAY,
	
	MAX,
}
#var m_CurrentAvatarState: int = PLANT_STATE.IDLE
#For each Avatar State, also need 3 function(example: IDLE):
#func CheckStateIn_IDLE()
#func ChangeToState_IDLE()
#func DoStateActionIn_IDLE()

var m_EnteredAvatarBaseArray: Array = []
var m_IsSwayToLeft_SWAY: bool = false

const SHADER_LINE_NAME_ARRAY: Array = ["Shader_XLine2", "Shader_XLine3", "Shader_YLine2", "Shader_YLine3"]
const SHADER_LINE_PROGRESS_RANGE_MAX: float = 0.725

func _ready():
	SetAvatarBehaviorType(AvatarManager.AVATAR_BEHAVIOR_TYPE.PLANT)
	
	m_IsSwayToLeft_SWAY = HQH.RandomBool()
	
	HideOutline()
	
	spriteIdleToLeft.material = spriteIdleToLeft.material.duplicate(true)
	spriteBeEatenToLeft.material = spriteBeEatenToLeft.material.duplicate(true)
	spriteSwayToLeft.material = spriteSwayToLeft.material.duplicate(true)
	
	var flip_h: bool = HQH.RandomBool()
	textureRectBG.flip_h = flip_h
	spriteIdleToLeft.flip_h = flip_h
	spriteBeEatenToLeft.flip_h = flip_h
	spriteSwayToLeft.flip_h = flip_h
	textureRectMulch.flip_h = flip_h
	
	var randomIndex_SHADER_LINE_NAME: int = HQH.Random0Max(SHADER_LINE_NAME_ARRAY.size() - 1)
	for i in PLANT_STATE.MAX:
		var spriteMaterial: Material = GetMaterialByAvatarState(i)
		spriteMaterial.shader = TableManager.Get_PRELOAD_RESOURCE_MAP(SHADER_LINE_NAME_ARRAY[randomIndex_SHADER_LINE_NAME])
	
	SetRandomModulate(100)
	
	AvatarStart_IDLE()

func DisposePhysicsProcess(_delta: float):
	if not IsOnScreen():
		return
	
	CheckState()
	DoStateAction()

func CheckStateIn_IDLE():
	pass

func ChangeToState_IDLE():
	pass

func DoStateActionIn_IDLE():
	DoStateAction_IDLE()

func DoStateAction_IDLE():
	pass

func CheckStateIn_BE_EATEN():
	pass

func ChangeToState_BE_EATEN():
	pass

func DoStateActionIn_BE_EATEN():
	DoStateAction_BE_EATEN()

func DoStateAction_BE_EATEN():
	if IsOnScreen():
		animationPlayer1.play("beEatenToLeft")

func CheckStateIn_SWAY():
	pass

func ChangeToState_SWAY():
	pass

func DoStateActionIn_SWAY():
	DoStateAction_SWAY()

func DoStateAction_SWAY():
	if IsOnScreen():
		if m_IsSwayToLeft_SWAY:
			animationPlayer1.play("swayToLeft")
		else:
			animationPlayer1.play("swayToRight")

func ShowSpriteByState(showState: int):
	spriteIdleToLeft.visible = (PLANT_STATE.IDLE == showState)
	spriteBeEatenToLeft.visible = (PLANT_STATE.BE_EATEN == showState)
	spriteSwayToLeft.visible = (PLANT_STATE.SWAY == showState)

func CheckState():
	match m_CurrentAvatarState:
		PLANT_STATE.IDLE:
			CheckStateIn_IDLE()
		
		PLANT_STATE.BE_EATEN:
			CheckStateIn_BE_EATEN()
		
		PLANT_STATE.SWAY:
			CheckStateIn_SWAY()

func ChangeToState(newState: int):
	m_CurrentAvatarState = newState
	ShowSpriteByState(m_CurrentAvatarState)
	match m_CurrentAvatarState:
		PLANT_STATE.IDLE:
			ChangeToState_IDLE()
		
		PLANT_STATE.BE_EATEN:
			ChangeToState_BE_EATEN()
		
		PLANT_STATE.SWAY:
			ChangeToState_SWAY()

func DoStateAction():
	match m_CurrentAvatarState:
		PLANT_STATE.IDLE:
			DoStateActionIn_IDLE()
		
		PLANT_STATE.BE_EATEN:
			DoStateActionIn_BE_EATEN()
		
		PLANT_STATE.SWAY:
			DoStateActionIn_SWAY()

func IsAvatarInState_IDLE() -> bool:
	return (PLANT_STATE.IDLE == m_CurrentAvatarState)

func IsAvatarInState_BE_EATEN() -> bool:
	return (PLANT_STATE.BE_EATEN == m_CurrentAvatarState)

func IsAvatarInState_SWAY() -> bool:
	return (PLANT_STATE.SWAY == m_CurrentAvatarState)

func AvatarStart_IDLE():
	ChangeToState(PLANT_STATE.IDLE)

func AvatarStart_BE_EATEN():
	ReduceAmountOfGrass()
	
	ChangeToState(PLANT_STATE.BE_EATEN)

func AvatarStop_BE_EATEN():
	if not m_EnteredAvatarBaseArray.empty():
		AvatarStart_SWAY()
	else:
		AvatarStop_SWAY()

func AvatarStart_SWAY():
	ChangeToState(PLANT_STATE.SWAY)

func AvatarStop_SWAY():
	AvatarStart_IDLE()

func SetInInteraction(isInInteraction: bool, isNeedShowOutline: bool = true):
	if isNeedShowOutline:
		if isInInteraction:
			ShowOutline()
		else:
			HideOutline()

func GetMaterialByAvatarState(avatarState: int) -> Material:
	var spriteMaterial: Material = null
	match avatarState:
		PLANT_STATE.IDLE:
			spriteMaterial = spriteIdleToLeft.material
		
		PLANT_STATE.BE_EATEN:
			spriteMaterial = spriteBeEatenToLeft.material
		
		PLANT_STATE.SWAY:
			spriteMaterial = spriteSwayToLeft.material
	
	return spriteMaterial

func GetCurrentMaterialByAvatarState() -> Material:
	return GetMaterialByAvatarState(m_CurrentAvatarState)

var  m_AmountOfGrass_Min: int = 0
var m_AmountOfGrass_Max: int = 100
var m_AmountOfGrass_Max_1: float = 1.0 / float(m_AmountOfGrass_Max)
var m_AmountOfGrass: int = m_AmountOfGrass_Max
func SetSpriteAmountOfGrass():
	var progress: float = float(m_AmountOfGrass_Max - m_AmountOfGrass) * m_AmountOfGrass_Max_1 * SHADER_LINE_PROGRESS_RANGE_MAX
	for i in PLANT_STATE.MAX:
		var spriteMaterial: Material = GetMaterialByAvatarState(i)
		spriteMaterial.set_shader_param("progress", progress)

func ShowOutline():
	textureRectBG.visible = true

func HideOutline():
	textureRectBG.visible = false

func _on_area2D1_input_event(_viewport: Object, _event: InputEvent, _shape_idx: int):
	pass
#	if event.is_action_pressed("focus_click"):
#		HQH.Log("_on_area2D1_input_event, m_AvatarTypeID: %s" % m_AvatarTypeID)
		
#		var clickAudioResource: String = TableManager.GetAvatarClickAudioResource(m_AvatarTypeID)
#		if not clickAudioResource.empty():
#			AudioManager.PlayByName(clickAudioResource)

func _on_area2D1_mouse_entered():
#	HQH.Log("_on_area2D1_mouse_entered, m_AvatarTypeID: %s" % m_AvatarTypeID)
	
	AudioManager.PlayByName_ButtonHover()
	ShowOutline()
	UIManager.UpNamePanel_ShowTipsByAvatarTypeID(m_AvatarTypeID)

func _on_area2D1_mouse_exited():
#	HQH.Log("_on_area2D1_mouse_exited, m_AvatarTypeID: %s" % m_AvatarTypeID)
	
	HideOutline()
	UIManager.UpNamePanel_HideTipsByAvatarTypeID(false, m_AvatarTypeID)

func _on_area2D1_area_entered(area: Area2DInteraction):
	if not area:
		return
	
#	HQH.Log("_on_area2D1_area_entered, area.name: %s" % area.name)
	
	if not area.IsArea2DInteraction():
		return
	
	var avatarBase: KinematicBody2DAvatarBase = area.get_parent()
#	HQH.Log("avatarBase.name: %s" % avatarBase.name)
	if AvatarManager.IsPlayerNPC_or_Sheep(avatarBase):
		if AvatarManager.IsSheep(avatarBase):
			avatarBase.SetEnteredPlant(self)
		
		m_EnteredAvatarBaseArray.append(avatarBase)
	
	if not m_EnteredAvatarBaseArray.empty():
		AvatarStart_SWAY()

func _on_area2D1_area_exited(area: Area2DInteraction):
	if not area:
		return
	
#	HQH.Log("_on_area2D1_area_exited, area.name: %s" % area.name)
	
	if not area.IsArea2DInteraction():
		return
	
	var avatarBase: KinematicBody2DAvatarBase = area.get_parent()
#	HQH.Log("avatarBase.name: %s" % avatarBase.name)
	if AvatarManager.IsPlayerNPC_or_Sheep(avatarBase):
		if AvatarManager.IsSheep(avatarBase):
			avatarBase.SetExitedPlant(self)
		
		m_EnteredAvatarBaseArray.erase(avatarBase)
	
	if m_EnteredAvatarBaseArray.empty():
		AvatarStop_SWAY()

func AddAmountOfGrass():
	var addValue: int = 1
	SetAmountOfGrass(GetAmountOfGrass() + addValue)

func ReduceAmountOfGrass():
	var reduceValue: int = -1
	SetAmountOfGrass(GetAmountOfGrass() + reduceValue)

func SetAmountOfGrass(amountOfGrass: int):
	if m_AmountOfGrass_Min > amountOfGrass:
		HQH.AssertLog("SetAmountOfGrass, m_AmountOfGrass_Min: %s > amountOfGrass: %s" % [m_AmountOfGrass_Min, amountOfGrass])
		amountOfGrass = m_AmountOfGrass_Min
	
	if m_AmountOfGrass_Max < amountOfGrass:
		HQH.AssertLog("SetAmountOfGrass, m_AmountOfGrass_Max: %s < amountOfGrass: %s" % [m_AmountOfGrass_Max, amountOfGrass])
		amountOfGrass = m_AmountOfGrass_Max
	
	m_AmountOfGrass = amountOfGrass
	
	SetSpriteAmountOfGrass()

func GetAmountOfGrass() -> int:
	return m_AmountOfGrass

func IsEmptytAmountOfGrass() -> bool:
	return m_AmountOfGrass_Min >= m_AmountOfGrass

func SetAmountOfGrass_Min(amountOfGrass_Min: int):
	m_AmountOfGrass_Min = amountOfGrass_Min

func SetAmountOfGrass_Max(amountOfGrass_Max: int):
	m_AmountOfGrass_Max = amountOfGrass_Max
	m_AmountOfGrass_Max_1 = 1.0 / float(m_AmountOfGrass_Max)

func SetRandomAmountOfGrass(minMin: int, minMax: int, maxMin: int, maxMax: int):
	var randomValueMin: int = minMin
	var randomValueMax: int = minMax
	var randomValue: int = HQH.RandomModRange(randomValueMin, randomValueMax)
	SetAmountOfGrass_Min(randomValue)
	
	randomValueMin = maxMin
	randomValueMax = maxMax
	randomValue = HQH.RandomModRange(randomValueMin, randomValueMax)
	SetAmountOfGrass_Max(randomValue)
	SetAmountOfGrass(randomValue)

func IsOnScreen() -> bool:
	return visibilityNotifier2DScreen.is_on_screen()
