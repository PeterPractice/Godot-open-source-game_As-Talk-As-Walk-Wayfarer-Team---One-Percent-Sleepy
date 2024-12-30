extends KinematicBody2DAvatarBase
class_name KinematicBody2DSheep

const ANIMATION_BLEAT_NAME: String = "bleatToLeft"

export var IsCanInputMotion: bool = false

onready var spriteIdleToLeft = $spriteIdleToLeft
onready var spriteWalkToLeft = $spriteWalkToLeft
onready var spriteBleatToLeft = $spriteBleatToLeft
onready var spriteEatToLeft = $spriteEatToLeft
onready var animationPlayer1 = $animationPlayer1
onready var animationPlayerNumber = $animationPlayerNumber
onready var spriteIdleToLeft_commonDiceLabel14Number = $spriteIdleToLeft/commonDiceLabel14Number
onready var spriteWalkToLeft_commonDiceLabel14Number = $spriteWalkToLeft/commonDiceLabel14Number
onready var spriteBleatToLeft_commonDiceLabel14Number = $spriteBleatToLeft/commonDiceLabel14Number
onready var spriteEatToLeft_commonDiceLabel14Number = $spriteEatToLeft/commonDiceLabel14Number
onready var visibilityNotifier2DScreen = $visibilityNotifier2DScreen

enum SHEEP_STATE {
	IDLE,
	WALK,
	BLEAT,
	EAT,
	
	MAX,
}
#var m_CurrentAvatarState: int = SHEEP_STATE.IDLE
#For each Avatar State, also need 3 function(example: IDLE):
#func CheckStateIn_IDLE()
#func ChangeToState_IDLE()
#func DoStateActionIn_IDLE()

var m_CurrentMotionDirection: Vector2 = Vector2.ZERO
var m_SpriteToLeft_flip_h: bool = false
var m_IsBegin_Follow_BLEAT: bool = false
var m_StartTimeInMilliseconds_Follow_BLEAT: int = 0
var m_EnteredPlantObject: KinematicBody2DPlant = null
const IDLETORANDOMSTATE_DURATIONPROCESSCOUNT_MIN: int = 15 # 0.25 seconds
const IDLETORANDOMSTATE_DURATIONPROCESSCOUNT_MAX: int = 600 # 10.0 seconds
var m_IdleToRandomState_DurationProcessCount: int = 0
const MOTION_SPEED_SCALE_MIN: float = 0.01
const MOTION_SPEED_SCALE_MAX: float = 0.25
var m_MotionSpeedScale: float = 0.0
var m_Numbering: int = 0

func _ready():
	SetAvatarBehaviorType(AvatarManager.AVATAR_BEHAVIOR_TYPE.SHEEP)
	
	spriteIdleToLeft.material = spriteIdleToLeft.material.duplicate(true)
	spriteWalkToLeft.material = spriteWalkToLeft.material.duplicate(true)
	spriteBleatToLeft.material = spriteBleatToLeft.material.duplicate(true)
	spriteEatToLeft.material = spriteEatToLeft.material.duplicate(true)
	
	SetLabelNumberVisible_False()
	
	SetRandomModulate(25)
	
	m_SpriteToLeft_flip_h = HQH.RandomBool()
	SetSprite_IDLE()
	
	AvatarStart_IDLE()

func SetSpriteToLeft_flip_h():
	if 0.0 < m_CurrentMotionDirection.x:
		m_SpriteToLeft_flip_h = true
	elif 0.0 > m_CurrentMotionDirection.x:
		m_SpriteToLeft_flip_h = false

func SetLabelNumberAlign(commonDiceLabel14Number: CommonLabel):
	if m_SpriteToLeft_flip_h:
		commonDiceLabel14Number.align = Label.ALIGN_LEFT
	else:
		commonDiceLabel14Number.align = Label.ALIGN_RIGHT

