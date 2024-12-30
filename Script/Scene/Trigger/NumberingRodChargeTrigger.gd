extends Node2D

onready var colorRectBG = $colorRectBG
onready var commonDiceLabel14Number = $commonDiceLabel36Number

var m_IsWhiteWord: bool = false
var m_NumberInt: int = 0
const PROCESS_DELTA_STEP: float = 1.0
var m_ProcessDelta: float = 0.0
var m_AreaEnteredAvatar: KinematicBody2DAvatarBase = null

func _ready():
	SetNumber()

func _process(delta: float):
	m_ProcessDelta = m_ProcessDelta + delta
	if PROCESS_DELTA_STEP < m_ProcessDelta:
		m_ProcessDelta = 0.0
		
		SetNumber()
		SetNumberingRodCount()

func SetWordColor(isWhiteWord: bool):
	if isWhiteWord:
		colorRectBG.color = HQH.COLORPALETTE_UI.FONT_COLOR4
		commonDiceLabel14Number.SetColor(HQH.COLORPALETTE_UI.FONT_COLOR1)
	else:
		colorRectBG.color = HQH.COLORPALETTE_UI.FONT_COLOR1
		commonDiceLabel14Number.SetColor(HQH.COLORPALETTE_UI.FONT_COLOR4)

func SetNumber():
	m_IsWhiteWord = !m_IsWhiteWord
	SetWordColor(m_IsWhiteWord)
	m_NumberInt = HQH.RandomD10()
	commonDiceLabel14Number.text = String(m_NumberInt)

func SetNumberingRodCount():
	if m_AreaEnteredAvatar:
		if m_IsWhiteWord:
			UIManager.DownPanel_Bag_Decrease_NumberingRodCount(m_NumberInt)
			AudioManager.PlayByName_Decrease_NumberingRodCount()
		else:
			UIManager.DownPanel_Bag_Increase_NumberingRodCount(m_NumberInt)
			AudioManager.PlayByName_Increase_NumberingRodCount()

func _on_area2D1_area_entered(area: Area2DInteraction):
	if not area:
		return
	
	if not area.IsArea2DInteraction():
		return
	
	if not SaveGameManager.IsBagHas_NumberingRod():
		UIManager.DownPanel_AddJournalRecordWithStringKey("NO_NUMBERINGROD")
		AudioManager.PlayByName_Decrease_NumberingRodCount()
		
		return
	
	var avatarBase: KinematicBody2DAvatarBase = area.get_parent()
	if AvatarManager.IsPlayerNPC(avatarBase):
		m_AreaEnteredAvatar = avatarBase
		SetNumberingRodCount()

func _on_area2D1_area_exited(area: Area2DInteraction):
	if not area:
		return
	
	if not area.IsArea2DInteraction():
		return
	
	if not SaveGameManager.IsBagHas_NumberingRod():
		
		return
	
	var avatarBase: KinematicBody2DAvatarBase = area.get_parent()
	if AvatarManager.IsPlayerNPC(avatarBase):
		if avatarBase == m_AreaEnteredAvatar:
			m_AreaEnteredAvatar = null
