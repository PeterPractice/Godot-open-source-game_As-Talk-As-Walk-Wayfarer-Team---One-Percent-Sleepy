extends Node2D

onready var control1 = $control1
onready var node2DEye = $node2DEye
onready var colorRect1 = $node2D1/colorRect1
onready var aimationPlayerEye = $aimationPlayerEye

const DISTANCE_STEP: float = 64.0
const DISTANCE_MIN_NUMBER: float = 3.0
const DISTANCE_MIN: float = DISTANCE_MIN_NUMBER * DISTANCE_STEP
const DISTANCE_MAX_NUMBER_REAL: float = 26.0
const DISTANCE_MAX_REAL: float = DISTANCE_MAX_NUMBER_REAL * DISTANCE_STEP
const DISTANCE_MAX_NUMBER: float = DISTANCE_MAX_NUMBER_REAL + DISTANCE_MIN_NUMBER
const DISTANCE_MAX: float = DISTANCE_MAX_NUMBER * DISTANCE_STEP

const AVATAR_POSITION_OFFSET: Vector2 = -Vector2(0.0, DISTANCE_STEP * 0.5)

const NODE2DEYE_SCALE_MIN: float = HQH.SCALE_MIN
const NODE2DEYE_SCALE_MAX: float = HQH.SCALE_MAX
const DISTANCE_SCALE_MIN: float = HQH.SCALE_MIN
const DISTANCE_SCALE_MAX: float = HQH.SCALE_MAX

var m_IsMouseEntered: bool = false

var m_IsInvalid_InDistance_Handle: bool = false # false

func _ready():
	SetShowNormal(true)

func GetDistanceInfo(avatarPosition: Vector2) -> Dictionary:
	var isInDistance: bool = false
	var avatarMotionSpeedScale: float = 0.0
	var distance: Vector2 = self.position - avatarPosition
	var distance_length: float = distance.length()
	if (DISTANCE_MAX) > distance_length:
		isInDistance = true
		var distance_length_diff: float = distance_length - DISTANCE_MIN
		avatarMotionSpeedScale = distance_length_diff / DISTANCE_MAX_REAL
		avatarMotionSpeedScale = clamp(avatarMotionSpeedScale, DISTANCE_SCALE_MIN, DISTANCE_SCALE_MAX)
	
	return {"isInDistance": isInDistance, "avatarMotionSpeedScale": avatarMotionSpeedScale}

func _draw():
	if m_IsMouseEntered:
		draw_circle(Vector2.ZERO, DISTANCE_MAX, HQH.COLORPALETTE_SCENE.COLOR_MYSTERIOUSDEVICE_BG3)
	
#	var sceneClinkerValleyInfo: Dictionary = UIManager.GetSceneClinkerValleyInfo()
#	if (not UIManager.GetClinkerValleySisterInfo_IsStartCounting()) and (not sceneClinkerValleyInfo.isCloseEye):
	if not UIManager.GetClinkerValleySisterInfo_IsStartCounting():
		var node2DAvatarChildren: Array = SceneManager.GetCurrentSceneNode2DAvatarChildren()
		var node2DAvatarChildren_size: int = node2DAvatarChildren.size()
		for i in node2DAvatarChildren_size:
			var node2DAvatarChild: KinematicBody2DAvatarBase = node2DAvatarChildren[node2DAvatarChildren_size - i - 1]
			var isPlayerNPC: bool = AvatarManager.IsPlayerNPC(node2DAvatarChild)
			var isSheep: bool = AvatarManager.IsSheep(node2DAvatarChild)
			if isPlayerNPC or isSheep:
				var positionFrom: Vector2 = node2DAvatarChild.GetPosition() - self.position + AVATAR_POSITION_OFFSET
				var positionTo: Vector2 = colorRect1.rect_global_position - self.position
				var lineColor: Color = Color.white
				if isPlayerNPC:
					lineColor = TableManager.GetAvatarFlagColor(node2DAvatarChild.GetAvatarTypeID())
				else:
					lineColor = node2DAvatarChild.GetModulate()
				
				var distanceInfo: Dictionary = GetDistanceInfo(node2DAvatarChild.GetPosition())
				if distanceInfo.isInDistance:
					var lineWidth: float = HQH.AVATAR_PICTURE_SQUARE_LENGTH_OF_SIDE * (DISTANCE_SCALE_MAX - distanceInfo.avatarMotionSpeedScale)
					draw_line(positionFrom, positionTo, lineColor, lineWidth)

func SetInit():
	SceneManager.SetAvatarMotionSpeedScaleInit()
	AudioManager.SetBGMusic_pitch_scale_Init()

func _process(_delta: float):
#	var sceneClinkerValleyInfo: Dictionary = UIManager.GetSceneClinkerValleyInfo()
#	if UIManager.GetClinkerValleySisterInfo_IsStartCounting() or sceneClinkerValleyInfo.isCloseEye:
	if UIManager.GetClinkerValleySisterInfo_IsStartCounting():
		SetInit()
		
		if NODE2DEYE_SCALE_MIN < node2DEye.scale.x:
			if not aimationPlayerEye.is_playing():
				aimationPlayerEye.play("CloseEye")
	else:
		if NODE2DEYE_SCALE_MAX > node2DEye.scale.x:
			if not aimationPlayerEye.is_playing():
				aimationPlayerEye.play("OpenEye")
		
		var distanceInfo: Dictionary = GetDistanceInfo(AvatarManager.GetCurrentActiveAvatarPosition())
		if distanceInfo.isInDistance and (not m_IsInvalid_InDistance_Handle):
			SceneManager.SetAvatarMotionSpeedScale(distanceInfo.avatarMotionSpeedScale)
			AudioManager.SetBGMusic_pitch_scale(distanceInfo.avatarMotionSpeedScale)
		else:
			SetInit()
	
	update()

func _exit_tree():
	SetInit()

func _on_area2D1_mouse_entered():
	m_IsMouseEntered = true
	ShowOutline()
	UIManager.UpNamePanel_ShowTipsWithStringKey("NAME_2_EYE")

func _on_area2D1_mouse_exited():
	m_IsMouseEntered = false
	HideOutline()
	UIManager.UpNamePanel_HideTips()

func SetShowNormal(isShowNormal: bool):
	if isShowNormal:
		# Normal
		for iv in control1.get_children():
			iv.color = HQH.COLORPALETTE_SCENE.COLOR_MYSTERIOUSDEVICE_BG
	else:
		# Highlight
		for iv in control1.get_children():
			if HQH.RandomBool():
				iv.color = HQH.COLORPALETTE_SCENE.COLOR_MYSTERIOUSDEVICE_BG1
			else:
				iv.color = HQH.COLORPALETTE_SCENE.COLOR_MYSTERIOUSDEVICE_BG2

func ShowOutline():
	SetShowNormal(false)

func HideOutline():
	SetShowNormal(true)