func DisposePhysicsProcess(_delta: float):
	if not IsOnScreen():
		return
	
	UpdateHungerValue()
	
	if m_IsBegin_Follow_BLEAT:
		if m_StartTimeInMilliseconds_Follow_BLEAT < HQH.MilliTime():
			m_IsBegin_Follow_BLEAT = false
			m_StartTimeInMilliseconds_Follow_BLEAT = 0
			
			AvatarStart_BLEAT()
	
	if IsCanInputMotion:
		m_CurrentMotionDirection = SceneManager.GetCurrentInputMotionDirection()
		m_MotionSpeedScale = HQH.SCALE_INIT
		SetSpriteToLeft_flip_h()
	else:
		if 0 < m_IdleToRandomState_DurationProcessCount:
			m_IdleToRandomState_DurationProcessCount -= 1
	
	CheckState()
	DoStateAction()

func CheckStateIn_IDLE():
	if HQH.IsVector2AbsGreaterThan0(m_CurrentMotionDirection):
		AvatarStart_WALK()

func ChangeToState_IDLE():
	pass

func DoStateActionIn_IDLE():
	DoStateAction_IDLE()

func SetSprite_IDLE():
	spriteIdleToLeft.flip_h = m_SpriteToLeft_flip_h
	SetLabelNumberAlign(spriteIdleToLeft_commonDiceLabel14Number)

const SHEEP_STATE_ALL_ARRAY: Array = [SHEEP_STATE.IDLE, SHEEP_STATE.WALK, SHEEP_STATE.BLEAT, SHEEP_STATE.EAT]
const SHEEP_STATE_IDLE_WALK_ARRAY: Array = [SHEEP_STATE.IDLE, SHEEP_STATE.WALK]
func DoStateAction_IDLE():
	SetSprite_IDLE()
	
	# Think: what I next to do? "Think" should only occur in Idle state.
	if not IsCanInputMotion:
		if 0 >= m_IdleToRandomState_DurationProcessCount:
			var idleToRandomState = SHEEP_STATE_ALL_ARRAY[HQH.Random0Max(SHEEP_STATE_ALL_ARRAY.size() - 1)]
			# Check state condition
			match idleToRandomState:
				SHEEP_STATE.IDLE:
					pass
				
				SHEEP_STATE.WALK:
					pass
				
				SHEEP_STATE.BLEAT:
					if IsOnScreen():
						var isCan_IdleToRandomState_BLEAT: bool = AvatarManager.SheepIsCan_IdleToRandomState_BLEAT()
						if not isCan_IdleToRandomState_BLEAT:
							idleToRandomState = SHEEP_STATE_IDLE_WALK_ARRAY[HQH.Random0Max(SHEEP_STATE_IDLE_WALK_ARRAY.size() - 1)]
					else:
						idleToRandomState = SHEEP_STATE_IDLE_WALK_ARRAY[HQH.Random0Max(SHEEP_STATE_IDLE_WALK_ARRAY.size() - 1)]
				
				SHEEP_STATE.EAT:
					var isWantStopEat: bool = IsWantStopEat()
					if isWantStopEat:
						idleToRandomState = SHEEP_STATE_IDLE_WALK_ARRAY[HQH.Random0Max(SHEEP_STATE_IDLE_WALK_ARRAY.size() - 1)]
				
				_:
					HQH.AssertLog("DoStateAction_IDLE, idleToRandomState out of range: %s" % idleToRandomState)
			
			m_IdleToRandomState_DurationProcessCount = HQH.RandomModRange(IDLETORANDOMSTATE_DURATIONPROCESSCOUNT_MIN, IDLETORANDOMSTATE_DURATIONPROCESSCOUNT_MAX)
			
			ChangeToState(idleToRandomState)

func CheckStateIn_WALK():
	if not IsCanInputMotion:
		if 0 >= m_IdleToRandomState_DurationProcessCount:
			m_CurrentMotionDirection = Vector2.ZERO
	
	if (0.0 == m_CurrentMotionDirection.x) and (0.0 == m_CurrentMotionDirection.y):
		AvatarStop_WALK()

