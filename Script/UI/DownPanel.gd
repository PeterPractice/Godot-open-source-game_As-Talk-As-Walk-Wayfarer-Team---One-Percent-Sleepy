extends "res://Script/UI/CommonUI/CommonPanel.gd"

# JournalRecord
const JOURNALRECORD_LINE_MAX: int = 400 # 400
onready var commonRichTextLabelJournalRecord = $controlDown/controlJournalRecord/commonRichTextLabelJournalRecord
onready var commonTextureButtonClear1 = $controlDown/controlJournalRecord/commonTextureButtonClear1
onready var commonTextureButtonGoTop1 = $controlDown/controlJournalRecord/commonTextureButtonGoTop1
onready var commonTextureButtonGoBottom1 = $controlDown/controlJournalRecord/commonTextureButtonGoBottom1

# Bag
onready var controlBagButtonList = $controlDown/controlBag/controlBagButtonList
var m_ControlBagButtonListCurrentSelectIndex = -1 # -1: no bag button be selected. [0, controlBagButtonList.size()): selected bag button index.
onready var commonBG2Bag = $controlDown/commonBG2Bag
onready var commonBG2Bag2 = $controlDown/commonBG2Bag2
onready var commonTextureButtonBag1 = $controlDown/controlBag/commonTextureButtonBag1
onready var textureRectBagSelected = $controlDown/controlBag/textureRectBagSelected
var m_IsShowDetailedBag: bool = false

# Interaction
onready var commonTextureButtonInteraction1 = $controlDown/controlInteraction/commonTextureButtonInteraction1

# BagUse
onready var commonButton13BagUse = $controlDown/controlBagUse/commonButton13BagUse
onready var commonButton13Discard = $controlDown/controlBagUse/commonButton13Discard

# WrangleDialog
onready var controlWrangleDialog = $controlWrangleDialog
onready var commonButtonYes = $controlWrangleDialog/commonButtonYes
onready var commonButtonNo = $controlWrangleDialog/commonButtonNo
var m_IsHadSetHideWrangleDialog: bool = false
var m_IsHadSetHideWrangleDialogCount: int = 0

func _ready():
	UIManager.DownPanel_OnReady()
	
	var firstString: String = TableManager.GetAffixKeyRandomString("SLOGAN_NEW_DAY_")
	commonRichTextLabelJournalRecord.AddText(firstString)
	
	commonTextureButtonBag1.SetLeftText(TableManager.INPUT_KEY_LETTER_MAP.KEY_B)
	commonTextureButtonBag1.SetPressedAudioType(AudioManager.BUTTON_PRESSED_AUDIO_TYPE.BAG)
	for i in controlBagButtonList.get_child_count():
		var bagButton: CommonButtonBuff = controlBagButtonList.get_child(i)
		bagButton.SetUIInputActionEventType("COMMONBUTTONBUFF_TEXTUREBUTTON1_PRESSED_EVENT%s" % (i + 1))
	
	SetBag()
	SetCommonTextureButtonBag1Visible()
	
	SetCommonTextureButtonInteraction1Visible(false)
	
	HideWrangleDialog()
	
	commonTextureButtonInteraction1.SetPressedAudioType(AudioManager.BUTTON_PRESSED_AUDIO_TYPE.INTERACTION)
	commonTextureButtonInteraction1.SetLeftText(TableManager.INPUT_KEY_LETTER_MAP.KEY_E)

	SetText()

func SetText():
	commonButtonYes.SetButtonText(TableManager.GetLanguageString("PANEL_BUTTON_YES"))
	commonButtonYes.SetLeftText(TableManager.INPUT_KEY_LETTER_MAP.KEY_Y)
	commonButtonNo.SetButtonText(TableManager.GetLanguageString("PANEL_BUTTON_NO"))
	commonButtonNo.SetLeftText(TableManager.INPUT_KEY_LETTER_MAP.KEY_N)
	commonTextureButtonInteraction1.SetCenterText(TableManager.GetLanguageString("DOWNPANEL_INTERACTION"))
	commonButton13BagUse.SetButtonText(TableManager.GetLanguageString("DOWNPANEL_CONTROLBAGUSE_COMMONBUTTON13BAGUSE"))
	commonButton13Discard.SetButtonText(TableManager.GetLanguageString("DOWNPANEL_CONTROLBAGUSE_COMMONBUTTON13DISCARD"))

