extends Node2D
class_name SpawnSheep

const RANGE_VALUE: int = 64

export var numberMin: int = 0
export var numberMax: int = 5
export var delayTimeMin: float = 10.0
export var delayTimeMax: float = 60.0
export var timeStepMin: float = 3.0
export var timeStepMax: float = 10.0

onready var colorRect1 = $colorRect1
onready var animationPlayer1 = $animationPlayer1

var m_Max: int = 0
var m_CurrentCount: int = 0
var m_CurrentTime: float = 0.0
var m_DelayTimeStep: float = 0.0
var m_DelayTime: float = 0.0
var m_TimeStep: float = 0.0

func  _ready():
	colorRect1.visible = false
	
	m_Max = HQH.RandomModRange(numberMin, numberMax)
#	HQH.Log("SpawnSheep, m_Max: %s" % m_Max)
	AvatarManager.AddSheepCountMax(m_Max)
	
	if 0 < m_Max:
		m_DelayTimeStep = HQH.RandomModRangeFloat(delayTimeMin, delayTimeMax)
		m_TimeStep = HQH.RandomModRangeFloat(timeStepMin, timeStepMax)
#		HQH.Log("SpawnSheep, m_DelayTimeStep: %s, m_TimeStep: %s" % [m_DelayTimeStep, m_TimeStep])
		
		var isFlauntLeft: bool = HQH.RandomBool()
		if isFlauntLeft:
			animationPlayer1.play("flauntLeft")
		else:
			animationPlayer1.play("flauntRight")
	else:
		SetInvalid()

func _process(delta: float):
	if SceneManager.GetIsBeginChangeToScene():
		return
	
	if not SceneManager.IsCurrentSceneNode2DAvatarValid():
		return
	
	if 0 >= m_Max:
		return
	
	m_DelayTime = m_DelayTime + delta
	if m_DelayTimeStep > m_DelayTime:
		return
	
	if m_Max > m_CurrentCount:
		m_CurrentTime = m_CurrentTime + delta
		if m_TimeStep < m_CurrentTime:
			m_CurrentTime = 0.0
			m_CurrentCount = m_CurrentCount + 1
			AvatarManager.AddSheepCount()
#				HQH.Log("SpawnSheep, m_CurrentCount: %s" % m_CurrentCount)
			
			var randomPosition: Vector2 = HQH.RandomPosition(RANGE_VALUE)
			AvatarManager.AddSheepToCurrentScene(self.position + randomPosition)
	else:
		SetInvalid()

func SetInvalid():
	if animationPlayer1.is_playing():
		animationPlayer1.stop()
	
	if self.visible:
		self.visible = false
