extends Button
class_name CommonButton

var m_IsPlayAudio_Pressed: bool = true
var m_IsFirstHovered: bool = false

var m_PressedAudioType: int = AudioManager.BUTTON_PRESSED_AUDIO_TYPE.NONE

var m_IsHadSetPressedTrue: bool = false
var m_IsHadSetPressedTrueCount: int = 0
const COLORRECTPRESSED_NAME: String = "colorRectPressed"
var m_ColorRectPressed: ColorRect = null

const COMMONLABELLEFT_NAME: String = "commonLabelLeft"
var m_CommonLabelLeft:CommonLabel = null

func _ready():
	UIManager.SetNewStyleBoxFlat(self, "normal", UIManager.COMMONBUTTON_STYLE.STYLEBOXFLAT_NORMAL_BG_COLOR, UIManager.COMMONBUTTON_STYLE.STYLEBOXFLAT_NORMAL_BORDER_WIDTH, UIManager.COMMONBUTTON_STYLE.STYLEBOXFLAT_NORMAL_BORDER_COLOR, UIManager.COMMONBUTTON_STYLE.STYLEBOXFLAT_NORMAL_CORNER_RADIUS)
	UIManager.SetNewStyleBoxFlat(self, "hover", UIManager.COMMONBUTTON_STYLE.STYLEBOXFLAT_HOVER_BG_COLOR, UIManager.COMMONBUTTON_STYLE.STYLEBOXFLAT_HOVER_BORDER_WIDTH, UIManager.COMMONBUTTON_STYLE.STYLEBOXFLAT_HOVER_BORDER_COLOR, UIManager.COMMONBUTTON_STYLE.STYLEBOXFLAT_HOVER_CORNER_RADIUS)
	UIManager.SetNewStyleBoxFlat(self, "pressed", UIManager.COMMONBUTTON_STYLE.STYLEBOXFLAT_PRESSED_BG_COLOR, UIManager.COMMONBUTTON_STYLE.STYLEBOXFLAT_PRESSED_BORDER_WIDTH, UIManager.COMMONBUTTON_STYLE.STYLEBOXFLAT_PRESSED_BORDER_COLOR, UIManager.COMMONBUTTON_STYLE.STYLEBOXFLAT_PRESSED_CORNER_RADIUS)
	UIManager.SetNewStyleBoxFlat(self, "focus", UIManager.COMMONBUTTON_STYLE.STYLEBOXFLAT_FOCUS_BG_COLOR, UIManager.COMMONBUTTON_STYLE.STYLEBOXFLAT_FOCUS_BORDER_WIDTH, UIManager.COMMONBUTTON_STYLE.STYLEBOXFLAT_FOCUS_BORDER_COLOR, UIManager.COMMONBUTTON_STYLE.STYLEBOXFLAT_FOCUS_CORNER_RADIUS)
	
	self.add_color_override("font_color", UIManager.COMMONBUTTON_STYLE.FONT_COLOR)
	self.add_color_override("font_color_hover", UIManager.COMMONBUTTON_STYLE.FONT_COLOR_HOVER)
	self.add_color_override("font_color_pressed", UIManager.COMMONBUTTON_STYLE.FONT_COLOR_PRESSED)
	
	UIManager.SetDynamicFontProperties(self)
	
	if self.has_node(COLORRECTPRESSED_NAME):
		m_ColorRectPressed = self.get_node(COLORRECTPRESSED_NAME)
		if is_instance_valid(m_ColorRectPressed):
			m_ColorRectPressed.color = UIManager.COMMONBUTTON_STYLE.STYLEBOXFLAT_PRESSED_BG_COLOR
			m_ColorRectPressed.visible = false
	
	if self.has_node(COMMONLABELLEFT_NAME):
		m_CommonLabelLeft = self.get_node(COMMONLABELLEFT_NAME)

func SetButtonText(textString: String):
	self.text = textString

func SetPressedAudioType(pressedAudioType: int):
	m_PressedAudioType = pressedAudioType

func _pressed():
	if m_IsPlayAudio_Pressed:
		AudioManager.ButtonPressedPlayByType(m_PressedAudioType)

func SetPlayAudio_Pressed_false():
	m_IsPlayAudio_Pressed = false

func _process(_delta: float):
	if is_hovered():
		if not m_IsFirstHovered:
			m_IsFirstHovered = true
			
			AudioManager.PlayByName_ButtonHover()
	else:
		m_IsFirstHovered = false
	
	if m_IsHadSetPressedTrue:
		m_IsHadSetPressedTrueCount += 1
		if UIManager.BUTTON_PRESSED_TRUE_COUNT_STEP < m_IsHadSetPressedTrueCount:
			m_IsHadSetPressedTrue = false
			m_IsHadSetPressedTrueCount = 0
			
			m_ColorRectPressed.visible = false

func SetPressedTrue():
	m_ColorRectPressed.visible = true
	self._pressed()
	
	m_IsHadSetPressedTrue = true
	m_IsHadSetPressedTrueCount = 0

func SetLeftText(s: String):
	if is_instance_valid(m_CommonLabelLeft):
		m_CommonLabelLeft.text = s
