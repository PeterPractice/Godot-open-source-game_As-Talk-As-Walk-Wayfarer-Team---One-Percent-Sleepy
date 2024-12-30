extends Node

const BGMUSIC_PITCH_SCALE_INIT: float = HQH.SCALE_INIT
const BGMUSIC_PITCH_SCALE_MIN: float = HQH.SCALE_MIN
const BGMUSIC_PITCH_SCALE_MAX: float = HQH.SCALE_MAX

enum BUTTON_PRESSED_AUDIO_TYPE {
	NONE,
	ITEM_PRESSED,
	INTERACTION,
	PLAYCHESS,
	JOURNALRECORD,
	BAG,
}

onready var m_BGMusic: AudioStreamPlayer = AudioStreamPlayer.new()
const SOUND_EFFECT_NUMBER_MAX: int = 16
var m_SoundEffectArray: Array = []

var m_BGMusic_CurrentValue: float = HQH.AUDIO_MIN_VALUE
var m_BGMusic_EndValue: float = HQH.MUSIC_VALUE_DEFAULT
var m_BGMusic_TimeOfDuration: float = 5
var m_BGMusic_IsPrint_StartEndCurrentValue: bool = false
var BGMUSIC_WAITTIMERSTEP_MIN: int = 3 * 60 # in seconds
var BGMUSIC_WAITTIMERSTEP_MAX: int = 10 * 60 # in seconds
var m_BGMusic_WaitTimerStep: float = 0.0
var m_BGMusic_WaitTimer: float = 0.0

func _ready():
	self.add_child(m_BGMusic)
	for i in SOUND_EFFECT_NUMBER_MAX:
		var soundEffect: AudioStreamPlayer = AudioStreamPlayer.new()
		m_SoundEffectArray.append(soundEffect)
		self.add_child(soundEffect)
	
	var musicIsMute: bool = SaveGameManager.GetSaveData_option_musicIsMute()
	var musicValue: int = 0
	if not musicIsMute:
		musicValue = SaveGameManager.GetSaveData_option_musicValue()
	
	SetVolumeSize_Music(musicValue)
	
	var soundEffectIsMute: bool = SaveGameManager.GetSaveData_option_soundEffectIsMute()
	var soundEffectValue: int = 0
	if not soundEffectIsMute:
		soundEffectValue = SaveGameManager.GetSaveData_option_soundEffectValue()
	
	SetVolumeSize_SoundEffect(soundEffectValue)

func _process(delta: float):
	if SceneManager.GetIsInBootScene():
		return
	
	if SceneManager.GetIsBeginChangeToScene():
		return
	
	if m_BGMusic.playing:
		var BGMusic_DifferentValue: float = m_BGMusic_EndValue - m_BGMusic_CurrentValue
		if HQH.FLOAT_EPSILON < BGMusic_DifferentValue:
			if m_BGMusic_IsPrint_StartEndCurrentValue:
				if HQH.AUDIO_MIN_VALUE == m_BGMusic_CurrentValue:
					HQH.Log("Start change m_BGMusic_CurrentValue: %s" % m_BGMusic_CurrentValue)
			
			var BGMusic_StepValue: float = BGMusic_DifferentValue * (delta / m_BGMusic_TimeOfDuration)
			SetVolumeSize_BGMusic_CurrentValue(m_BGMusic_CurrentValue + BGMusic_StepValue)
			
			if m_BGMusic_IsPrint_StartEndCurrentValue:
				BGMusic_DifferentValue = m_BGMusic_EndValue - m_BGMusic_CurrentValue
				if not(HQH.FLOAT_EPSILON < BGMusic_DifferentValue):
					HQH.Log("End change m_BGMusic_CurrentValue: %s" % m_BGMusic_CurrentValue)
	else:
		if m_BGMusic.stream:
			m_BGMusic_WaitTimer += delta
			if m_BGMusic_WaitTimerStep < m_BGMusic_WaitTimer:
				CheckPlayBGMusic()

func StopBGMusic():
	HQH.Log("StopBGMusic")
	
	m_BGMusic.stop()

func CheckPlayBGMusic(isForcePlayBGMusic: bool = false):
	var isCanPlayBGMusic: bool = HQH.RandomBool()