func ChangeToState_WALK():
	if 0 < m_IdleToRandomState_DurationProcessCount:
		var motionDirectionX: float = HQH.Random1or_1() * HQH.RandFloat()
		var motionDirectionY: float = HQH.Random1or_1() * HQH.RandFloat()
		m_CurrentMotionDirection = Vector2(motionDirectionX, motionDirectionY).normalized()
		m_MotionSpeedScale = HQH.RandomModRangeFloat(MOTION_SPEED_SCALE_MIN, MOTION_SPEED_SCALE_MAX)
		SetSpriteToLeft_flip_h()

func DoStateActionIn_WALK():
	DoStateAction_WALK()

func GetLinearVelocity() -> Vector2:
	var linearVelocity: Vector2 = m_CurrentMotionDirection * SceneManager.GetAvatarMotionSpeed() * m_MotionSpeedScale
	
	return linearVelocity

const OFFSCREENUPDATETIMEINMILLISECONDS_WALK_MAX: int = int(1.0 * HQH.MILLISECONDS_NUMBER)
var m_OffScreenUpdateTimeInMilliSeconds_WALK: int = HQH.MilliTime()
func DoStateAction_WALK():
	if IsOnScreen():
		spriteWalkToLeft.flip_h = m_SpriteToLeft_flip_h
		SetLabelNumberAlign(spriteWalkToLeft_commonDiceLabel14Number)
		
		animationPlayer1.play("walkToLeft")
		
		var linearVelocity: Vector2 = GetLinearVelocity()
		move_and_slide(linearVelocity)
	else:
		var passTimeInMilliseconds: int = HQH.MilliTime() - m_OffScreenUpdateTimeInMilliSeconds_WALK
		if OFFSCREENUPDATETIMEINMILLISECONDS_WALK_MAX < passTimeInMilliseconds:
			m_OffScreenUpdateTimeInMilliSeconds_WALK = HQH.MilliTime()
			var linearVelocity: Vector2 = GetLinearVelocity()
			var moveStep: Vector2 = (passTimeInMilliseconds * HQH.MILLISECONDS_NUMBER_1) * linearVelocity * HQH.PHYSICS_PROCESS_FRAME_NUMBER
			move_and_slide(moveStep)

func CheckStateIn_BLEAT():
	pass

func ChangeToState_BLEAT():
	#	var clickAudioResource: String = TableManager.GetAvatarClickAudioResource(m_AvatarTypeID)
	var clickAudioResource: String = TableManager.GetAudioSoundEffectSheepNameByID((HQH.Rand() % TableManager.AUDIO_SOUND_EFFECT_SHEEP_ID_MAX) + 1)
	if not clickAudioResource.empty():
		AudioManager.PlayByName(clickAudioResource)
	
	AvatarManager.SheepSetIdleToRandomState_BLEAT_Occur()

func DoStateActionIn_BLEAT():
	DoStateAction_BLEAT()

func DoStateAction_BLEAT():
	if IsOnScreen():
		spriteBleatToLeft.flip_h = m_SpriteToLeft_flip_h
		SetLabelNumberAlign(spriteBleatToLeft_commonDiceLabel14Number)
	
		animationPlayer1.play(ANIMATION_BLEAT_NAME)

func IsWantStopEat() -> bool:
	var isWantStopEat: bool = false
	if self.IsNotHungry():
		isWantStopEat = true
	else:
		if m_EnteredPlantObject:
			if m_EnteredPlantObject.IsEmptytAmountOfGrass():
				isWantStopEat = true
		else:
			isWantStopEat = true
	
	return isWantStopEat

