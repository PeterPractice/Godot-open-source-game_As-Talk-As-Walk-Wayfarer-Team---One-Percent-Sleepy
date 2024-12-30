extends "res://Script/UI/CommonUI/CommonPanel.gd"

onready var controlUpName = $controlUpName
onready var controlUpName_titleLabel38Name = $controlUpName/titleLabel38Name
onready var controlUpName_commonHSeparator1 = $controlUpName/commonHSeparator1
onready var controlUpName_commonHSeparator2 = $controlUpName/commonHSeparator2
onready var animationPlayerUpName = $animationPlayerUpName
onready var controlTips = $controlTips
onready var controlTips_titleLabel20Tips = $controlTips/titleLabel20Tips
onready var controlTips_commonHSeparator1 = $controlTips/commonHSeparator1
onready var controlTips_commonHSeparator2 = $controlTips/commonHSeparator2
onready var animationPlayerTips = $animationPlayerTips
onready var controlMiddleString = $controlMiddleString
onready var controlMiddleString_CommonLabel31 = $controlMiddleString/CommonLabel31
onready var animationPlayerMiddleString = $animationPlayerMiddleString
onready var commonLabel10Numbering = $controlNumbering/commonLabel10Numbering
onready var commonDiceLabelNumbering = $controlNumbering/commonDiceLabelNumbering
onready var commonLabel10Sheep = $controlNumbering/commonLabel10Sheep
onready var commonDiceLabelSheep = $controlNumbering/commonDiceLabelSheep

const PROCESS_TIME_STEP: float = 1.0
var m_ProcessTime: float = 0.0

var m_SheepNumbering: int = 0
var m_SheepCount: int = 0

func _ready():
	SetText()
	OnAnimationPlayerUpNameEnd()
	HideTips()
	HideMiddleString()
	SetNumbering()

func _process(delta: float):
	if not SceneManager.IsInGameScene():
		return
	
	m_ProcessTime += delta
	if PROCESS_TIME_STEP < m_ProcessTime:
		m_ProcessTime = 0.0
		
		SetNumbering()

func SetText():
	commonLabel10Numbering.text = TableManager.GetLanguageString("NUMBERING")
	commonLabel10Sheep.text = TableManager.GetLanguageString("NAME_AVATAR_SHEEP")

func ShowUpName(nameString: String):
	animationPlayerUpName.stop()
	
	controlUpName.visible = true
	controlUpName_titleLabel38Name.text = nameString
	var stringSize: Vector2 = controlUpName_titleLabel38Name.get_font("font").get_string_size(nameString)
	var stringSize_x_2_: float = -(stringSize.x / 2)
	var controlUpName_commonHSeparator_xOffset: int = 5 # 5
	var controlUpName_commonHSeparator_Height: int = controlUpName_commonHSeparator2.rect_size.y # 4
	controlUpName_titleLabel38Name.rect_position.x = stringSize_x_2_
	controlUpName_commonHSeparator1.rect_position.x = stringSize_x_2_ - controlUpName_commonHSeparator_xOffset
	controlUpName_commonHSeparator2.rect_position.x = stringSize_x_2_ + stringSize.x + controlUpName_commonHSeparator_Height + controlUpName_commonHSeparator_xOffset
	animationPlayerUpName.play("FadeOut")

func OnAnimationPlayerUpNameEnd():
	HQH.Log("UpNamePanel.OnAnimationPlayerUpNameEnd")
	controlUpName.visible = false

func _on_animationPlayerUpName_animation_finished(_anim_name: String):
	OnAnimationPlayerUpNameEnd()

func IsTipsVisible() -> bool:
	return controlTips.visible

func ShowTips(tipsString: String):
	animationPlayerTips.stop()
	
	controlTips.visible = true
	controlTips_titleLabel20Tips.text = tipsString
	var stringSize: Vector2 = controlTips_titleLabel20Tips.get_font("font").get_string_size(tipsString)
	var stringSize_x_2_: float = -(stringSize.x / 2)
	controlTips_titleLabel20Tips.rect_position.x = stringSize_x_2_
	controlTips_commonHSeparator1.rect_size.x = stringSize.x
	controlTips_commonHSeparator1.rect_position.x = stringSize_x_2_
	controlTips_commonHSeparator2.rect_size.x = stringSize.x
	controlTips_commonHSeparator2.rect_position.x = stringSize_x_2_
	animationPlayerTips.play("TimeEndToHide")

func HideTips():
	controlTips.visible = false

func _on_animationPlayerTips_animation_finished(_anim_name: String):
	HideTips()

func ShowMiddleString(middleString: String):
	animationPlayerMiddleString.stop()
	
	controlMiddleString.visible = true
	controlMiddleString_CommonLabel31.text = middleString
	var stringSize: Vector2 = controlMiddleString_CommonLabel31.get_font("font").get_string_size(middleString)
	var stringSize_x_2_: float = -(stringSize.x / 2)
	controlMiddleString_CommonLabel31.rect_position.x = stringSize_x_2_
	animationPlayerMiddleString.play("TimeEndToHide")

func HideMiddleString():
	controlMiddleString.visible = false

func _on_animationPlayerMiddleString_animation_finished(_anim_name: String):
	HideMiddleString()

func SetNumbering():
	var sheepNumbering: int = AvatarManager.GetSheepNumbering()
	if (0 == m_SheepNumbering) or (sheepNumbering != m_SheepNumbering):
		m_SheepNumbering = sheepNumbering
		commonDiceLabelNumbering.text = String(m_SheepNumbering)
	
	var sheepCount: int = AvatarManager.GetSheepCount()
	if (0 == m_SheepCount) or (sheepCount != m_SheepCount):
		m_SheepCount = sheepCount
		
		var sheepCountMax: int = AvatarManager.GetSheepCountMax()
		var sheepCountString: String = ""
		if sheepCountMax > m_SheepCount:
			sheepCountString = "%s>>>%s" % [m_SheepCount, sheepCountMax]
		else:
			sheepCountString = String(m_SheepCount)
		
		commonDiceLabelSheep.text = sheepCountString