#	var sceneClinkerValleyInfo: Dictionary = UIManager.GetSceneClinkerValleyInfo()
#	if isForcePlayBGMusic or sceneClinkerValleyInfo.isCloseEye:
	if isForcePlayBGMusic:
		isCanPlayBGMusic = true
	
	if isCanPlayBGMusic:
		PlayBGMusic()
	
	m_BGMusic_WaitTimerStep = HQH.RandomModRange(BGMUSIC_WAITTIMERSTEP_MIN, BGMUSIC_WAITTIMERSTEP_MAX)
	m_BGMusic_WaitTimer = 0.0

func PlayBGMusic():
	HQH.Log("PlayBGMusic")
	
	SetVolumeSize_BGMusic_CurrentValue(HQH.AUDIO_MIN_VALUE)
	m_BGMusic.play()

func PlayByName(audioName: String, soundEffectArrayIndex: int = -1, isForcePlayBGMusic: bool = false):
#	HQH.Log("PlayByName, audioName: %s, soundEffectArrayIndex: %s" % [audioName, soundEffectArrayIndex])
	
	if audioName.empty():
		HQH.Log("PlayByName, audioName is empty")
		
		return
	
	var preloadResource: Resource = TableManager.Get_PRELOAD_RESOURCE_MAP(audioName)
	var audioInfo: Dictionary = TableManager.GetInfoByName_AUDIO_INFO_LIST(audioName)
	if audioInfo.empty():
		return
	
	if IsBGMusic(audioInfo):
		preloadResource.loop = false
		m_BGMusic.set_stream(preloadResource)
		HQH.Log("CheckPlayBGMusic, audioName: %s, isForcePlayBGMusic: %s" % [audioName, isForcePlayBGMusic])
		CheckPlayBGMusic(isForcePlayBGMusic)
	else:
		var isFoundSoundEffect: bool = false
		var soundEffect: AudioStreamPlayer = null
		HQH.CheckLessThanMaxNumber("PlayByName, soundEffectArrayIndex", SOUND_EFFECT_NUMBER_MAX, soundEffectArrayIndex)
		if 0 <= soundEffectArrayIndex:
			isFoundSoundEffect = true
			soundEffect = m_SoundEffectArray[soundEffectArrayIndex]
		else:
			for i in SOUND_EFFECT_NUMBER_MAX:
				soundEffect = m_SoundEffectArray[i]
				if not soundEffect.playing:
#					HQH.Log("PlayByName, isFoundSoundEffect i: %s" % i)
					isFoundSoundEffect = true
					soundEffect = m_SoundEffectArray[i]
					
					break
		
		if isFoundSoundEffect:
			preloadResource.loop = false
			soundEffect.set_stream(preloadResource)
#			HQH.Log("PlayByName, soundEffect.stream.get_length(): %s" % soundEffect.stream.get_length())
			soundEffect.play()
#		else:
#			HQH.AssertLog("PlayByName, not isFoundSoundEffect")

func PlayByIndex(index: int):
	var audioName: String = TableManager.GetNameByIndex_AUDIO_INFO_LIST_keys(index)
	if not audioName.empty():
		PlayByName(audioName)

func IsBGMusic(audioInfo: Dictionary) -> bool:
	if audioInfo.empty():
		return false
	
	if not audioInfo.has("isBGMusic"):
		return false
	
	return audioInfo.isBGMusic

func VolumeSizeToVolumeDb(volumeSize: int) -> float:
	return linear2db(float(volumeSize) / float(HQH.AUDIO_MAX_VALUE))
	
func SetVolumeSize_Music(volumeSize: int):
	var volumeSizeTemp: int = GetClampVolumeSize(volumeSize)
	m_BGMusic_EndValue = volumeSizeTemp
	SetVolumeSize_BGMusic_CurrentValue(volumeSizeTemp)

func SetVolumeSize_SoundEffect(volumeSize: int):
	var volumeSizeTemp: int = GetClampVolumeSize(volumeSize)
	var volume_db: float = VolumeSizeToVolumeDb(volumeSizeTemp)
	for i in SOUND_EFFECT_NUMBER_MAX:
		var soundEffect: AudioStreamPlayer = m_SoundEffectArray[i]
		soundEffect.volume_db = volume_db