#草被吃需要可以停止：
#没有草。
#有草，但被吃完了。
#羊不饿（已经吃饱了）。
#羊就是不想吃了，状态变化了。
func CheckStateIn_EAT():
	var isWantStartIdle: bool = false
	if 0 >= m_IdleToRandomState_DurationProcessCount:
		isWantStartIdle = true
	else:
		var isWantStopEat: bool = IsWantStopEat()
		if isWantStopEat:
			isWantStartIdle = true
	
	if isWantStartIdle:
		AvatarStop_EAT()

func ChangeToState_EAT():
	if m_EnteredPlantObject:
		if self.GetPosition().x < m_EnteredPlantObject.GetPosition().x:
			m_SpriteToLeft_flip_h = true
		else:
			m_SpriteToLeft_flip_h = false

func DoStateActionIn_EAT():
	DoStateAction_EAT()

func DoStateAction_EAT():
	if IsOnScreen():
		spriteEatToLeft.flip_h = m_SpriteToLeft_flip_h
		SetLabelNumberAlign(spriteEatToLeft_commonDiceLabel14Number)
	
		animationPlayer1.play("eatToLeft")
	
	if m_EnteredPlantObject:
		self.ReduceHungerValue()
		m_EnteredPlantObject.AvatarStart_BE_EATEN()

func ShowSpriteByState(showState: int):
	spriteIdleToLeft.visible = (SHEEP_STATE.IDLE == showState)
	spriteWalkToLeft.visible = (SHEEP_STATE.WALK == showState)
	spriteBleatToLeft.visible = (SHEEP_STATE.BLEAT == showState)
	spriteEatToLeft.visible = (SHEEP_STATE.EAT == showState)

func CheckState():
	match m_CurrentAvatarState:
		SHEEP_STATE.IDLE:
			CheckStateIn_IDLE()
		
		SHEEP_STATE.WALK:
			CheckStateIn_WALK()
		
		SHEEP_STATE.BLEAT:
			CheckStateIn_BLEAT()
		
		SHEEP_STATE.EAT:
			CheckStateIn_EAT()

func ChangeToState(newState: int):
	m_CurrentAvatarState = newState
	ShowSpriteByState(m_CurrentAvatarState)
	match m_CurrentAvatarState:
		SHEEP_STATE.IDLE:
			ChangeToState_IDLE()
		
		SHEEP_STATE.WALK:
			ChangeToState_WALK()
		
		SHEEP_STATE.BLEAT:
			ChangeToState_BLEAT()
		
		SHEEP_STATE.EAT:
			ChangeToState_EAT()

func DoStateAction():
	match m_CurrentAvatarState:
		SHEEP_STATE.IDLE:
			DoStateActionIn_IDLE()
		
		SHEEP_STATE.WALK:
			DoStateActionIn_WALK()
		
		SHEEP_STATE.BLEAT:
			DoStateActionIn_BLEAT()
		
		SHEEP_STATE.EAT:
			DoStateActionIn_EAT()

func IsAvatarInState_IDLE() -> bool:
	return (SHEEP_STATE.IDLE == m_CurrentAvatarState)

func IsAvatarInState_WALK() -> bool:
	return (SHEEP_STATE.WALK == m_CurrentAvatarState)

func IsAvatarInState_BLEAT() -> bool:
	return (SHEEP_STATE.BLEAT == m_CurrentAvatarState)

func IsAvatarInState_EAT() -> bool:
	return (SHEEP_STATE.EAT == m_CurrentAvatarState)

func AvatarStart_IDLE():
	ChangeToState(SHEEP_STATE.IDLE)

func AvatarStart_WALK():
	ChangeToState(SHEEP_STATE.WALK)

func AvatarStop_WALK():
	AvatarStart_IDLE()

func AvatarStart_BLEAT():
	ChangeToState(SHEEP_STATE.BLEAT)

func AvatarStop_BLEAT():
	AvatarStart_IDLE()

func AvatarStart_EAT():
	ChangeToState(SHEEP_STATE.EAT)

func AvatarStop_EAT():
	if m_EnteredPlantObject:
		m_EnteredPlantObject.AvatarStop_BE_EATEN()
	
	AvatarStart_IDLE()