func _input(event: InputEvent):
	if SceneManager.GetIsInBootScene():
		return
	
	if SceneManager.GetIsBeginChangeToScene():
		return
	
	var panelRectangle: Rect2 = Rect2()
	if not UIManager.GetIsUIPanelHadConsumed_Event_FocusClick():
		panelRectangle = Rect2(commonTextureButtonClear1.rect_position, commonTextureButtonClear1.rect_size)
		UIManager.CheckAndSet_IsUIPanelHadConsumed_Event_FocusClick(event, self, panelRectangle)
	
	if not UIManager.GetIsUIPanelHadConsumed_Event_FocusClick():
		panelRectangle = Rect2(commonTextureButtonGoTop1.rect_position, commonTextureButtonGoTop1.rect_size)
		UIManager.CheckAndSet_IsUIPanelHadConsumed_Event_FocusClick(event, self, panelRectangle)
	
	if not UIManager.GetIsUIPanelHadConsumed_Event_FocusClick():
		panelRectangle = Rect2(commonTextureButtonGoBottom1.rect_position, commonTextureButtonGoBottom1.rect_size)
		UIManager.CheckAndSet_IsUIPanelHadConsumed_Event_FocusClick(event, self, panelRectangle)
	
	if not UIManager.GetIsUIPanelHadConsumed_Event_FocusClick():
		if commonBG2Bag2.visible:
			panelRectangle = Rect2(commonBG2Bag2.rect_position, commonBG2Bag2.rect_size)
			UIManager.CheckAndSet_IsUIPanelHadConsumed_Event_FocusClick(event, self, panelRectangle)
		elif commonBG2Bag.visible:
			panelRectangle = Rect2(commonBG2Bag.rect_position, commonBG2Bag.rect_size)
			UIManager.CheckAndSet_IsUIPanelHadConsumed_Event_FocusClick(event, self, panelRectangle)
	
	if not UIManager.GetIsUIPanelHadConsumed_Event_FocusClick():
		if commonTextureButtonInteraction1.visible:
			panelRectangle = Rect2(commonTextureButtonInteraction1.rect_position, commonTextureButtonInteraction1.rect_size)
			UIManager.CheckAndSet_IsUIPanelHadConsumed_Event_FocusClick(event, self, panelRectangle)
	
	if not UIManager.GetIsUIPanelHadConsumed_Event_FocusClick():
		if commonButton13BagUse.visible:
			panelRectangle = Rect2(commonButton13BagUse.rect_position, commonButton13BagUse.rect_size)
			UIManager.CheckAndSet_IsUIPanelHadConsumed_Event_FocusClick(event, self, panelRectangle)
	
	if not UIManager.GetIsUIPanelHadConsumed_Event_FocusClick():
		if commonButton13Discard.visible:
			panelRectangle = Rect2(commonButton13Discard.rect_position, commonButton13Discard.rect_size)
			UIManager.CheckAndSet_IsUIPanelHadConsumed_Event_FocusClick(event, self, panelRectangle)

func _process(_delta: float):
	if m_IsHadSetHideWrangleDialog:
		m_IsHadSetHideWrangleDialogCount += 1
		if UIManager.BUTTON_PRESSED_TRUE_COUNT_STEP < m_IsHadSetHideWrangleDialogCount:
			m_IsHadSetHideWrangleDialog = false
			m_IsHadSetHideWrangleDialogCount = 0
			
			HideWrangleDialog()

func AddJournalRecord(s: String):
	commonRichTextLabelJournalRecord.AddNewLine()
	commonRichTextLabelJournalRecord.AddText(s)
	
	var lineCount: int = commonRichTextLabelJournalRecord.GetLineCount()
	if JOURNALRECORD_LINE_MAX < lineCount:
		commonRichTextLabelJournalRecord.RemoveLine(0)

func _on_commonTextureButtonBag1_pressed():
	HQH.Log("_on_commonTextureButtonBag1_pressed")
	
	commonTextureButtonBag1.release_focus()
	
	if UIManager.GetIsInPlayChess():
		UIManager.DownPanel_AddJournalRecordWithStringKey("IT_IS_PLAY_CHESS_YOU_CAN_NOT_OPERATE")
		
		return
	
	m_IsShowDetailedBag = !m_IsShowDetailedBag
	SetBag()