func SetVolumeSize_BGMusic_CurrentValue(volumeSize: float):
	m_BGMusic_CurrentValue = volumeSize
	m_BGMusic.volume_db = VolumeSizeToVolumeDb(int(m_BGMusic_CurrentValue))

func GetClampVolumeSize(volumeSize: int) -> int:
	return int(clamp(volumeSize, HQH.AUDIO_MIN_VALUE, HQH.AUDIO_MAX_VALUE))

func SetBGMusic_pitch_scale(pitch_scale: float):
	m_BGMusic.pitch_scale = clamp(pitch_scale, BGMUSIC_PITCH_SCALE_MIN, BGMUSIC_PITCH_SCALE_MAX)

func SetBGMusic_pitch_scale_Init():
	SetBGMusic_pitch_scale(BGMUSIC_PITCH_SCALE_INIT)

func PlayByName_ButtonPressed(soundEffectArrayIndex: int = -1):
	PlayByName("Audio_projector-button-push-6258_4", soundEffectArrayIndex)

func PlayByName_ButtonHover():
	PlayByName("Audio_fast-simple-chop-5-6270")

func ButtonPressedPlayByType(buttonPressedAudioType: int):
	match buttonPressedAudioType:
		BUTTON_PRESSED_AUDIO_TYPE.ITEM_PRESSED:
			PlayByName_ButtonItemPressed()
		
		BUTTON_PRESSED_AUDIO_TYPE.INTERACTION:
			PlayByName_Interaction()
		
		BUTTON_PRESSED_AUDIO_TYPE.PLAYCHESS:
			PlayByName_PlayChess()
		
		BUTTON_PRESSED_AUDIO_TYPE.JOURNALRECORD:
			PlayByName_JournalRecord()
		
		BUTTON_PRESSED_AUDIO_TYPE.BAG:
			PlayByName_Bag()
		
		_:
			PlayByName_ButtonPressed()

func PlayByName_ButtonItemPressed():
	PlayByName("Audio_065594_coach-whistle-88613_2")

func PlayByName_Interaction():
	PlayByName("Audio_grunt-106134")

func PlayByName_PlayChess():
	PlayByName("Audio_ceramic_mug_cup-31808_2")

func PlayByName_JournalRecord():
	PlayByName("Audio_turning-pages-in-a-book-96504_2")

func PlayByName_Bag():
	PlayByName("Audio_zipping-pencil-case-37454_2")

func PlayByName_PlayChessDiceChange():
	PlayByName("Audio_dice_shake-96201")

func PlayByName_PlayChessSuccess():
	PlayByName("Audio_hybrid-monster-growl-90325")

func PlayByName_PlayChessFailure():
	PlayByName("Audio_stingers-001-6294")

func PlayByName_NavigationBegin():
	PlayByName("Audio_steps-in-corridor-104456_2")

func PlayByName_OpenDoor():
	PlayByName("Audio_door-open-close-45475_2")

func PlayByName_OpenHomeDoor():
	PlayByName("Audio_dorm-door-opening-6038")

func PlayByName_CloseDoor():
	PlayByName("Audio_door-opening-and-closing-18398_2")

func PlayByName_ContinueGame():
	PlayByName("Audio_heavy-beam-weapon-7052_2")

func PlayByName_NewGame():
	PlayByName("Audio_big-impact-7054")

func PlayByName_WeFinallyFound():
	PlayByName("Audio_endless-beauty-main-11545")

func PlayByName_SheepLabelNumber():
	PlayByName(TableManager.GetAudioSoundEffectSheepLabelNumberName())

func PlayByName_Whoosh():
	PlayByName(TableManager.GetAudioSoundEffectWhooshName())

func PlayByName_Increase_NumberingRodCount():
	PlayByName("Audio_SoundEffect_CoinCollectRetro8-bit_2")

func PlayByName_Decrease_NumberingRodCount():
	PlayByName("Audio_SoundEffect_OfficeVendingMachineCoinReturn_2")