func _on_animationPlayer1_animation_finished(anim_name: String):
	if ANIMATION_BLEAT_NAME == anim_name:
		AvatarStop_BLEAT()

func SetInInteraction(isInInteraction: bool, isNeedShowOutline: bool = true):
	if isNeedShowOutline:
		if isInInteraction:
			ShowOutline()
		else:
			HideOutline()

func GetSpriteToLeft_flip_h() -> bool:
	return m_SpriteToLeft_flip_h

func GetMaterialByAvatarState(avatarState: int) -> Material:
	var spriteMaterial: Material = null
	match avatarState:
		SHEEP_STATE.IDLE:
			spriteMaterial = spriteIdleToLeft.material
		
		SHEEP_STATE.WALK:
			spriteMaterial = spriteWalkToLeft.material
		
		SHEEP_STATE.BLEAT:
			spriteMaterial = spriteBleatToLeft.material
		
		SHEEP_STATE.EAT:
			spriteMaterial = spriteEatToLeft.material
	
	return spriteMaterial

func GetCurrentMaterialByAvatarState() -> Material:
	return GetMaterialByAvatarState(m_CurrentAvatarState)

func ShowOutline():
	var spriteMaterial: Material = GetCurrentMaterialByAvatarState()
	ShowOutlineFunction(spriteMaterial, HQH.COLORPALETTE_AVATAR.COLOR_NPC_SHEEP_OUTLINE)

func HideOutline():
	for i in SHEEP_STATE.MAX:
		var spriteMaterial: Material = GetMaterialByAvatarState(i)
		HideOutlineFunction(spriteMaterial)

func _on_area2D1_input_event(_viewport: Object, event: InputEvent, _shape_idx: int):
	if event.is_action_pressed("focus_click"):
#		HQH.Log("_on_area2D1_input_event, m_AvatarTypeID: %s" % m_AvatarTypeID)
		
		AvatarStart_BLEAT()
		
		AvatarManager.SheepStart_BLEAT(GetAvatarObjectID(), GetPosition())

func _on_area2D1_mouse_entered():
#	HQH.Log("_on_area2D1_mouse_entered, m_AvatarTypeID: %s" % m_AvatarTypeID)
	
	AudioManager.PlayByName_ButtonHover()
	ShowOutline()
	UIManager.UpNamePanel_ShowTipsByAvatarTypeID(m_AvatarTypeID)

func _on_area2D1_mouse_exited():
#	HQH.Log("_on_area2D1_mouse_exited, m_AvatarTypeID: %s" % m_AvatarTypeID)
	
	HideOutline()
	UIManager.UpNamePanel_HideTipsByAvatarTypeID(false, m_AvatarTypeID)

func AvatarFollow_BLEAT():
	m_IsBegin_Follow_BLEAT = true
	var waitTimeMin: float = 1.0
	var waitTimeMax: float = 4.0
	m_StartTimeInMilliseconds_Follow_BLEAT = HQH.MilliTime() + int(HQH.RandomModRangeFloat(waitTimeMin, waitTimeMax) * HQH.MILLISECONDS_NUMBER)

func SetEnteredPlant(plantObject: KinematicBody2DPlant):
	if m_EnteredPlantObject:
		if plantObject.GetPosition().y < m_EnteredPlantObject.GetPosition().y:
			m_EnteredPlantObject = plantObject
	else:
		m_EnteredPlantObject = plantObject

func SetExitedPlant(plantObject: KinematicBody2DPlant):
	if plantObject == m_EnteredPlantObject:
		m_EnteredPlantObject = null

const HUNGERVALUE_MIN: int = 0
var m_HungerValue_Max: int = 100
var m_HungerValue: int = m_HungerValue_Max
func AddHungerValue(addValue: int):
	SetHungerValue(GetHungerValue() + addValue)

func ReduceHungerValue():
	var reduceValue: int = -1
	SetHungerValue(GetHungerValue() + reduceValue)