func GetIsShowDetailedBag() -> bool:
	return m_IsShowDetailedBag

func SetCommonTextureButtonBag1Visible():
	if SaveGameManager.IsGoodsUsedHas_Bag():
		commonTextureButtonBag1.visible = true
		commonBG2Bag.visible = true
	else:
		commonTextureButtonBag1.visible = false
		commonBG2Bag.visible = false

func GetCommonTextureButtonBag1Visible() -> bool:
	return commonTextureButtonBag1.visible

func CommonTextureButtonBag1_SetPressedTrue():
	commonTextureButtonBag1.SetPressedTrue()

func CommonButtonYes_SetPressedTrue():
	commonButtonYes.SetPressedTrue()

func CommonButtonNo_SetPressedTrue():
	commonButtonNo.SetPressedTrue()

func CommonTextureButtonInteraction1_SetPressedTrue():
	commonTextureButtonInteraction1.SetPressedTrue()

func IsShowOriginalBagNumber(goodsTypeID: int ) -> bool:
	return (TableManager.GOODSTYPEID_NUMBERINGROD == goodsTypeID)

func SetBag():
	var currentBagDataLength: int = UIManager.DownPanel_GetBagDataLength()
	var bagButtonChildrenCount: int = controlBagButtonList.get_child_count()
	if bagButtonChildrenCount != currentBagDataLength:
		HQH.AssertLog("bagButtonChildrenCount: %s != currentBagDataLength: %s" % [bagButtonChildrenCount, currentBagDataLength])
		
		return
	
	if m_IsShowDetailedBag:
		commonBG2Bag2.visible = true
	else:
		commonBG2Bag2.visible = false
	
	for i in bagButtonChildrenCount:
		var bagButton: CommonButtonBuff = controlBagButtonList.get_child(i)
		if m_IsShowDetailedBag:
			bagButton.visible = true
			
			var bag1Data: Dictionary = UIManager.DownPanel_GetBagDataByIndex(i)
			if bag1Data.isValidBag:
				bagButton.SetTextureRectNormal(bag1Data.bagResourceName)
				if IsShowOriginalBagNumber(bag1Data.goodsTypeID):
					bagButton.SetRightText(String(bag1Data.bagNumber))
				else:
					if 1 < bag1Data.bagNumber:
						bagButton.SetRightText(String(bag1Data.bagNumber))
					else:
						bagButton.SetRightText("")
				bagButton.SetCD(bag1Data.bagCDStartTimeInMilliseconds, bag1Data.bagCDLengthTimeInMilliseconds)
				bagButton.SetGoodsTypeID(bag1Data.goodsTypeID)
			else:
				bagButton.SetTextureRectNormal("")
				bagButton.SetRightText("")
				bagButton.SetCD(0, 0)
				bagButton.SetGoodsTypeID(0)
		else:
			bagButton.visible = false
	
	SetBagSelectedVisibleAndIndexFalse()

func GetCommonTextureButtonInteraction1Visible() -> bool:
	return commonTextureButtonInteraction1.visible

func SetCommonTextureButtonInteraction1Visible(v: bool):
	commonTextureButtonInteraction1.visible = v

func _on_commonTextureButtonClear1_pressed():
	commonTextureButtonClear1.release_focus()
	
	commonRichTextLabelJournalRecord.clear()
	commonRichTextLabelJournalRecord.AddText(TableManager.GetAffixKeyRandomString("DOWNPANEL_COMMONRICHTEXTLABELJOURNALRECORD_CLEAR_"))

func _on_commonTextureButtonGoTop1_pressed():
	commonTextureButtonGoTop1.release_focus()
	
	commonRichTextLabelJournalRecord.scroll_to_line(0)

func _on_commonTextureButtonGoBottom1_pressed():
	commonTextureButtonGoBottom1.release_focus()
	
	commonRichTextLabelJournalRecord.scroll_to_line(commonRichTextLabelJournalRecord.GetLineCount() - 1)

func _on_commonButton13BagUse_pressed():
	HQH.Log("_on_commonButton13BagUse_pressed")
	
	commonButton13BagUse.release_focus()
	
	UIManager.DownPanel_on_commonButton13BagUse_pressed(m_ControlBagButtonListCurrentSelectIndex)