func SetHungerValue(hungerValue: int):
	if HUNGERVALUE_MIN > hungerValue:
		HQH.AssertLog("SetHungerValue, HUNGERVALUE_MIN: %s > hungerValue: %s" % [HUNGERVALUE_MIN, hungerValue])
		hungerValue = HUNGERVALUE_MIN
	
	if m_HungerValue_Max < hungerValue:
		HQH.AssertLog("SetHungerValue, m_HungerValue_Max: %s < hungerValue: %s" % [m_HungerValue_Max, hungerValue])
		hungerValue = m_HungerValue_Max
	
	m_HungerValue = hungerValue

func GetHungerValue() -> int:
	return m_HungerValue

func IsNotHungry() -> bool:
	return HUNGERVALUE_MIN >= m_HungerValue

func SetHungerValue_Max(hungerValue_Max: int):
	m_HungerValue_Max = hungerValue_Max

func IsMaxHungerValue() -> bool:
	return m_HungerValue_Max <= m_HungerValue

const UPDATEHUNGERVALUETIMESTEPINMILLISECONDS_MAX: int = int(1.0 * HQH.MILLISECONDS_NUMBER)
var m_UpdateHungerValueTimeStepInMilliseconds: int = HQH.MilliTime()
var m_UpdateHungerValueAddHungerValueStep: int = 1
func UpdateHungerValue():
	if not IsMaxHungerValue():
		var passTimeInMilliseconds: int = HQH.MilliTime() - m_UpdateHungerValueTimeStepInMilliseconds
		if UPDATEHUNGERVALUETIMESTEPINMILLISECONDS_MAX < passTimeInMilliseconds:
			m_UpdateHungerValueTimeStepInMilliseconds = HQH.MilliTime()
			AddHungerValue(m_UpdateHungerValueAddHungerValueStep)

func SetLabelNumberVisibleBase(v: bool):
	spriteIdleToLeft_commonDiceLabel14Number.visible = v
	spriteWalkToLeft_commonDiceLabel14Number.visible = v
	spriteBleatToLeft_commonDiceLabel14Number.visible = v
	spriteEatToLeft_commonDiceLabel14Number.visible = v

func SetNumbering():
	spriteIdleToLeft_commonDiceLabel14Number.text = String(m_Numbering)
	spriteWalkToLeft_commonDiceLabel14Number.text = String(m_Numbering)
	spriteBleatToLeft_commonDiceLabel14Number.text = String(m_Numbering)
	spriteEatToLeft_commonDiceLabel14Number.text = String(m_Numbering)

func SetLabelNumberVisible_False():
	SetLabelNumberVisibleBase(false)

func SetLabelNumberVisible_True():
	if 0 == GerNumbering():
		m_Numbering = AvatarManager.GetSheepNumbering()
		SetNumbering()
		SetLabelNumberVisibleBase(true)
	
	AudioManager.PlayByName_SheepLabelNumber()
	animationPlayerNumber.play("numberFadeOut")

func GetLabelNumberVisible() -> bool:
	return spriteIdleToLeft_commonDiceLabel14Number.visible

func GerNumbering() -> int:
	return m_Numbering

func SetRandomHungerValue(maxMin: int, maxMax: int):
	var randomValueMin: int = maxMin
	var randomValueMax: int = maxMax
	var randomValue: int = HQH.RandomModRange(randomValueMin, randomValueMax)
	SetHungerValue_Max(randomValue)
	SetHungerValue(randomValue)

func IsOnScreenByPosition() -> bool:
	var avatarRect: Rect2 = HQH.GetRect2ByAvatarPosition(AvatarManager.GetCurrentActiveAvatarPosition(), OS.get_window_size())
	var isOnScreenByPosition: bool = avatarRect.has_point(self.GetPosition())
	
	return isOnScreenByPosition

func IsOnScreen() -> bool:
	return visibilityNotifier2DScreen.is_on_screen()