func _on_commonButton13Discard_pressed():
	HQH.Log("_on_commonButton13Discard_pressed")
	
	commonButton13Discard.release_focus()
	SetBagSelectedVisible(false)
	
	UIManager.DownPanel_on_commonButton13Discard_pressed(m_ControlBagButtonListCurrentSelectIndex)

func GetBagSelectedVisible() -> bool:
	return textureRectBagSelected.visible

func SetBagSelectedVisibleAndIndexFalse():
	SetBagSelectedVisibleAndIndex(false, -1)

func SetBagSelectedVisible(v: bool):
	commonButton13BagUse.visible = v
	commonButton13Discard.visible = v

func SetBagSelectedVisibleAndIndex(v: bool, index: int):
	textureRectBagSelected.visible = v
	SetBagSelectedVisible(v)
	if textureRectBagSelected.visible:
		m_ControlBagButtonListCurrentSelectIndex = index
		
		var bagButton: CommonButtonBuff = controlBagButtonList.get_child(index)
		textureRectBagSelected.rect_global_position = bagButton.rect_global_position
	else:
		m_ControlBagButtonListCurrentSelectIndex = -1

func SetBagButtonListPressedTrue():
	SetBagButtonListPressed(m_ControlBagButtonListCurrentSelectIndex)

func SetBagButtonListPressed(index: int):
	HQH.Log("SetBagButtonListPressed, index: %s" % index)
	
	if (0 <= index) and (controlBagButtonList.get_child_count() > index):
		if index == m_ControlBagButtonListCurrentSelectIndex:
			SetBagSelectedVisibleAndIndexFalse()
		else:
			SetBagSelectedVisibleAndIndex(true, index)

func _on_commonTextureButtonClear1_mouse_entered():
	UIManager.UpNamePanel_ShowTipsWithStringKey("CLEAR_BUTTON")

func _on_commonTextureButtonClear1_mouse_exited():
	UIManager.UpNamePanel_HideTips()

func _on_commonTextureButtonGoTop1_mouse_entered():
	UIManager.UpNamePanel_ShowTipsWithStringKey("TOP_BUTTON")

func _on_commonTextureButtonGoTop1_mouse_exited():
	UIManager.UpNamePanel_HideTips()

func _on_commonTextureButtonGoBottom1_mouse_entered():
	UIManager.UpNamePanel_ShowTipsWithStringKey("BOTTOM_BUTTON")

func _on_commonTextureButtonGoBottom1_mouse_exited():
	UIManager.UpNamePanel_HideTips()

func _on_commonTextureButtonBag1_mouse_entered():
	UIManager.UpNamePanel_ShowTipsWithStringKey("NAME_AVATAR_30")

func _on_commonTextureButtonBag1_mouse_exited():
	UIManager.UpNamePanel_HideTips()

func _on_commonTextureButtonInteraction1_pressed():
	HQH.Log("_on_commonTextureButtonInteraction1_pressed")
	
	commonTextureButtonInteraction1.release_focus()
	
	UIManager.DownPanel_on_commonTextureButtonInteraction1_pressed()

func SetWrangleDialogVisible(v: bool):
	controlWrangleDialog.visible = v

func GetWrangleDialogVisible() -> bool:
	return controlWrangleDialog.visible

func ShowWrangleDialog():
	SetWrangleDialogVisible(true)

func HideWrangleDialog():
	SetWrangleDialogVisible(false)

func _on_commonButtonYes_pressed():
	HQH.Log("_on_commonButtonYes_pressed")
	
	commonButtonYes.release_focus()
#	HideWrangleDialog()
	m_IsHadSetHideWrangleDialog = true
	m_IsHadSetHideWrangleDialogCount = 0
	
	UIManager.DownPanel_OnWrangleDialogButtonPressed(true)

func _on_commonButtonNo_pressed():
	HQH.Log("_on_commonButtonNo_pressed")
	
	commonButtonNo.release_focus()
#	HideWrangleDialog()
	m_IsHadSetHideWrangleDialog = true
	m_IsHadSetHideWrangleDialogCount = 0
	
	UIManager.DownPanel_OnWrangleDialogButtonPressed(false)
