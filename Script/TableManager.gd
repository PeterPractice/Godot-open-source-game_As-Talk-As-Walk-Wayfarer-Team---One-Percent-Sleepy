extends Node

const DICTIONARYTABLE_PLACEHOLDER_BEGIN: String = "{"
const DICTIONARYTABLE_PLACEHOLDER_BEGIN_LENGTH: int = 1
const DICTIONARYTABLE_PLACEHOLDER_END: String = "}"
const DICTIONARYTABLE_PLACEHOLDER_END_LENGTH: int = 1
const DISPLAYED_LINE_BREAK: String = "\\n"
const LINE_BREAK: String = "\n"
const CHARACTER_SPACE: String = " "
const DISPLAY_TASK_NAME: String = "<%s>"
const DISPLAY_BAG_ITEM_NAME: String = "[%s]"
const DISPLAY_SCENE_NAME: String = "|%s|"
const AVATAR_PLAY_CHESS_POINTS_SHOW_NAME: String = "*%s*"
const PLAY_CHESS_COUNT_FLAG_START: String = ">"
const PLAY_CHESS_COUNT_FLAG_SUCCESS: String = "+"
const PLAY_CHESS_COUNT_FLAG_FAILURE: String = "-"

const PRELOAD_RESOURCE_MAP: Dictionary = {
# preloadResourceName: preloadResourceInfo
	# Font
	"Font":															preload("res://Font/Font.tres"),
	
	# UI
	"UI_CommonUI_CommonLabel":										preload("res://UI/CommonUI/CommonLabel.tscn"),
	"UI_StartGamePanel":											preload("res://UI/StartGamePanel.tscn"),
	"UI_LoadingScenePanel": 										preload("res://UI/LoadingScenePanel.tscn"),
	"UI_LanguagePanel":												preload("res://UI/LanguagePanel.tscn"),
	"UI_DebugInfoPanel":											preload("res://UI/DebugInfoPanel.tscn"),
	"UI_DebugMenuPanel":											preload("res://UI/DebugMenuPanel.tscn"),
	"UI_OptionPanel":												preload("res://UI/OptionPanel.tscn"),
	"UI_DownPanel":													preload("res://UI/DownPanel.tscn"),
#	"UI_TeamPanel":													preload("res://UI/TeamPanel.tscn"),
	"UI_DayNightPanel":												preload("res://UI/DayNightPanel.tscn"),
	"UI_UpNamePanel":												preload("res://UI/UpNamePanel.tscn"),
	"UI_RightSettingPanel":											preload("res://UI/RightSettingPanel.tscn"),
#	"UI_JournalRecordPanel":										preload("res://UI/JournalRecordPanel.tscn"),
#	"UI_ChessPanel4":												preload("res://UI/ChessPanel4.tscn"),
	"UI_ChessPanel1":												preload("res://UI/ChessPanel1.tscn"),
	
	# Avatar and Equip
	"Avatar_Equip_Wig1":											preload("res://Avatar/Equip/Wig1.tscn"),
	"Avatar_Equip_Wig2":											preload("res://Avatar/Equip/Wig2.tscn"),
	"Avatar_Snake1":												preload("res://Avatar/PlayerNPC/Snake1.tscn"),
	"Avatar_Dog1":													preload("res://Avatar/PlayerNPC/Dog1.tscn"),
	"Avatar_Player1":												preload("res://Avatar/PlayerNPC/Player1.tscn"),
	"Avatar_SilverCarp1":											preload("res://Avatar/PlayerNPC/SilverCarp1.tscn"),
	"Avatar_Tortoise1":												preload("res://Avatar/PlayerNPC/Tortoise1.tscn"),
	"Avatar_Snake2":												preload("res://Avatar/PlayerNPC/Snake2.tscn"),
	"Avatar_Snake3":												preload("res://Avatar/PlayerNPC/Snake3.tscn"),
	"Avatar_Turtle1":												preload("res://Avatar/PlayerNPC/Turtle1.tscn"),
	"Avatar_Angel1":												preload("res://Avatar/PlayerNPC/Angel1.tscn"),
	"Avatar_Donkey1":												preload("res://Avatar/PlayerNPC/Donkey1.tscn"),
	"Avatar_QiuYu1":												preload("res://Avatar/PlayerNPC/QiuYu1.tscn"),
	"Avatar_Clergy1":												preload("res://Avatar/PlayerNPC/Clergy1.tscn"),
	"Avatar_Monster1":												preload("res://Avatar/PlayerNPC/Monster1.tscn"),
	"Avatar_Monster2":												preload("res://Avatar/PlayerNPC/Monster2.tscn"),
	"Avatar_Monster3":												preload("res://Avatar/PlayerNPC/Monster3.tscn"),
	"Avatar_Monster4":												preload("res://Avatar/PlayerNPC/Monster4.tscn"),
	"Avatar_Monster5":												preload("res://Avatar/PlayerNPC/Monster5.tscn"),
	"Avatar_Monster6":												preload("res://Avatar/PlayerNPC/Monster6.tscn"),
	"Avatar_Monster7":												preload("res://Avatar/PlayerNPC/Monster7.tscn"),
	"Avatar_Monster8":												preload("res://Avatar/PlayerNPC/Monster8.tscn"),
	"Avatar_Monster9":												preload("res://Avatar/PlayerNPC/Monster9.tscn"),
	"Avatar_Monster10":												preload("res://Avatar/PlayerNPC/Monster10.tscn"),
	"Avatar_Monster11":												preload("res://Avatar/PlayerNPC/Monster11.tscn"),
	"Avatar_Monster12":												preload("res://Avatar/PlayerNPC/Monster12.tscn"),
	"Avatar_King":													preload("res://Avatar/PlayerNPC/King.tscn"),
	"Avatar_Queen":													preload("res://Avatar/PlayerNPC/Queen.tscn"),
	"Avatar_Sister":												preload("res://Avatar/PlayerNPC/Sister.tscn"),
	"Avatar_Housekeeper":											preload("res://Avatar/PlayerNPC/Housekeeper.tscn"),
	"Avatar_Butler":												preload("res://Avatar/PlayerNPC/Butler.tscn"),
	"Avatar_AvatarTransparent":										preload("res://Avatar/PlayerNPC/AvatarTransparent.tscn"),
	"Avatar_Sheep":													preload("res://Avatar/Sheep/Sheep.tscn"),
	"Avatar_Holly1":												preload("res://Avatar/Plant/Holly1.tscn"),
	"Avatar_DeadTree1_2":											preload("res://Avatar/Plant/DeadTree1_2.tscn"),
	"Avatar_DeadTree1_3":											preload("res://Avatar/Plant/DeadTree1_3.tscn"),
	"Avatar_DeadTree2_2":											preload("res://Avatar/Plant/DeadTree2_2.tscn"),
	"Avatar_DeadTree2_3":											preload("res://Avatar/Plant/DeadTree2_3.tscn"),
	"Avatar_Flower1":												preload("res://Avatar/Plant/Flower1.tscn"),
	"Avatar_Flower1_2":												preload("res://Avatar/Plant/Flower1_2.tscn"),
	"Avatar_Flower1_3":												preload("res://Avatar/Plant/Flower1_3.tscn"),
	"Avatar_Flower2":												preload("res://Avatar/Plant/Flower2.tscn"),
	"Avatar_Flower2_2":												preload("res://Avatar/Plant/Flower2_2.tscn"),
	"Avatar_Flower2_3":												preload("res://Avatar/Plant/Flower2_3.tscn"),
	"Avatar_Flower2_4_2":											preload("res://Avatar/Plant/Flower2_4_2.tscn"),
	"Avatar_Flower2_4_2_2":											preload("res://Avatar/Plant/Flower2_4_2_2.tscn"),
	"Avatar_Flower2_4_2_3":											preload("res://Avatar/Plant/Flower2_4_2_3.tscn"),
	"Avatar_Flower2_4_3":											preload("res://Avatar/Plant/Flower2_4_3.tscn"),
	"Avatar_Flower2_4_3_2":											preload("res://Avatar/Plant/Flower2_4_3_2.tscn"),
	"Avatar_Flower2_4_3_3":											preload("res://Avatar/Plant/Flower2_4_3_3.tscn"),
	"Avatar_Flower3_1_2":											preload("res://Avatar/Plant/Flower3_1_2.tscn"),
	"Avatar_Flower3_2_2":											preload("res://Avatar/Plant/Flower3_2_2.tscn"),
	"Avatar_Flower3_3_2":											preload("res://Avatar/Plant/Flower3_3_2.tscn"),
	"Avatar_Flower3_4_2":											preload("res://Avatar/Plant/Flower3_4_2.tscn"),
	"Avatar_Flower3_5_2":											preload("res://Avatar/Plant/Flower3_5_2.tscn"),
	"Avatar_Flower3_6_2":											preload("res://Avatar/Plant/Flower3_6_2.tscn"),
	"Avatar_Flower3_7_2":											preload("res://Avatar/Plant/Flower3_7_2.tscn"),
	"Avatar_Flower4_1_2":											preload("res://Avatar/Plant/Flower4_1_2.tscn"),
	"Avatar_Flower4_2_2":											preload("res://Avatar/Plant/Flower4_2_2.tscn"),
	"Avatar_Flower4_3_2":											preload("res://Avatar/Plant/Flower4_3_2.tscn"),
	"Avatar_Flower4_4_2":											preload("res://Avatar/Plant/Flower4_4_2.tscn"),
	"Avatar_Flower4_5_2":											preload("res://Avatar/Plant/Flower4_5_2.tscn"),
	"Avatar_Flower4_6_2":											preload("res://Avatar/Plant/Flower4_6_2.tscn"),
	"Avatar_Flower4_7_2":											preload("res://Avatar/Plant/Flower4_7_2.tscn"),
	"Avatar_OsmanthusTree1_2":										preload("res://Avatar/Plant/OsmanthusTree1_2.tscn"),
	"Avatar_OsmanthusTree1_2_2":									preload("res://Avatar/Plant/OsmanthusTree1_2_2.tscn"),
	"Avatar_Tree1_3":												preload("res://Avatar/Plant/Tree1_3.tscn"),
	"Avatar_Tree1_3_2":												preload("res://Avatar/Plant/Tree1_3_2.tscn"),
	"Avatar_Tree1_3_3":												preload("res://Avatar/Plant/Tree1_3_3.tscn"),
	"Avatar_Tree1_3_4":												preload("res://Avatar/Plant/Tree1_3_4.tscn"),
	"Avatar_Tree1_4":												preload("res://Avatar/Plant/Tree1_4.tscn"),
	"Avatar_Tree1_4_2":												preload("res://Avatar/Plant/Tree1_4_2.tscn"),
	"Avatar_Tree1_4_3":												preload("res://Avatar/Plant/Tree1_4_3.tscn"),
	"Avatar_Tree1_4_4":												preload("res://Avatar/Plant/Tree1_4_4.tscn"),
	"Avatar_Tree2_2":												preload("res://Avatar/Plant/Tree2_2.tscn"),
	"Avatar_Tree2_3":												preload("res://Avatar/Plant/Tree2_3.tscn"),
	"Avatar_Tree3_2":												preload("res://Avatar/Plant/Tree3_2.tscn"),
	"Avatar_Tree3_2_2":												preload("res://Avatar/Plant/Tree3_2_2.tscn"),
	"Avatar_Tree3_3":												preload("res://Avatar/Plant/Tree3_3.tscn"),
	"Avatar_Tree3_3_2":												preload("res://Avatar/Plant/Tree3_3_2.tscn"),
	
	# Shader
	"Shader_SpriteOutline":											preload("res://Shader/SpriteOutline.shader"),
	"Shader_XLine2":												preload("res://Shader/DiamondBasedScreenTransition_XLine2.shader"),
	"Shader_XLine3":												preload("res://Shader/DiamondBasedScreenTransition_XLine3.shader"),
	"Shader_YLine2":												preload("res://Shader/DiamondBasedScreenTransition_YLine2.shader"),
	"Shader_YLine3":												preload("res://Shader/DiamondBasedScreenTransition_YLine3.shader"),
	
	# Audio
	"Audio_DEBUG":													preload("res://Audio/Intro.ogg"),
	"Audio_big-impact-7054":										preload("res://Audio/big-impact-7054.mp3"),
	"Audio_projector-button-push-6258_4":							preload("res://Audio/projector-button-push-6258_4.mp3"),
	"Audio_fast-simple-chop-5-6270":								preload("res://Audio/fast-simple-chop-5-6270.mp3"),
	"Audio_HUB":													preload("res://Audio/chonology-of-love-6094.mp3"),
	"Audio_heavy-beam-weapon-7052_2":								preload("res://Audio/heavy-beam-weapon-7052_2.mp3"),
	"Audio_ceramic_mug_cup-31808_2":								preload("res://Audio/ceramic_mug_cup-31808_2.mp3"),
	"Audio_HALLOFMELODY":											preload("res://Audio/cinematic-space-drone-10623.mp3"),
	"Audio_STAVEAVENUE":											preload("res://Audio/ambiant-cinematic-drone-main-10526.mp3"),
	"Audio_whooo-105751":											preload("res://Audio/whooo-105751.mp3"),
	"Audio_grunt-106134":											preload("res://Audio/grunt-106134.mp3"),
	"Audio_turning-pages-in-a-book-96504_2":						preload("res://Audio/turning-pages-in-a-book-96504_2.mp3"),
	"Audio_zipping-pencil-case-37454_2":							preload("res://Audio/zipping-pencil-case-37454_2.mp3"),
	"Audio_4_HOME":													preload("res://Audio/midnight-123895.mp3"),
	"Audio_3_HOME":													preload("res://Audio/quiet-room-ambience-with-traffic-outside-120009.mp3"),
	"Audio_3_HOME_COURTYARD":										preload("res://Audio/birds_singing-6888.mp3"),
	"Audio_CLINKERVALLEY":											preload("res://Audio/hunted-mystery-horror-sounds-8396.mp3"),
	"Audio_CRACKINGVOICERIDGE":										preload("res://Audio/howling-wind-14892_2.mp3"),
	"Audio_CHORDSQUARE":											preload("res://Audio/tension-drones-51031.mp3"),
	"Audio_dice_shake-96201":										preload("res://Audio/dice_shake-96201.mp3"),
	"Audio_1_HOME":													preload("res://Audio/couch_rustle_113011-24272.mp3"),
	"Audio_hybrid-monster-growl-90325":								preload("res://Audio/hybrid-monster-growl-90325.mp3"),
	"Audio_stingers-001-6294":										preload("res://Audio/stingers-001-6294.mp3"),
	"Audio_Do":														preload("res://Audio/do-stretched-7162_2.mp3"),
	"Audio_Re":														preload("res://Audio/re-d-47160_2.mp3"),
	"Audio_Mi":														preload("res://Audio/mi-80239_2.mp3"),
	"Audio_Fa":														preload("res://Audio/fa-78409_2.mp3"),
	"Audio_Sol":													preload("res://Audio/sol-101774_2.mp3"),
	"Audio_La":														preload("res://Audio/la-80237_2.mp3"),
	"Audio_Si":														preload("res://Audio/si-80238_2.mp3"),
	"Audio_065594_coach-whistle-88613_2":							preload("res://Audio/065594_coach-whistle-88613_2.mp3"),
	"Audio_woman-calling-dog-120316_2":								preload("res://Audio/woman-calling-dog-120316_2.mp3"),
	"Audio_hmms-various-1-7175_2":									preload("res://Audio/hmms-various-1-7175_2.mp3"),
	"Audio_mmm-hmm-36292_2":										preload("res://Audio/mmm-hmm-36292_2.mp3"),
	"Audio_aum_02_528hz-22432_2":									preload("res://Audio/aum_02_528hz-22432_2.mp3"),
	"Audio_child-says-hi-113116_2":									preload("res://Audio/child-says-hi-113116_2.mp3"),
	"Audio_peekaboo-i-see-you-104504_2":							preload("res://Audio/peekaboo-i-see-you-104504_2.mp3"),
	"Audio_minion-voicewav-14419_2":								preload("res://Audio/minion-voicewav-14419_2.mp3"),
	"Audio_dog-full-suite-22434_2":									preload("res://Audio/dog-full-suite-22434_2.mp3"),
	"Audio_panflute_j008b-77898_2":									preload("res://Audio/panflute_j008b-77898_2.mp3"),
	"Audio_panflute_j008b-77898_3":									preload("res://Audio/panflute_j008b-77898_3.mp3"),
	"Audio_panflute_j008b-77898_4":									preload("res://Audio/panflute_j008b-77898_4.mp3"),
	"Audio_onehmm-questionwav-14911":								preload("res://Audio/onehmm-questionwav-14911.mp3"),
	"Audio_hmm-oh-6957_2":											preload("res://Audio/hmm-oh-6957_2.mp3"),
	"Audio_hmm-oh-6957_3":											preload("res://Audio/hmm-oh-6957_3.mp3"),
	"Audio_hmm-oh-6957_4":											preload("res://Audio/hmm-oh-6957_4.mp3"),
	"Audio_male-sigh-6763":											preload("res://Audio/male-sigh-6763.mp3"),
	"Audio_gasp-7117_2":											preload("res://Audio/gasp-7117_2.mp3"),
	"Audio_male_exclamations-22868_2":								preload("res://Audio/male_exclamations-22868_2.mp3"),
	"Audio_male_exclamations-22868_3":								preload("res://Audio/male_exclamations-22868_3.mp3"),
	"Audio_male_exclamations-22868_4":								preload("res://Audio/male_exclamations-22868_4.mp3"),
	"Audio_male-what-6177":											preload("res://Audio/male-what-6177.mp3"),
	"Audio_steps-in-corridor-104456_2":								preload("res://Audio/steps-in-corridor-104456_2.mp3"),
	"Audio_door-open-close-45475_2":								preload("res://Audio/door-open-close-45475_2.mp3"),
	"Audio_dorm-door-opening-6038":									preload("res://Audio/dorm-door-opening-6038.mp3"),
	"Audio_door-opening-and-closing-18398_2":						preload("res://Audio/door-opening-and-closing-18398_2.mp3"),
	"Audio_endless-beauty-main-11545":								preload("res://Audio/endless-beauty-main-11545.mp3"),
	"Audio_BGMusic_cinematic-chillhop-main-6676":					preload("res://Audio/BGMusic_cinematic-chillhop-main-6676.mp3"),
	"Audio_BGMusic_emotional-cinematic-inspirational-piano-main-10524":		preload("res://Audio/BGMusic_emotional-cinematic-inspirational-piano-main-10524.mp3"),
	"Audio_BGMusic_dream-piano-128660":								preload("res://Audio/BGMusic_dream-piano-128660.mp3"),
	"Audio_BGMusic_soft-ambient-10782":								preload("res://Audio/BGMusic_soft-ambient-10782.mp3"),
	"Audio_BGMusic_soft-plucks-alarm-clock-120696":					preload("res://Audio/BGMusic_soft-plucks-alarm-clock-120696.mp3"),
	"Audio_BGMusic_soft-piano-100-bpm-121529":						preload("res://Audio/BGMusic_soft-piano-100-bpm-121529.mp3"),
	"Audio_GRASSLAND":												preload("res://Audio/BGMusic__Sheep-23761.mp3"),
	"Audio_SoundEffect_Sheep-104788_2":								preload("res://Audio/SoundEffect_Sheep-104788_2.mp3"),
	"Audio_SoundEffect_Sheep-122256_2":								preload("res://Audio/SoundEffect_Sheep-122256_2.mp3"),
	"Audio_SoundEffect_Sheep-2-106164":								preload("res://Audio/SoundEffect_Sheep-2-106164.mp3"),
	"Audio_SoundEffect_Sheep-3-89230":								preload("res://Audio/SoundEffect_Sheep-3-89230.mp3"),
	"Audio_SoundEffect_Sheep-bleat-60778_2":						preload("res://Audio/SoundEffect_Sheep-bleat-60778_2.mp3"),
	"Audio_SoundEffect_Sheep-bleat-60778_3":						preload("res://Audio/SoundEffect_Sheep-bleat-60778_3.mp3"),
	"Audio_SoundEffect_Sheep-bleat-60778_4":						preload("res://Audio/SoundEffect_Sheep-bleat-60778_4.mp3"),
	"Audio_SoundEffect_Sheep-bleat-60778_5":						preload("res://Audio/SoundEffect_Sheep-bleat-60778_5.mp3"),
	"Audio_SoundEffect_Sheep-bleating-31117_2":						preload("res://Audio/SoundEffect_Sheep-bleating-31117_2.mp3"),
	"Audio_SoundEffect_Sheep-bleating-31117_3":						preload("res://Audio/SoundEffect_Sheep-bleating-31117_3.mp3"),
	"Audio_SoundEffect_Sheep-bleating-31117_4":						preload("res://Audio/SoundEffect_Sheep-bleating-31117_4.mp3"),
	"Audio_SoundEffect_Sheep-bleating-31117_5":						preload("res://Audio/SoundEffect_Sheep-bleating-31117_5.mp3"),
	"Audio_SoundEffect_Sheep-bleating-dry-grass-77954_10":			preload("res://Audio/SoundEffect_Sheep-bleating-dry-grass-77954_10.mp3"),
	"Audio_SoundEffect_Sheep-bleating-dry-grass-77954_11":			preload("res://Audio/SoundEffect_Sheep-bleating-dry-grass-77954_11.mp3"),
	"Audio_SoundEffect_Sheep-bleating-dry-grass-77954_12":			preload("res://Audio/SoundEffect_Sheep-bleating-dry-grass-77954_12.mp3"),
	"Audio_SoundEffect_Sheep-bleating-dry-grass-77954_2":			preload("res://Audio/SoundEffect_Sheep-bleating-dry-grass-77954_2.mp3"),
	"Audio_SoundEffect_Sheep-bleating-dry-grass-77954_3":			preload("res://Audio/SoundEffect_Sheep-bleating-dry-grass-77954_3.mp3"),
	"Audio_SoundEffect_Sheep-bleating-dry-grass-77954_4":			preload("res://Audio/SoundEffect_Sheep-bleating-dry-grass-77954_4.mp3"),
	"Audio_SoundEffect_Sheep-bleating-dry-grass-77954_5":			preload("res://Audio/SoundEffect_Sheep-bleating-dry-grass-77954_5.mp3"),
	"Audio_SoundEffect_Sheep-bleating-dry-grass-77954_6":			preload("res://Audio/SoundEffect_Sheep-bleating-dry-grass-77954_6.mp3"),
	"Audio_SoundEffect_Sheep-bleating-dry-grass-77954_7":			preload("res://Audio/SoundEffect_Sheep-bleating-dry-grass-77954_7.mp3"),
	"Audio_SoundEffect_Sheep-bleating-dry-grass-77954_8":			preload("res://Audio/SoundEffect_Sheep-bleating-dry-grass-77954_8.mp3"),
	"Audio_SoundEffect_Sheep_goat-56125_10":						preload("res://Audio/SoundEffect_Sheep_goat-56125_10.mp3"),
	"Audio_SoundEffect_Sheep_goat-56125_11":						preload("res://Audio/SoundEffect_Sheep_goat-56125_11.mp3"),
	"Audio_SoundEffect_Sheep_goat-56125_12":						preload("res://Audio/SoundEffect_Sheep_goat-56125_12.mp3"),
	"Audio_SoundEffect_Sheep_goat-56125_13":						preload("res://Audio/SoundEffect_Sheep_goat-56125_13.mp3"),
	"Audio_SoundEffect_Sheep_goat-56125_14":						preload("res://Audio/SoundEffect_Sheep_goat-56125_14.mp3"),
	"Audio_SoundEffect_Sheep_goat-56125_15":						preload("res://Audio/SoundEffect_Sheep_goat-56125_15.mp3"),
	"Audio_SoundEffect_Sheep_goat-56125_16":						preload("res://Audio/SoundEffect_Sheep_goat-56125_16.mp3"),
	"Audio_SoundEffect_Sheep_goat-56125_17":						preload("res://Audio/SoundEffect_Sheep_goat-56125_17.mp3"),
	"Audio_SoundEffect_Sheep_goat-56125_2":							preload("res://Audio/SoundEffect_Sheep_goat-56125_2.mp3"),
	"Audio_SoundEffect_Sheep_goat-56125_3":							preload("res://Audio/SoundEffect_Sheep_goat-56125_3.mp3"),
	"Audio_SoundEffect_Sheep_goat-56125_4":							preload("res://Audio/SoundEffect_Sheep_goat-56125_4.mp3"),
	"Audio_SoundEffect_Sheep_goat-56125_5":							preload("res://Audio/SoundEffect_Sheep_goat-56125_5.mp3"),
	"Audio_SoundEffect_Sheep_goat-56125_6":							preload("res://Audio/SoundEffect_Sheep_goat-56125_6.mp3"),
	"Audio_SoundEffect_Sheep_goat-56125_7":							preload("res://Audio/SoundEffect_Sheep_goat-56125_7.mp3"),
	"Audio_SoundEffect_Sheep_goat-56125_8":							preload("res://Audio/SoundEffect_Sheep_goat-56125_8.mp3"),
	"Audio_SoundEffect_Sheep_goat-56125_9":							preload("res://Audio/SoundEffect_Sheep_goat-56125_9.mp3"),
	"Audio_SoundEffect_sheep-1-89229":								preload("res://Audio/SoundEffect_sheep-1-89229.mp3"),
	"Audio_SoundEffect_Sheep-bleating-dry-grass-77954_Lamb_13":		preload("res://Audio/SoundEffect_Sheep-bleating-dry-grass-77954_Lamb_13.mp3"),
	"Audio_SoundEffect_Sheep-bleating-dry-grass-77954_Lamb_9":		preload("res://Audio/SoundEffect_Sheep-bleating-dry-grass-77954_Lamb_9.mp3"),
	"Audio_SoundEffect_Sheep_lamb-and-mother-88704_2":				preload("res://Audio/SoundEffect_Sheep_lamb-and-mother-88704_2.mp3"),
	"Audio_SoundEffect_TennisBallBeingHit_2":						preload("res://Audio/SoundEffect_TennisBallBeingHit_2.mp3"),
	"Audio_SoundEffect_TennisBallBeingHit_3":						preload("res://Audio/SoundEffect_TennisBallBeingHit_3.mp3"),
	"Audio_SoundEffect_TennisBallBeingHit_4":						preload("res://Audio/SoundEffect_TennisBallBeingHit_4.mp3"),
	"Audio_SoundEffect_Whoosh_2":									preload("res://Audio/SoundEffect_Whoosh_2.mp3"),
	"Audio_SoundEffect_Whoosh_3":									preload("res://Audio/SoundEffect_Whoosh_3.mp3"),
	"Audio_SoundEffect_Whoosh_4":									preload("res://Audio/SoundEffect_Whoosh_4.mp3"),
	"Audio_SoundEffect_CoinCollectRetro8-bit_2":					preload("res://Audio/SoundEffect_CoinCollectRetro8-bit_2.mp3"),
	"Audio_SoundEffect_OfficeVendingMachineCoinReturn_2":			preload("res://Audio/SoundEffect_OfficeVendingMachineCoinReturn_2.mp3"),
	"Audio_SoundEffect_Horse":										preload("res://Audio/SoundEffect_Horse.mp3"),
	
	# Head Portrait pictures
#	"HeadPortrait_Angel1":											preload("res://Picture/UI/HeadPortrait/HeadPortrait_Angel1.png"),
#	"HeadPortrait_Clergy1":											preload("res://Picture/UI/HeadPortrait/HeadPortrait_Clergy1.png"),
#	"HeadPortrait_Dog1":											preload("res://Picture/UI/HeadPortrait/HeadPortrait_Dog1.png"),
#	"HeadPortrait_Donkey1":											preload("res://Picture/UI/HeadPortrait/HeadPortrait_Donkey1.png"),
#	"HeadPortrait_Monster1":										preload("res://Picture/UI/HeadPortrait/HeadPortrait_Monster1.png"),
#	"HeadPortrait_Monster2":										preload("res://Picture/UI/HeadPortrait/HeadPortrait_Monster2.png"),
#	"HeadPortrait_Monster3":										preload("res://Picture/UI/HeadPortrait/HeadPortrait_Monster3.png"),
#	"HeadPortrait_Monster4":										preload("res://Picture/UI/HeadPortrait/HeadPortrait_Monster4.png"),
#	"HeadPortrait_Monster5":										preload("res://Picture/UI/HeadPortrait/HeadPortrait_Monster5.png"),
#	"HeadPortrait_Monster6":										preload("res://Picture/UI/HeadPortrait/HeadPortrait_Monster6.png"),
#	"HeadPortrait_Monster7":										preload("res://Picture/UI/HeadPortrait/HeadPortrait_Monster7.png"),
#	"HeadPortrait_Monster8":										preload("res://Picture/UI/HeadPortrait/HeadPortrait_Monster8.png"),
#	"HeadPortrait_Monster9":										preload("res://Picture/UI/HeadPortrait/HeadPortrait_Monster9.png"),
#	"HeadPortrait_Monster10":										preload("res://Picture/UI/HeadPortrait/HeadPortrait_Monster10.png"),
#	"HeadPortrait_Monster11":										preload("res://Picture/UI/HeadPortrait/HeadPortrait_Monster11.png"),
#	"HeadPortrait_Monster12":										preload("res://Picture/UI/HeadPortrait/HeadPortrait_Monster12.png"),
	"HeadPortrait_Player1":											preload("res://Picture/UI/HeadPortrait/HeadPortrait_Player1.png"),
#	"HeadPortrait_QiuYu1":											preload("res://Picture/UI/HeadPortrait/HeadPortrait_QiuYu1.png"),
#	"HeadPortrait_SilverCarp1":										preload("res://Picture/UI/HeadPortrait/HeadPortrait_SilverCarp1.png"),
#	"HeadPortrait_Snake1":											preload("res://Picture/UI/HeadPortrait/HeadPortrait_Snake1.png"),
#	"HeadPortrait_Snake2":											preload("res://Picture/UI/HeadPortrait/HeadPortrait_Snake2.png"),
#	"HeadPortrait_Snake3":											preload("res://Picture/UI/HeadPortrait/HeadPortrait_Snake3.png"),
#	"HeadPortrait_Tortoise1":										preload("res://Picture/UI/HeadPortrait/HeadPortrait_Tortoise1.png"),
#	"HeadPortrait_Turtle1":											preload("res://Picture/UI/HeadPortrait/HeadPortrait_Turtle1.png"),
#	"HeadPortrait_King":											preload("res://Picture/UI/HeadPortrait/HeadPortrait_King3.png"),
#	"HeadPortrait_Queen":											preload("res://Picture/UI/HeadPortrait/HeadPortrait_Queen_2.png"),
#	"HeadPortrait_Sister":											preload("res://Picture/UI/HeadPortrait/HeadPortrait_Sister_2.png"),
#	"HeadPortrait_Housekeeper":										preload("res://Picture/UI/HeadPortrait/HeadPortrait_Housekeeper2.png"),
#	"HeadPortrait_Butler":											preload("res://Picture/UI/HeadPortrait/HeadPortrait_Butler3.png"),
	
	# Skill, Item and Buff(and Bag) pictures, and HeadIcon
#	"Skill_SkillBless":												preload("res://Picture/UI/Icon/Skill/SkillIcon/SkillBless_S_Holy04.png"),
#	"Skill_SkillBombArrow":											preload("res://Picture/UI/Icon/Skill/SkillIcon/SkillBombArrow_S_Bow06.png"),
	"Skill_SkillConventionalFlatAttack":							preload("res://Picture/UI/Icon/Skill/SkillIcon/SkillConventionalFlatAttack_5.png"),
#	"Skill_SkillConventionalLongRangeAttack":						preload("res://Picture/UI/Icon/Skill/SkillIcon/SkillConventionalLongRangeAttack_4.png"),
#	"Skill_SkillCure":												preload("res://Picture/UI/Icon/Skill/SkillIcon/SkillCure_S_Holy03.png"),
#	"Skill_SkillElectricity":										preload("res://Picture/UI/Icon/Skill/SkillIcon/SkillElectricity_2.png"),
#	"Skill_SkillFire":												preload("res://Picture/UI/Icon/Skill/SkillIcon/SkillFire_S_Fire03.png"),
#	"Skill_SkillFireArrow":											preload("res://Picture/UI/Icon/Skill/SkillIcon/SkillFireArrow_S_Bow01.png"),
	"Skill_SkillFoot":												preload("res://Picture/UI/Icon/Skill/SkillIcon/SkillFoot_A_Shoes01.png"),
	"Skill_SkillLucky":												preload("res://Picture/UI/Icon/Skill/SkillIcon/SkillLucky_I_Clover.png"),
#	"Skill_SkillMagicMissile":										preload("res://Picture/UI/Icon/Skill/SkillIcon/SkillMagicMissile_S_Axe04.png"),
#	"Skill_SkillMagicShield":										preload("res://Picture/UI/Icon/Skill/SkillIcon/SkillMagicShield_S_Holy09.png"),
#	"Skill_SkillRain":												preload("res://Picture/UI/Icon/Skill/SkillIcon/SkillRain_S_Water01.png"),
#	"Skill_SkillShield":											preload("res://Picture/UI/Icon/Skill/SkillIcon/SkillShield_E_Wood03.png"),
#	"Skill_SkillSlash":												preload("res://Picture/UI/Icon/Skill/SkillIcon/SkillSlash_W_Sword001.png"),
#	"Skill_SkillSlow":												preload("res://Picture/UI/Icon/Skill/SkillIcon/SkillSlow_I_SnailShell.png"),
#	"Skill_SkillThunder":											preload("res://Picture/UI/Icon/Skill/SkillIcon/SkillThunder_S_Thunder01.png"),
#	"Skill_SkillWater":												preload("res://Picture/UI/Icon/Skill/SkillIcon/SkillWater_S_Water03.png"),
#	"Skill_SkillWind":												preload("res://Picture/UI/Icon/Skill/SkillIcon/SkillWind_S_Wind05.png"),
#	"Item_ItemEP05":												preload("res://Picture/UI/Icon/Item/ItemIcon/ItemEP05_P_Orange04.png"),
#	"Item_ItemEP1":													preload("res://Picture/UI/Icon/Item/ItemIcon/ItemEP1_P_Orange02.png"),
#	"Item_ItemEP2":													preload("res://Picture/UI/Icon/Item/ItemIcon/ItemEP2_P_Orange03.png"),
#	"Item_ItemEP3":													preload("res://Picture/UI/Icon/Item/ItemIcon/ItemEP3_P_Orange01.png"),
#	"Item_ItemEP4":													preload("res://Picture/UI/Icon/Item/ItemIcon/ItemEP4_P_Orange06.png"),
#	"Item_ItemHP05":												preload("res://Picture/UI/Icon/Item/ItemIcon/ItemHP05_P_Red04.png"),
	"Item_ItemHP1":													preload("res://Picture/UI/Icon/Item/ItemIcon/ItemHP1_P_Red02.png"),
#	"Item_ItemHP2":													preload("res://Picture/UI/Icon/Item/ItemIcon/ItemHP2_P_Red03.png"),
#	"Item_ItemHP3":													preload("res://Picture/UI/Icon/Item/ItemIcon/ItemHP3_P_Red01.png"),
#	"Item_ItemHP4":													preload("res://Picture/UI/Icon/Item/ItemIcon/ItemHP4_P_Red07.png"),
#	"Item_ItemMP05":												preload("res://Picture/UI/Icon/Item/ItemIcon/ItemMP05_P_Blue04.png"),
#	"Item_ItemMP1":													preload("res://Picture/UI/Icon/Item/ItemIcon/ItemMP1_P_Blue02.png"),
#	"Item_ItemMP2":													preload("res://Picture/UI/Icon/Item/ItemIcon/ItemMP2_P_Blue03.png"),
#	"Item_ItemMP3":													preload("res://Picture/UI/Icon/Item/ItemIcon/ItemMP3_P_Blue01.png"),
#	"Item_ItemMP4":													preload("res://Picture/UI/Icon/Item/ItemIcon/ItemMP4_P_Blue05.png"),
	"Item_Telescope3":												preload("res://Picture/UI/Icon/Item/ItemIcon/ItemTelescope3.png"),
	"Item_Wig2_BLACK3":												preload("res://Picture/UI/Icon/Item/ItemIcon/ItemWig2_BLACK3.png"),
	"Item_Wig2_RED3":												preload("res://Picture/UI/Icon/Item/ItemIcon/ItemWig2_RED3.png"),
	"Item_Wig2_WHITE3":												preload("res://Picture/UI/Icon/Item/ItemIcon/ItemWig2_WHITE3.png"),
	"Item_Wig2_YELLOW3":											preload("res://Picture/UI/Icon/Item/ItemIcon/ItemWig2_YELLOW3.png"),
#	"Item_Wig2_BLACK3Long":											preload("res://Picture/UI/Icon/Item/ItemIcon/ItemWig2_BLACK3Long.png"),
#	"Item_Wig2_RED3Long":											preload("res://Picture/UI/Icon/Item/ItemIcon/ItemWig2_RED3Long.png"),
#	"Item_Wig2_WHITE3Long":											preload("res://Picture/UI/Icon/Item/ItemIcon/ItemWig2_WHITE3Long.png"),
#	"Item_Wig2_YELLOW3Long":										preload("res://Picture/UI/Icon/Item/ItemIcon/ItemWig2_YELLOW3Long.png"),
	"Item_Wig_GRAYISH_BLUE":										preload("res://Picture/UI/Icon/Item/ItemIcon/ItemWig2_GRAYISH_BLUE.png"),
	"Item_Wig_GRAYISH_BLUE2":										preload("res://Picture/UI/Icon/Item/ItemIcon/ItemWig2_GRAYISH_BLUE2.png"),
	"Item_Wig_GRAYISH_BLUE3":										preload("res://Picture/UI/Icon/Item/ItemIcon/ItemWig2_GRAYISH_BLUE3.png"),
	"Item_Wig_GRAYISH_BLUE4":										preload("res://Picture/UI/Icon/Item/ItemIcon/ItemWig2_GRAYISH_BLUE4.png"),
	"Item_Wig_GRAYISH_BLUE5":										preload("res://Picture/UI/Icon/Item/ItemIcon/ItemWig2_GRAYISH_BLUE5.png"),
	"Item_Wig_GRAYISH_BLUE6":										preload("res://Picture/UI/Icon/Item/ItemIcon/ItemWig2_GRAYISH_BLUE6.png"),
	"Item_Wig_GRAYISH_BLUE7":										preload("res://Picture/UI/Icon/Item/ItemIcon/ItemWig2_GRAYISH_BLUE7.png"),
	"Item_Wig_PALE_YELLOW":											preload("res://Picture/UI/Icon/Item/ItemIcon/ItemWig2_PALE_YELLOW.png"),
	"Item_Wig_RED2Long":											preload("res://Picture/UI/Icon/Item/ItemIcon/ItemWig2_RED2Long.png"),
	"Item_Wig_BLUE2Long":											preload("res://Picture/UI/Icon/Item/ItemIcon/ItemWig2_BLUE2Long.png"),
	"Item_Wig_YELLOW2Long":											preload("res://Picture/UI/Icon/Item/ItemIcon/ItemWig2_YELLOW2Long.png"),
	"Item_Wig_CHANGING_COLOR":										preload("res://Picture/UI/Icon/Item/ItemIcon/ItemWig2_CHANGING_COLOR.png"),
	"Item_NumberingRodIcon":										preload("res://Picture/Avatar/Equip/NumberingRod/NumberingRodIcon.png"),
	
#	"HeadIcon_Angel1":												preload("res://Picture/UI/Icon/Item/HeadIcon/HeadIcon_Angel1.png"),
#	"HeadIcon_Clergy1":												preload("res://Picture/UI/Icon/Item/HeadIcon/HeadIcon_Clergy1.png"),
#	"HeadIcon_Dog1":												preload("res://Picture/UI/Icon/Item/HeadIcon/HeadIcon_Dog1.png"),
#	"HeadIcon_Donkey1":												preload("res://Picture/UI/Icon/Item/HeadIcon/HeadIcon_Donkey1.png"),
#	"HeadIcon_Monster1":											preload("res://Picture/UI/Icon/Item/HeadIcon/HeadIcon_Monster1.png"),
#	"HeadIcon_Monster2":											preload("res://Picture/UI/Icon/Item/HeadIcon/HeadIcon_Monster2.png"),
#	"HeadIcon_Monster3":											preload("res://Picture/UI/Icon/Item/HeadIcon/HeadIcon_Monster3.png"),
#	"HeadIcon_Monster4":											preload("res://Picture/UI/Icon/Item/HeadIcon/HeadIcon_Monster4.png"),
#	"HeadIcon_Monster5":											preload("res://Picture/UI/Icon/Item/HeadIcon/HeadIcon_Monster5.png"),
#	"HeadIcon_Monster6":											preload("res://Picture/UI/Icon/Item/HeadIcon/HeadIcon_Monster6.png"),
#	"HeadIcon_Monster7":											preload("res://Picture/UI/Icon/Item/HeadIcon/HeadIcon_Monster7.png"),
#	"HeadIcon_Monster8":											preload("res://Picture/UI/Icon/Item/HeadIcon/HeadIcon_Monster8.png"),
#	"HeadIcon_Monster9":											preload("res://Picture/UI/Icon/Item/HeadIcon/HeadIcon_Monster9.png"),
#	"HeadIcon_Monster10":											preload("res://Picture/UI/Icon/Item/HeadIcon/HeadIcon_Monster10.png"),
#	"HeadIcon_Monster11":											preload("res://Picture/UI/Icon/Item/HeadIcon/HeadIcon_Monster11.png"),
#	"HeadIcon_Monster12":											preload("res://Picture/UI/Icon/Item/HeadIcon/HeadIcon_Monster12.png"),
#	"HeadIcon_Player1":												preload("res://Picture/UI/Icon/Item/HeadIcon/HeadIcon_Player1.png"),
#	"HeadIcon_QiuYu1":												preload("res://Picture/UI/Icon/Item/HeadIcon/HeadIcon_QiuYu1.png"),
#	"HeadIcon_SilverCarp1":											preload("res://Picture/UI/Icon/Item/HeadIcon/HeadIcon_SilverCarp1.png"),
#	"HeadIcon_Snake1":												preload("res://Picture/UI/Icon/Item/HeadIcon/HeadIcon_Snake1.png"),
#	"HeadIcon_Snake2":												preload("res://Picture/UI/Icon/Item/HeadIcon/HeadIcon_Snake2.png"),
#	"HeadIcon_Snake3":												preload("res://Picture/UI/Icon/Item/HeadIcon/HeadIcon_Snake3.png"),
#	"HeadIcon_Tortoise1":											preload("res://Picture/UI/Icon/Item/HeadIcon/HeadIcon_Tortoise1.png"),
#	"HeadIcon_Turtle1":												preload("res://Picture/UI/Icon/Item/HeadIcon/HeadIcon_Turtle1.png"),
#	"HeadIcon_King":												preload("res://Picture/UI/Icon/Item/HeadIcon/HeadIcon_King3.png"),
#	"HeadIcon_Queen":												preload("res://Picture/UI/Icon/Item/HeadIcon/HeadIcon_Queen_2.png"),
#	"HeadIcon_Sister":												preload("res://Picture/UI/Icon/Item/HeadIcon/HeadIcon_Sister_2.png"),
#	"HeadIcon_Housekeeper":											preload("res://Picture/UI/Icon/Item/HeadIcon/HeadIcon_Housekeeper2.png"),
#	"HeadIcon_Butler":												preload("res://Picture/UI/Icon/Item/HeadIcon/HeadIcon_Butler3.png"),
	
	"OdeToJoy5_s":													preload("res://Picture/Scene/OdeToJoy/OdeToJoy5_s.png"),
	"OdeToJoy6_s":													preload("res://Picture/Scene/OdeToJoy/OdeToJoy6_s.png"),
	"OdeToJoy7_s":													preload("res://Picture/Scene/OdeToJoy/OdeToJoy7_s.png"),
	"OdeToJoy8_s":													preload("res://Picture/Scene/OdeToJoy/OdeToJoy8_s.png"),
	"DoorKey1_2":													preload("res://Picture/Scene/Door/DoorKey1_2.png"),
	"DoorKey2_2":													preload("res://Picture/Scene/Door/DoorKey2_2.png"),
	"QueenKey2":													preload("res://Picture/Scene/Door/QueenKey2.png"),
	
	# CommonPicture
	"CommonPicture_White64x64":										preload("res://Picture/CommonPicture/White64x64.png"),
	
	# Scene
	"Scene_Bag":													preload("res://Picture/Scene/SceneItemIcon/Bag44.png"),
	"Scene_JournalRecordBook":										preload("res://Picture/Scene/SceneItemIcon/JournalRecordBookIcon44.png"),
	"Scene_Letter3":												preload("res://Picture/Scene/SceneItemIcon/Letter3.png"),
	"Scene_ThreeHeadsDragon3":										preload("res://Picture/Scene/SceneItemIcon/ThreeHeadsDragon3.png"),
	"Scene_GuideBoard":												preload("res://Picture/Scene/SceneItemIcon/GuideBoard2.png"),
	"Scene_RadioCassetteRecorder":									preload("res://Picture/Scene/SceneItemIcon/RadioCassetteRecorder4.png"),
	"Scene_Door1":													preload("res://Picture/Scene/Door/Door4_4.png"),
	"Scene_Door2":													preload("res://Picture/Scene/Door/Door4_4_2.png"),
	"Scene_Door3":													preload("res://Picture/Scene/Door/Door4_4_3.png"),
	"Scene_Door6":													preload("res://Picture/Scene/Door/Door6.png"),
	"Scene_Door7":													preload("res://Picture/Scene/Door/Door7.png"),
	"Scene_Door8":													preload("res://Picture/Scene/Door/Door8.png"),
	"Castle_Door3":													preload("res://Picture/Scene/Castle/Castle_Door3.png"),
	"Door2":														preload("res://Picture/Scene/Door/Door2.png"),
	"Door2_2":														preload("res://Picture/Scene/Door/Door2_2.png"),
	"Door2_3":														preload("res://Picture/Scene/Door/Door2_3.png"),
	"PathBG_64x64":													preload("res://Picture/CommonPicture/PathBG_64x64.png"),
}

const AUDIO_INFO_LIST: Dictionary = {
# audioName: audioInfo
	"Audio_HUB":													{"isBGMusic": true},
	"Audio_DEBUG":													{"isBGMusic": true},
	"Audio_CHORDSQUARE":											{"isBGMusic": true},
	"Audio_STAVEAVENUE":											{"isBGMusic": true},
	"Audio_HALLOFMELODY":											{"isBGMusic": true},
	"Audio_CLINKERVALLEY":											{"isBGMusic": true},
	"Audio_CRACKINGVOICERIDGE":										{"isBGMusic": true},
	"Audio_1_HOME":													{"isBGMusic": true},
	"Audio_3_HOME":													{"isBGMusic": true},
	"Audio_3_HOME_COURTYARD":										{"isBGMusic": true},
	"Audio_4_HOME":													{"isBGMusic": true},
	"Audio_GRASSLAND":												{"isBGMusic": true},
	"Audio_endless-beauty-main-11545":								{"isBGMusic": true},
	"Audio_BGMusic_cinematic-chillhop-main-6676":					{"isBGMusic": true},
	"Audio_BGMusic_emotional-cinematic-inspirational-piano-main-10524":		{"isBGMusic": true},
	"Audio_BGMusic_dream-piano-128660":								{"isBGMusic": true},
	"Audio_BGMusic_soft-ambient-10782":								{"isBGMusic": true},
	"Audio_BGMusic_soft-plucks-alarm-clock-120696":					{"isBGMusic": true},
	"Audio_BGMusic_soft-piano-100-bpm-121529":						{"isBGMusic": true},
	"Audio_big-impact-7054":										{"isSoundEffect": true},	# 继续游戏
	"Audio_heavy-beam-weapon-7052_2":								{"isSoundEffect": true},	# 开始新游戏
	"Audio_projector-button-push-6258_4":							{"isSoundEffect": true},	# 点击按钮
	"Audio_fast-simple-chop-5-6270":								{"isSoundEffect": true},	# 划过按钮
	"Audio_ceramic_mug_cup-31808_2":								{"isSoundEffect": true},	# 对弈
	"Audio_whooo-105751":											{"isSoundEffect": true},	# CommonButtonItem点击按钮
	"Audio_grunt-106134":											{"isSoundEffect": true},	# 交互/对话
	"Audio_turning-pages-in-a-book-96504_2":						{"isSoundEffect": true},	# 冒险日记
	"Audio_zipping-pencil-case-37454_2":							{"isSoundEffect": true},	# 背包
	"Audio_dice_shake-96201":										{"isSoundEffect": true},	# 对弈骰子晃动
	"Audio_hybrid-monster-growl-90325":								{"isSoundEffect": true},	# 对弈成功
	"Audio_stingers-001-6294":										{"isSoundEffect": true},	# 对弈失败
	"Audio_Do":														{"isSoundEffect": true},
	"Audio_Re":														{"isSoundEffect": true},
	"Audio_Mi":														{"isSoundEffect": true},
	"Audio_Fa":														{"isSoundEffect": true},
	"Audio_Sol":													{"isSoundEffect": true},
	"Audio_La":														{"isSoundEffect": true},
	"Audio_Si":														{"isSoundEffect": true},
	"Audio_065594_coach-whistle-88613_2":							{"isSoundEffect": true},
	"Audio_woman-calling-dog-120316_2":								{"isSoundEffect": true},
	"Audio_hmms-various-1-7175_2":									{"isSoundEffect": true},
	"Audio_mmm-hmm-36292_2":										{"isSoundEffect": true},
	"Audio_aum_02_528hz-22432_2":									{"isSoundEffect": true},
	"Audio_child-says-hi-113116_2":									{"isSoundEffect": true},
	"Audio_peekaboo-i-see-you-104504_2":							{"isSoundEffect": true},
	"Audio_minion-voicewav-14419_2":								{"isSoundEffect": true},
	"Audio_dog-full-suite-22434_2":									{"isSoundEffect": true},
	"Audio_panflute_j008b-77898_2":									{"isSoundEffect": true},
	"Audio_panflute_j008b-77898_3":									{"isSoundEffect": true},
	"Audio_panflute_j008b-77898_4":									{"isSoundEffect": true},
	"Audio_onehmm-questionwav-14911":								{"isSoundEffect": true},
	"Audio_hmm-oh-6957_2":											{"isSoundEffect": true},
	"Audio_hmm-oh-6957_3":											{"isSoundEffect": true},
	"Audio_hmm-oh-6957_4":											{"isSoundEffect": true},
	"Audio_male-sigh-6763":											{"isSoundEffect": true},
	"Audio_gasp-7117_2":											{"isSoundEffect": true},
	"Audio_male_exclamations-22868_2":								{"isSoundEffect": true},
	"Audio_male_exclamations-22868_3":								{"isSoundEffect": true},
	"Audio_male_exclamations-22868_4":								{"isSoundEffect": true},
	"Audio_male-what-6177":											{"isSoundEffect": true},
	"Audio_steps-in-corridor-104456_2":								{"isSoundEffect": true},
	"Audio_door-open-close-45475_2":								{"isSoundEffect": true},
	"Audio_dorm-door-opening-6038":									{"isSoundEffect": true},
	"Audio_door-opening-and-closing-18398_2":						{"isSoundEffect": true},
	"Audio_SoundEffect_Sheep-104788_2":								{"isSoundEffect": true},
	"Audio_SoundEffect_Sheep-122256_2":								{"isSoundEffect": true},
	"Audio_SoundEffect_Sheep-2-106164":								{"isSoundEffect": true},
	"Audio_SoundEffect_Sheep-3-89230":								{"isSoundEffect": true},
	"Audio_SoundEffect_Sheep-bleat-60778_2":						{"isSoundEffect": true},
	"Audio_SoundEffect_Sheep-bleat-60778_3":						{"isSoundEffect": true},
	"Audio_SoundEffect_Sheep-bleat-60778_4":						{"isSoundEffect": true},
	"Audio_SoundEffect_Sheep-bleat-60778_5":						{"isSoundEffect": true},
	"Audio_SoundEffect_Sheep-bleating-31117_2":						{"isSoundEffect": true},
	"Audio_SoundEffect_Sheep-bleating-31117_3":						{"isSoundEffect": true},
	"Audio_SoundEffect_Sheep-bleating-31117_4":						{"isSoundEffect": true},
	"Audio_SoundEffect_Sheep-bleating-31117_5":						{"isSoundEffect": true},
	"Audio_SoundEffect_Sheep-bleating-dry-grass-77954_10":			{"isSoundEffect": true},
	"Audio_SoundEffect_Sheep-bleating-dry-grass-77954_11":			{"isSoundEffect": true},
	"Audio_SoundEffect_Sheep-bleating-dry-grass-77954_12":			{"isSoundEffect": true},
	"Audio_SoundEffect_Sheep-bleating-dry-grass-77954_2":			{"isSoundEffect": true},
	"Audio_SoundEffect_Sheep-bleating-dry-grass-77954_3":			{"isSoundEffect": true},
	"Audio_SoundEffect_Sheep-bleating-dry-grass-77954_4":			{"isSoundEffect": true},
	"Audio_SoundEffect_Sheep-bleating-dry-grass-77954_5":			{"isSoundEffect": true},
	"Audio_SoundEffect_Sheep-bleating-dry-grass-77954_6":			{"isSoundEffect": true},
	"Audio_SoundEffect_Sheep-bleating-dry-grass-77954_7":			{"isSoundEffect": true},
	"Audio_SoundEffect_Sheep-bleating-dry-grass-77954_8":			{"isSoundEffect": true},
	"Audio_SoundEffect_Sheep_goat-56125_10":						{"isSoundEffect": true},
	"Audio_SoundEffect_Sheep_goat-56125_11":						{"isSoundEffect": true},
	"Audio_SoundEffect_Sheep_goat-56125_12":						{"isSoundEffect": true},
	"Audio_SoundEffect_Sheep_goat-56125_13":						{"isSoundEffect": true},
	"Audio_SoundEffect_Sheep_goat-56125_14":						{"isSoundEffect": true},
	"Audio_SoundEffect_Sheep_goat-56125_15":						{"isSoundEffect": true},
	"Audio_SoundEffect_Sheep_goat-56125_16":						{"isSoundEffect": true},
	"Audio_SoundEffect_Sheep_goat-56125_17":						{"isSoundEffect": true},
	"Audio_SoundEffect_Sheep_goat-56125_2":							{"isSoundEffect": true},
	"Audio_SoundEffect_Sheep_goat-56125_3":							{"isSoundEffect": true},
	"Audio_SoundEffect_Sheep_goat-56125_4":							{"isSoundEffect": true},
	"Audio_SoundEffect_Sheep_goat-56125_5":							{"isSoundEffect": true},
	"Audio_SoundEffect_Sheep_goat-56125_6":							{"isSoundEffect": true},
	"Audio_SoundEffect_Sheep_goat-56125_7":							{"isSoundEffect": true},
	"Audio_SoundEffect_Sheep_goat-56125_8":							{"isSoundEffect": true},
	"Audio_SoundEffect_Sheep_goat-56125_9":							{"isSoundEffect": true},
	"Audio_SoundEffect_sheep-1-89229":								{"isSoundEffect": true},
	"Audio_SoundEffect_Sheep-bleating-dry-grass-77954_Lamb_13":		{"isSoundEffect": true},
	"Audio_SoundEffect_Sheep-bleating-dry-grass-77954_Lamb_9":		{"isSoundEffect": true},
	"Audio_SoundEffect_Sheep_lamb-and-mother-88704_2":				{"isSoundEffect": true},
	"Audio_SoundEffect_TennisBallBeingHit_2":						{"isSoundEffect": true},
	"Audio_SoundEffect_TennisBallBeingHit_3":						{"isSoundEffect": true},
	"Audio_SoundEffect_TennisBallBeingHit_4":						{"isSoundEffect": true},
	"Audio_SoundEffect_Whoosh_2":									{"isSoundEffect": true},
	"Audio_SoundEffect_Whoosh_3":									{"isSoundEffect": true},
	"Audio_SoundEffect_Whoosh_4":									{"isSoundEffect": true},
	"Audio_SoundEffect_CoinCollectRetro8-bit_2":					{"isSoundEffect": true},
	"Audio_SoundEffect_OfficeVendingMachineCoinReturn_2":			{"isSoundEffect": true},
	"Audio_SoundEffect_Horse":										{"isSoundEffect": true},
}

const LANGUAGE_NAME_ENGLISH: String = HQH.LANGUAGE_NAME_DEFAULT
var m_EnglishTableData: Dictionary = {}
const LANGUAGE_TABLE_NAME_LIST_ENGLISH: Array = [
	"EnglishTable",
]

const LANGUAGE_NAME_CHINESE: String = "Simplified Chinese"
var m_ChineseTableData: Dictionary = {}
const LANGUAGE_TABLE_NAME_LIST_CHINESE: Array = [
	"ChineseTable",
]

const LANGUAGE_NAME_TRADITIONALCHINESE: String = "Traditional Chinese"
var m_TraditionalChineseTableData: Dictionary = {}
const LANGUAGE_TABLE_NAME_LIST_TRADITIONALCHINESE: Array = [
	"TraditionalChineseTable",
]

const LANGUAGE_NAME_FRENCH: String = "French"
var m_FrenchTableData: Dictionary = {}
const LANGUAGE_TABLE_NAME_LIST_FRENCH: Array = [
	"FrenchTable",
]

const LANGUAGE_NAME_SPANISH: String = "Spanish"
var m_SpanishTableData: Dictionary = {}
const LANGUAGE_TABLE_NAME_LIST_SPANISH: Array = [
	"SpanishTable",
]

const LANGUAGE_NAME_ARABIC: String = "Arabic"
var m_ArabicTableData: Dictionary = {}
const LANGUAGE_TABLE_NAME_LIST_ARABIC: Array = [
	"ArabicTable",
]

const LANGUAGE_NAME_RUSSIAN: String = "Russian"
var m_RussianTableData: Dictionary = {}
const LANGUAGE_TABLE_NAME_LIST_RUSSIAN: Array = [
	"RussianTable",
]

const LANGUAGE_NAME_JAPANESE: String = "Japanese"
var m_JapaneseTableData: Dictionary = {}
const LANGUAGE_TABLE_NAME_LIST_JAPANESE: Array = [
	"JapaneseTable",
]

const LANGUAGE_NAME_KOREAN: String = "Korean"
var m_KoreanTableData: Dictionary = {}
const LANGUAGE_TABLE_NAME_LIST_KOREAN: Array = [
	"KoreanTable",
]

const LANGUAGE_NAME_GERMAN: String = "German"
var m_GermanTableData: Dictionary = {}
const LANGUAGE_TABLE_NAME_LIST_GERMAN: Array = [
	"GermanTable",
]

const LANGUAGE_NAME_PORTUGUESE: String = "Portuguese"
var m_PortugueseTableData: Dictionary = {}
const LANGUAGE_TABLE_NAME_LIST_PORTUGUESE: Array = [
	"PortugueseTable",
]

const LANGUAGE_NAME_POLISH: String = "Polish"
var m_PolishTableData: Dictionary = {}
const LANGUAGE_TABLE_NAME_LIST_POLISH: Array = [
	"PolishTable",
]

const LANGUAGE_NAME_BAHASAINDONESIA: String = "Bahasa Indonesia"
var m_BahasaIndonesiaTableData: Dictionary = {}
const LANGUAGE_TABLE_NAME_LIST_BAHASAINDONESIA: Array = [
	"BahasaIndonesiaTable",
]

const LANGUAGE_NAME_MALAY: String = "Malay"
var m_MalayTableData: Dictionary = {}
const LANGUAGE_TABLE_NAME_LIST_MALAY: Array = [
	"MalayTable",
]

const LANGUAGE_NAME_THAI: String = "Thai"
var m_ThaiTableData: Dictionary = {}
const LANGUAGE_TABLE_NAME_LIST_THAI: Array = [
	"ThaiTable",
]

const LANGUAGE_NAME_VIETNAMESE: String = "Vietnamese"
var m_VietnameseTableData: Dictionary = {}
const LANGUAGE_TABLE_NAME_LIST_VIETNAMESE: Array = [
	"VietnameseTable",
]

const LANGUAGE_NAME_TURKISH: String = "Turkish"
var m_TurkishTableData: Dictionary = {}
const LANGUAGE_TABLE_NAME_LIST_TURKISH: Array = [
	"TurkishTable",
]

# reference: https://docs.godotengine.org/en/stable/tutorials/i18n/locales.html
# And: \Document\Language\LocaleLanguageAndVariant.txt
const LOCALE_LANGUAGE_MAP: Dictionary = {
# localeLanguageName: localeLanguageInfo
	"cmn_TW":		LANGUAGE_NAME_TRADITIONALCHINESE,
	"hak_TW":		LANGUAGE_NAME_TRADITIONALCHINESE,
	"lzh_TW":		LANGUAGE_NAME_TRADITIONALCHINESE,
	"nan_TW":		LANGUAGE_NAME_TRADITIONALCHINESE,
	"yue_HK":		LANGUAGE_NAME_TRADITIONALCHINESE,
	"zh":			LANGUAGE_NAME_CHINESE,
	"zh_CN":		LANGUAGE_NAME_CHINESE,
	"zh_HK":		LANGUAGE_NAME_TRADITIONALCHINESE,
	"zh_SG":		LANGUAGE_NAME_CHINESE,
	"zh_TW":		LANGUAGE_NAME_TRADITIONALCHINESE,
	"en":			LANGUAGE_NAME_ENGLISH,
	"en_AG":		LANGUAGE_NAME_ENGLISH,
	"en_AU":		LANGUAGE_NAME_ENGLISH,
	"en_BW":		LANGUAGE_NAME_ENGLISH,
	"en_CA":		LANGUAGE_NAME_ENGLISH,
	"en_DK":		LANGUAGE_NAME_ENGLISH,
	"en_GB":		LANGUAGE_NAME_ENGLISH,
	"en_HK":		LANGUAGE_NAME_ENGLISH,
	"en_IE":		LANGUAGE_NAME_ENGLISH,
	"en_IL":		LANGUAGE_NAME_ENGLISH,
	"en_IN":		LANGUAGE_NAME_ENGLISH,
	"en_NG":		LANGUAGE_NAME_ENGLISH,
	"en_NZ":		LANGUAGE_NAME_ENGLISH,
	"en_PH":		LANGUAGE_NAME_ENGLISH,
	"en_SG":		LANGUAGE_NAME_ENGLISH,
	"en_US":		LANGUAGE_NAME_ENGLISH,
	"en_ZA":		LANGUAGE_NAME_ENGLISH,
	"en_ZM":		LANGUAGE_NAME_ENGLISH,
	"en_ZW":		LANGUAGE_NAME_ENGLISH,
	"fr":			LANGUAGE_NAME_FRENCH,
	"fr_BE":		LANGUAGE_NAME_FRENCH,
	"fr_CA":		LANGUAGE_NAME_FRENCH,
	"fr_CH":		LANGUAGE_NAME_FRENCH,
	"fr_FR":		LANGUAGE_NAME_FRENCH,
	"fr_LU":		LANGUAGE_NAME_FRENCH,
	"es":			LANGUAGE_NAME_SPANISH,
	"es_AR":		LANGUAGE_NAME_SPANISH,
	"es_BO":		LANGUAGE_NAME_SPANISH,
	"es_CL":		LANGUAGE_NAME_SPANISH,
	"es_CO":		LANGUAGE_NAME_SPANISH,
	"es_CR":		LANGUAGE_NAME_SPANISH,
	"es_CU":		LANGUAGE_NAME_SPANISH,
	"es_DO":		LANGUAGE_NAME_SPANISH,
	"es_EC":		LANGUAGE_NAME_SPANISH,
	"es_ES":		LANGUAGE_NAME_SPANISH,
	"es_GT":		LANGUAGE_NAME_SPANISH,
	"es_HN":		LANGUAGE_NAME_SPANISH,
	"es_MX":		LANGUAGE_NAME_SPANISH,
	"es_NI":		LANGUAGE_NAME_SPANISH,
	"es_PA":		LANGUAGE_NAME_SPANISH,
	"es_PE":		LANGUAGE_NAME_SPANISH,
	"es_PR":		LANGUAGE_NAME_SPANISH,
	"es_PY":		LANGUAGE_NAME_SPANISH,
	"es_SV":		LANGUAGE_NAME_SPANISH,
	"es_US":		LANGUAGE_NAME_SPANISH,
	"es_UY":		LANGUAGE_NAME_SPANISH,
	"es_VE":		LANGUAGE_NAME_SPANISH,
	"ar":			LANGUAGE_NAME_ARABIC,
	"ar_AE":		LANGUAGE_NAME_ARABIC,
	"ar_BH":		LANGUAGE_NAME_ARABIC,
	"ar_DZ":		LANGUAGE_NAME_ARABIC,
	"ar_EG":		LANGUAGE_NAME_ARABIC,
	"ar_IQ":		LANGUAGE_NAME_ARABIC,
	"ar_JO":		LANGUAGE_NAME_ARABIC,
	"ar_KW":		LANGUAGE_NAME_ARABIC,
	"ar_LB":		LANGUAGE_NAME_ARABIC,
	"ar_LY":		LANGUAGE_NAME_ARABIC,
	"ar_MA":		LANGUAGE_NAME_ARABIC,
	"ar_OM":		LANGUAGE_NAME_ARABIC,
	"ar_QA":		LANGUAGE_NAME_ARABIC,
	"ar_SA":		LANGUAGE_NAME_ARABIC,
	"ar_SD":		LANGUAGE_NAME_ARABIC,
	"ar_SS":		LANGUAGE_NAME_ARABIC,
	"ar_SY":		LANGUAGE_NAME_ARABIC,
	"ar_TN":		LANGUAGE_NAME_ARABIC,
	"ar_YE":		LANGUAGE_NAME_ARABIC,
	"ru":			LANGUAGE_NAME_RUSSIAN,
	"ru_RU":		LANGUAGE_NAME_RUSSIAN,
	"ru_UA":		LANGUAGE_NAME_RUSSIAN,
	"ja":			LANGUAGE_NAME_JAPANESE,
	"ja_JP":		LANGUAGE_NAME_JAPANESE,
	"ko":			LANGUAGE_NAME_KOREAN,
	"ko_KR":		LANGUAGE_NAME_KOREAN,
	"de":			LANGUAGE_NAME_GERMAN,
	"de_AT":		LANGUAGE_NAME_GERMAN,
	"de_BE":		LANGUAGE_NAME_GERMAN,
	"de_CH":		LANGUAGE_NAME_GERMAN,
	"de_DE":		LANGUAGE_NAME_GERMAN,
	"de_IT":		LANGUAGE_NAME_GERMAN,
	"de_LU":		LANGUAGE_NAME_GERMAN,
	"fy_DE":		LANGUAGE_NAME_GERMAN,
	"hsb_DE":		LANGUAGE_NAME_GERMAN,
	"nds_DE":		LANGUAGE_NAME_GERMAN,
	"nds_NL":		LANGUAGE_NAME_GERMAN,
	"pt":			LANGUAGE_NAME_PORTUGUESE,
	"pt_BR":		LANGUAGE_NAME_PORTUGUESE,
	"pt_PT":		LANGUAGE_NAME_PORTUGUESE,
	"pl":			LANGUAGE_NAME_POLISH,
	"pl_PL":		LANGUAGE_NAME_POLISH,
	"id":			LANGUAGE_NAME_BAHASAINDONESIA,
	"id_ID":		LANGUAGE_NAME_BAHASAINDONESIA,
	"ms":			LANGUAGE_NAME_MALAY,
	"ms_MY":		LANGUAGE_NAME_MALAY,
	"th":			LANGUAGE_NAME_THAI,
	"th_TH":		LANGUAGE_NAME_THAI,
	"vi":			LANGUAGE_NAME_VIETNAMESE,
	"vi_VN": 		LANGUAGE_NAME_VIETNAMESE,
	"tr":			LANGUAGE_NAME_TURKISH,
	"tr_CY":		LANGUAGE_NAME_TURKISH,
	"tr_TR":		LANGUAGE_NAME_TURKISH,
}
var m_LanguageTableMap: Dictionary = {
# languageName: languageInfo
	LANGUAGE_NAME_ENGLISH:					{"showName": "English",					"languageTableNameList": LANGUAGE_TABLE_NAME_LIST_ENGLISH,					"languageTableData": m_EnglishTableData},
	LANGUAGE_NAME_CHINESE:					{"showName": "简体中文",					"languageTableNameList": LANGUAGE_TABLE_NAME_LIST_CHINESE,					"languageTableData": m_ChineseTableData},
	LANGUAGE_NAME_TRADITIONALCHINESE:		{"showName": "繁體中文",					"languageTableNameList": LANGUAGE_TABLE_NAME_LIST_TRADITIONALCHINESE,		"languageTableData": m_TraditionalChineseTableData},
	LANGUAGE_NAME_FRENCH:					{"showName": "Français",				"languageTableNameList": LANGUAGE_TABLE_NAME_LIST_FRENCH,					"languageTableData": m_FrenchTableData},
	LANGUAGE_NAME_SPANISH:					{"showName": "Español",					"languageTableNameList": LANGUAGE_TABLE_NAME_LIST_SPANISH,					"languageTableData": m_SpanishTableData},
	LANGUAGE_NAME_ARABIC:					{"showName": "العربية",					"languageTableNameList": LANGUAGE_TABLE_NAME_LIST_ARABIC,					"languageTableData": m_ArabicTableData},
	LANGUAGE_NAME_RUSSIAN:					{"showName": "Pусский язык",			"languageTableNameList": LANGUAGE_TABLE_NAME_LIST_RUSSIAN,					"languageTableData": m_RussianTableData},
	LANGUAGE_NAME_JAPANESE:					{"showName": "しろうと",					"languageTableNameList": LANGUAGE_TABLE_NAME_LIST_JAPANESE,					"languageTableData": m_JapaneseTableData},
	LANGUAGE_NAME_KOREAN:					{"showName": "한국어",					"languageTableNameList": LANGUAGE_TABLE_NAME_LIST_KOREAN,					"languageTableData": m_KoreanTableData},
#	LANGUAGE_NAME_GERMAN:					{"showName": "Deutsch",					"languageTableNameList": LANGUAGE_TABLE_NAME_LIST_GERMAN,					"languageTableData": m_GermanTableData},
#	LANGUAGE_NAME_PORTUGUESE:				{"showName": "Língua portuguesa",		"languageTableNameList": LANGUAGE_TABLE_NAME_LIST_PORTUGUESE,				"languageTableData": m_PortugueseTableData},
#	LANGUAGE_NAME_POLISH:					{"showName": "Polski",					"languageTableNameList": LANGUAGE_TABLE_NAME_LIST_POLISH,					"languageTableData": m_PolishTableData},
#	LANGUAGE_NAME_BAHASAINDONESIA:			{"showName": "Bahasa indonesia",		"languageTableNameList": LANGUAGE_TABLE_NAME_LIST_BAHASAINDONESIA,			"languageTableData": m_BahasaIndonesiaTableData},
#	LANGUAGE_NAME_MALAY:					{"showName": "Bahasa Melayu",			"languageTableNameList": LANGUAGE_TABLE_NAME_LIST_MALAY,					"languageTableData": m_MalayTableData},
#	LANGUAGE_NAME_THAI:						{"showName": "ภาษาไทย",					"languageTableNameList": LANGUAGE_TABLE_NAME_LIST_THAI,						"languageTableData": m_ThaiTableData},
#	LANGUAGE_NAME_VIETNAMESE:				{"showName": "Việt nam",					"languageTableNameList": LANGUAGE_TABLE_NAME_LIST_VIETNAMESE,				"languageTableData": m_VietnameseTableData},
#	LANGUAGE_NAME_TURKISH:					{"showName": "Türkçe",					"languageTableNameList": LANGUAGE_TABLE_NAME_LIST_TURKISH,					"languageTableData": m_TurkishTableData},
}
var m_CurrentLanguageName: String = ""

const EQUIPTABLE1_DATA_DATA_KEY_FILENAME: String = "fileName"
const EQUIPTABLE1_DATA_DATA_KEY_COLOR: String = "color"
var m_EquipTable1_Data: Dictionary = {
# "equipTypeID": {EQUIPTABLE1_DATA_DATA_KEY_FILENAME: "", 	EQUIPTABLE1_DATA_DATA_KEY_COLOR: ""},
	1:		{EQUIPTABLE1_DATA_DATA_KEY_FILENAME: "Avatar_Equip_Wig2",	EQUIPTABLE1_DATA_DATA_KEY_COLOR: "COLOR_BLACK"			},
	2:		{EQUIPTABLE1_DATA_DATA_KEY_FILENAME: "Avatar_Equip_Wig2",	EQUIPTABLE1_DATA_DATA_KEY_COLOR: "COLOR_RED"			},
	3:		{EQUIPTABLE1_DATA_DATA_KEY_FILENAME: "Avatar_Equip_Wig2",	EQUIPTABLE1_DATA_DATA_KEY_COLOR: "COLOR_WHITE"			},
	4:		{EQUIPTABLE1_DATA_DATA_KEY_FILENAME: "Avatar_Equip_Wig2",	EQUIPTABLE1_DATA_DATA_KEY_COLOR: "COLOR_YELLOW"			},
	5:		{EQUIPTABLE1_DATA_DATA_KEY_FILENAME: "Avatar_Equip_Wig2",	EQUIPTABLE1_DATA_DATA_KEY_COLOR: "COLOR_GRAYISH_BLUE"	},
	6:		{EQUIPTABLE1_DATA_DATA_KEY_FILENAME: "Avatar_Equip_Wig2",	EQUIPTABLE1_DATA_DATA_KEY_COLOR: "COLOR_GRAYISH_BLUE2"	},
	7:		{EQUIPTABLE1_DATA_DATA_KEY_FILENAME: "Avatar_Equip_Wig2",	EQUIPTABLE1_DATA_DATA_KEY_COLOR: "COLOR_GRAYISH_BLUE3"	},
	8:		{EQUIPTABLE1_DATA_DATA_KEY_FILENAME: "Avatar_Equip_Wig2",	EQUIPTABLE1_DATA_DATA_KEY_COLOR: "COLOR_GRAYISH_BLUE4"	},
	9:		{EQUIPTABLE1_DATA_DATA_KEY_FILENAME: "Avatar_Equip_Wig2",	EQUIPTABLE1_DATA_DATA_KEY_COLOR: "COLOR_GRAYISH_BLUE5"	},
	10:		{EQUIPTABLE1_DATA_DATA_KEY_FILENAME: "Avatar_Equip_Wig2",	EQUIPTABLE1_DATA_DATA_KEY_COLOR: "COLOR_GRAYISH_BLUE6"	},
	11:		{EQUIPTABLE1_DATA_DATA_KEY_FILENAME: "Avatar_Equip_Wig2",	EQUIPTABLE1_DATA_DATA_KEY_COLOR: "COLOR_GRAYISH_BLUE7"	},
	12:		{EQUIPTABLE1_DATA_DATA_KEY_FILENAME: "Avatar_Equip_Wig2",	EQUIPTABLE1_DATA_DATA_KEY_COLOR: "COLOR_PALE_YELLOW"	},
	13:		{EQUIPTABLE1_DATA_DATA_KEY_FILENAME: "Avatar_Equip_Wig1",	EQUIPTABLE1_DATA_DATA_KEY_COLOR: "COLOR_RED2"			},
	14:		{EQUIPTABLE1_DATA_DATA_KEY_FILENAME: "Avatar_Equip_Wig1",	EQUIPTABLE1_DATA_DATA_KEY_COLOR: "COLOR_BLUE2"			},
	15:		{EQUIPTABLE1_DATA_DATA_KEY_FILENAME: "Avatar_Equip_Wig1",	EQUIPTABLE1_DATA_DATA_KEY_COLOR: "COLOR_YELLOW2"		},
	16:		{EQUIPTABLE1_DATA_DATA_KEY_FILENAME: "Avatar_Equip_Wig2",	EQUIPTABLE1_DATA_DATA_KEY_COLOR: "COLOR_CHANGING_COLOR"	},
}

const SCENELAYER_TILEMAPGROUND_NAME: String = "tileMapGround"
const SCENELAYER_TILEMAPGROUNDSUPERSTRATUM_NAME: String = "tileMapGroundSuperstratum"
const SCENELAYER_NODE2DCHANGESCENETRIGGER_NAME: String = "node2DChangeSceneTrigger"
const SCENELAYER_NODE2DNPCARTICLETRIGGER_NAME: String = "node2DNPCArticleTrigger"
const SCENELAYER_NODE2DNPCTRIGGER_NAME: String = "node2DNPCTrigger"
const SCENELAYER_NODE2DAVATAR_NAME: String = "node2DAvatar"
const SCENELAYER_NODE2DNPCARTICLETRIGGERSUPERSTRATUM_NAME: String = "node2DNPCArticleTriggerSuperstratum"
const SCENELAYER_TILEMAPCONSTRUCTION_NAME: String = "tileMapConstruction"
const SCENELAYER_TILEMAPCOLLISION_NAME: String = "tileMapCollision"
const SCENELAYER_TILEMAPCOLLISIONFORSHEEP_NAME: String = "tileMapCollisionForSheep"
const SCENELAYER_TILEMAPSUPERSTRATUM_NAME: String = "tileMapSuperstratum"
const SCENELAYER_TILEMAPWARFOG_NAME: String = "tileMapWarFog"
const SCENELAYER_TILEMAPNAVIGATION_NAME: String = "tileMapNavigation"

const SCENETYPEID_HUB: int = 1
const SCENETYPEID_DEBUG1: int = 2
const SCENETYPEID_DEBUG2: int = 3
const SCENETYPEID_GRASSLAND: int = 4
#const SCENETYPEID_LM: int = 5
const SCENETYPEID_PATHWAY: int = 5
const SCENETYPEID_CHORDSQUARE: int = 6
const SCENETYPEID_STAVEAVENUE: int = 7
const SCENETYPEID_HALLOFMELODY: int = 8
const SCENETYPEID_CLINKERVALLEY: int = 9
const SCENETYPEID_CRACKINGVOICERIDGE: int = 10
#const SCENETYPEID_1_HOME: int = 9
#const SCENETYPEID_3_HOME: int = 10
#const SCENETYPEID_3_HOME_COURTYARD: int = 11
#const SCENETYPEID_4_HOME: int = 12
const SCENE_INFO_MAP: Dictionary = {
# sceneTypeID: sceneInfo
SCENETYPEID_HUB:					{"sceneName": "HubScene",					"node2DAvatarName": SCENELAYER_NODE2DAVATAR_NAME,		"BGMusicName": "Audio_HUB",						"showNameKey": ""},
SCENETYPEID_DEBUG1:					{"sceneName": "DebugScene1",				"node2DAvatarName": "node2DWalkScene/node2DAvatar",		"BGMusicName": "Audio_DEBUG", 					"showNameKey": ""},
SCENETYPEID_DEBUG2:					{"sceneName": "DebugScene2",				"node2DAvatarName": "node2DWalkScene/node2DAvatar",		"BGMusicName": "Audio_DEBUG",					"showNameKey": ""},
SCENETYPEID_GRASSLAND:				{"sceneName": "SceneGrassland",				"node2DAvatarName": SCENELAYER_NODE2DAVATAR_NAME,		"BGMusicName": "Audio_GRASSLAND",				"showNameKey": "SCENE_NAME_GRASSLAND"},
#SCENETYPEID_LM:					{"sceneName": "SceneLM",					"node2DAvatarName": SCENELAYER_NODE2DAVATAR_NAME,		"BGMusicNameList": ["Audio_1_HOME", "Audio_3_HOME", "Audio_3_HOME_COURTYARD", "Audio_CHORDSQUARE", "Audio_CRACKINGVOICERIDGE"],				"showNameKey": "NAME_1"},
SCENETYPEID_PATHWAY:				{"sceneName": "ScenePathway",				"node2DAvatarName": SCENELAYER_NODE2DAVATAR_NAME,		"BGMusicName": "Audio_3_HOME_COURTYARD",		"showNameKey": "NAME_PATHWAY"},
SCENETYPEID_CHORDSQUARE:			{"sceneName": "SceneChordSquare",			"node2DAvatarName": SCENELAYER_NODE2DAVATAR_NAME,		"BGMusicName": "Audio_CHORDSQUARE",				"showNameKey": "SCENE_NAME_CHORD_SQUARE"},
SCENETYPEID_STAVEAVENUE:			{"sceneName": "SceneStaveAvenue",			"node2DAvatarName": SCENELAYER_NODE2DAVATAR_NAME,		"BGMusicName": "Audio_1_HOME",					"showNameKey": "SCENE_NAME_STAVE_AVENUE"},
SCENETYPEID_HALLOFMELODY:			{"sceneName": "SceneHallOfMelody",			"node2DAvatarName": SCENELAYER_NODE2DAVATAR_NAME,		"BGMusicName": "Audio_3_HOME",					"showNameKey": "SCENE_NAME_HALL_OF_MELODY"},
SCENETYPEID_CLINKERVALLEY:			{"sceneName": "SceneClinkerValley",			"node2DAvatarName": SCENELAYER_NODE2DAVATAR_NAME,		"BGMusicName": "Audio_CLINKERVALLEY",			"showNameKey": "SCENE_NAME_CLINKER_VALLEY"},
SCENETYPEID_CRACKINGVOICERIDGE:		{"sceneName": "SceneCrackingVoiceRidge",	"node2DAvatarName": SCENELAYER_NODE2DAVATAR_NAME,		"BGMusicName": "Audio_CRACKINGVOICERIDGE", 		"showNameKey": "SCENE_NAME_CRACKING_VOICE_RIDGE"},
#SCENETYPEID_1_HOME:				{"sceneName": "Scene1Home",					"node2DAvatarName": SCENELAYER_NODE2DAVATAR_NAME,		"BGMusicName": "Audio_1_HOME",					"showNameKey": "SCENE_NAME_1_HOME"},
#SCENETYPEID_3_HOME:				{"sceneName": "Scene3Home",					"node2DAvatarName": SCENELAYER_NODE2DAVATAR_NAME,		"BGMusicName": "Audio_3_HOME",					"showNameKey": "SCENE_NAME_3_HOME"},
#SCENETYPEID_3_HOME_COURTYARD:		{"sceneName": "Scene3HomeCourtyard",		"node2DAvatarName": SCENELAYER_NODE2DAVATAR_NAME,		"BGMusicName": "Audio_3_HOME_COURTYARD",		"showNameKey": "SCENE_NAME_3_HOME_COURTYARD"},
#SCENETYPEID_4_HOME:				{"sceneName": "Scene4Home",					"node2DAvatarName": SCENELAYER_NODE2DAVATAR_NAME,		"BGMusicName": "Audio_4_HOME",					"showNameKey": "SCENE_NAME_4_HOME"},
}
const SCENE_GAMEPLAY_SCENETYPEID_LIST: Array = [
	SCENETYPEID_GRASSLAND,
#	SCENETYPEID_LM,
	SCENETYPEID_PATHWAY,
	SCENETYPEID_CHORDSQUARE,
	SCENETYPEID_STAVEAVENUE,
	SCENETYPEID_HALLOFMELODY,
	SCENETYPEID_CLINKERVALLEY,
	SCENETYPEID_CRACKINGVOICERIDGE,
#	SCENETYPEID_1_HOME,
#	SCENETYPEID_3_HOME,
#	SCENETYPEID_3_HOME_COURTYARD,
#	SCENETYPEID_4_HOME,
]
const SCENE_HOME_SCENETYPEID_LIST: Array = [
#	SCENETYPEID_1_HOME,
#	SCENETYPEID_3_HOME,
#	SCENETYPEID_4_HOME,
]

const POWER_MIN: int = 1
const POWER_MAX: int = 11500

#const AVATARTYPEID_SNAKE1: int = 1
#const AVATARTYPEID_DOG1: int = 2
const AVATARTYPEID_PLAYER1: int = 3
const AVATARTYPEID_SILVERCARP1: int = 4
#const AVATARTYPEID_TORTOISE1: int = 5
#const AVATARTYPEID_SNAKE2: int = 6
#const AVATARTYPEID_SNAKE3: int = 7
#const AVATARTYPEID_TURTLE1: int = 8
#const AVATARTYPEID_ANGEL1: int = 9
#const AVATARTYPEID_DONKEY1: int = 10
#const AVATARTYPEID_QIUYU1: int = 11
#const AVATARTYPEID_CLERGY1: int = 12
#const AVATARTYPEID_MONSTER1: int = 13
#const AVATARTYPEID_MONSTER2: int = 14
#const AVATARTYPEID_MONSTER3: int = 15
#const AVATARTYPEID_MONSTER4: int = 16
#const AVATARTYPEID_MONSTER5: int = 17
#const AVATARTYPEID_MONSTER6: int = 18
#const AVATARTYPEID_MONSTER7: int = 19
#const AVATARTYPEID_MONSTER8: int = 20
#const AVATARTYPEID_MONSTER9: int = 21
#const AVATARTYPEID_MONSTER10: int = 22
#const AVATARTYPEID_MONSTER11: int = 23
#const AVATARTYPEID_MONSTER12: int = 24
const AVATARTYPEID_KING: int = 25
#const AVATARTYPEID_QUEEN: int = 26
const AVATARTYPEID_SISTER: int = 27
#const AVATARTYPEID_HOUSEKEEPER: int = 28
const AVATARTYPEID_BUTLER: int = 29
const AVATARTYPEID_AVATARTRANSPARENT: int = 30
const AVATARTYPEID_SHEEP: int = 31
const AVATARTYPEID_HOLLY1: int = 32
const AVATARTYPEID_DEADTREE1_2: int = 33
const AVATARTYPEID_DEADTREE1_3: int = 34
const AVATARTYPEID_DEADTREE2_2: int = 35
const AVATARTYPEID_DEADTREE2_3: int = 36
const AVATARTYPEID_FLOWER1: int = 37
const AVATARTYPEID_FLOWER1_2: int = 38
const AVATARTYPEID_FLOWER1_3: int = 39
const AVATARTYPEID_FLOWER2: int = 40
const AVATARTYPEID_FLOWER2_2: int = 41
const AVATARTYPEID_FLOWER2_3: int = 42
const AVATARTYPEID_FLOWER2_4_2: int = 43
const AVATARTYPEID_FLOWER2_4_2_2: int = 44
const AVATARTYPEID_FLOWER2_4_2_3: int = 45
const AVATARTYPEID_FLOWER2_4_3: int = 46
const AVATARTYPEID_FLOWER2_4_3_2: int = 47
const AVATARTYPEID_FLOWER2_4_3_3: int = 48
const AVATARTYPEID_FLOWER3_1_2: int = 49
const AVATARTYPEID_FLOWER3_2_2: int = 50
const AVATARTYPEID_FLOWER3_3_2: int = 51
const AVATARTYPEID_FLOWER3_4_2: int = 52
const AVATARTYPEID_FLOWER3_5_2: int = 53
const AVATARTYPEID_FLOWER3_6_2: int = 54
const AVATARTYPEID_FLOWER3_7_2: int = 55
const AVATARTYPEID_FLOWER4_1_2: int = 56
const AVATARTYPEID_FLOWER4_2_2: int = 57
const AVATARTYPEID_FLOWER4_3_2: int = 58
const AVATARTYPEID_FLOWER4_4_2: int = 59
const AVATARTYPEID_FLOWER4_5_2: int = 60
const AVATARTYPEID_FLOWER4_6_2: int = 61
const AVATARTYPEID_FLOWER4_7_2: int = 62
const AVATARTYPEID_OSMANTHUSTREE1_2: int = 63
const AVATARTYPEID_OSMANTHUSTREE1_2_2: int = 64
const AVATARTYPEID_TREE1_3: int = 65
const AVATARTYPEID_TREE1_3_2: int = 66
const AVATARTYPEID_TREE1_3_3: int = 67
const AVATARTYPEID_TREE1_3_4: int = 68
const AVATARTYPEID_TREE1_4: int = 69
const AVATARTYPEID_TREE1_4_2: int = 70
const AVATARTYPEID_TREE1_4_3: int = 71
const AVATARTYPEID_TREE1_4_4: int = 72
const AVATARTYPEID_TREE2_2: int = 73
const AVATARTYPEID_TREE2_3: int = 74
const AVATARTYPEID_TREE3_2: int = 75
const AVATARTYPEID_TREE3_2_2: int = 76
const AVATARTYPEID_TREE3_3: int = 77
const AVATARTYPEID_TREE3_3_2: int = 78
const AVATAR_TYPE_MAP: Dictionary = {
# avatarTypeID: avatarInfo
#AVATARTYPEID_SNAKE1:				{"preloadResource": "Avatar_Snake1",			"showNameKey": "NAME_AVATAR_1",			"flagColor": HQH.COLORPALETTE_AVATAR.COLOR_SNAKE1,			"clickAudioResource": "Audio_panflute_j008b-77898_2"},
#AVATARTYPEID_DOG1:					{"preloadResource": "Avatar_Dog1",				"showNameKey": "NAME_AVATAR_2",			"flagColor": HQH.COLORPALETTE_AVATAR.COLOR_DOG1,			"clickAudioResource": "Audio_dog-full-suite-22434_2"},
AVATARTYPEID_PLAYER1:				{"preloadResource": "Avatar_Player1",			"showNameKey": "NAME_AVATAR_3",			"flagColor": HQH.COLORPALETTE_AVATAR.COLOR_PLAYER1,			"clickAudioResource": "Audio_child-says-hi-113116_2"},
AVATARTYPEID_SILVERCARP1:			{"preloadResource": "Avatar_SilverCarp1",		"showNameKey": "NAME_AVATAR_4",			"flagColor": HQH.COLORPALETTE_AVATAR.COLOR_SILVERCARP1,		"clickAudioResource": "Audio_SoundEffect_Horse"},
#AVATARTYPEID_TORTOISE1:			{"preloadResource": "Avatar_Tortoise1",			"showNameKey": "NAME_AVATAR_5",			"flagColor": HQH.COLORPALETTE_AVATAR.COLOR_TORTOISE1,		"clickAudioResource": "Audio_aum_02_528hz-22432_2"},
#AVATARTYPEID_SNAKE2:				{"preloadResource": "Avatar_Snake2",			"showNameKey": "NAME_AVATAR_6",			"flagColor": HQH.COLORPALETTE_AVATAR.COLOR_SNAKE2,			"clickAudioResource": "Audio_panflute_j008b-77898_3"},
#AVATARTYPEID_SNAKE3:				{"preloadResource": "Avatar_Snake3",			"showNameKey": "NAME_AVATAR_7",			"flagColor": HQH.COLORPALETTE_AVATAR.COLOR_SNAKE3,			"clickAudioResource": "Audio_panflute_j008b-77898_4"},
#AVATARTYPEID_TURTLE1:				{"preloadResource": "Avatar_Turtle1",			"showNameKey": "NAME_AVATAR_8",			"flagColor": HQH.COLORPALETTE_AVATAR.COLOR_TURTLE1,			"clickAudioResource": "Audio_minion-voicewav-14419_2"},
#AVATARTYPEID_ANGEL1:				{"preloadResource": "Avatar_Angel1",			"showNameKey": "NAME_AVATAR_9",			"flagColor": HQH.COLORPALETTE_AVATAR.COLOR_ANGEL1,			"clickAudioResource": "Audio_woman-calling-dog-120316_2"},
#AVATARTYPEID_DONKEY1:				{"preloadResource": "Avatar_Donkey1",			"showNameKey": "NAME_AVATAR_18",		"flagColor": HQH.COLORPALETTE_AVATAR.COLOR_DONKEY1,			"clickAudioResource": "Audio_Si"},
#AVATARTYPEID_QIUYU1:				{"preloadResource": "Avatar_QiuYu1",			"showNameKey": "NAME_AVATAR_19",		"flagColor": HQH.COLORPALETTE_AVATAR.COLOR_QIUYU1,			"clickAudioResource": "Audio_Fa"},
#AVATARTYPEID_CLERGY1:				{"preloadResource": "Avatar_Clergy1",			"showNameKey": "NAME_AVATAR_20",		"flagColor": HQH.COLORPALETTE_AVATAR.COLOR_CLERGY1,			"clickAudioResource": "Audio_peekaboo-i-see-you-104504_2"},
#AVATARTYPEID_MONSTER1:				{"preloadResource": "Avatar_Monster1",			"showNameKey": "NAME_AVATAR_10",		"flagColor": HQH.COLORPALETTE_AVATAR.COLOR_MONSTER1,		"clickAudioResource": "Audio_onehmm-questionwav-14911"},
#AVATARTYPEID_MONSTER2:				{"preloadResource": "Avatar_Monster2",			"showNameKey": "NAME_AVATAR_11",		"flagColor": HQH.COLORPALETTE_AVATAR.COLOR_MONSTER2,		"clickAudioResource": "Audio_hmm-oh-6957_2"},
#AVATARTYPEID_MONSTER3:				{"preloadResource": "Avatar_Monster3",			"showNameKey": "NAME_AVATAR_12",		"flagColor": HQH.COLORPALETTE_AVATAR.COLOR_MONSTER3,		"clickAudioResource": "Audio_hmm-oh-6957_3"},
#AVATARTYPEID_MONSTER4:				{"preloadResource": "Avatar_Monster4",			"showNameKey": "NAME_AVATAR_13",		"flagColor": HQH.COLORPALETTE_AVATAR.COLOR_MONSTER4,		"clickAudioResource": "Audio_hmm-oh-6957_4"},
#AVATARTYPEID_MONSTER5:				{"preloadResource": "Avatar_Monster5",			"showNameKey": "NAME_AVATAR_14",		"flagColor": HQH.COLORPALETTE_AVATAR.COLOR_MONSTER5,		"clickAudioResource": "Audio_male-sigh-6763"},
#AVATARTYPEID_MONSTER6:				{"preloadResource": "Avatar_Monster6",			"showNameKey": "NAME_AVATAR_15",		"flagColor": HQH.COLORPALETTE_AVATAR.COLOR_MONSTER6,		"clickAudioResource": "Audio_gasp-7117_2"},
#AVATARTYPEID_MONSTER7:				{"preloadResource": "Avatar_Monster7",			"showNameKey": "NAME_AVATAR_16",		"flagColor": HQH.COLORPALETTE_AVATAR.COLOR_MONSTER7,		"clickAudioResource": "Audio_male_exclamations-22868_2"},
#AVATARTYPEID_MONSTER8:				{"preloadResource": "Avatar_Monster8",			"showNameKey": "NAME_AVATAR_17",		"flagColor": HQH.COLORPALETTE_AVATAR.COLOR_MONSTER8,		"clickAudioResource": "Audio_male_exclamations-22868_3"},
#AVATARTYPEID_MONSTER9:				{"preloadResource": "Avatar_Monster9",			"showNameKey": "NAME_AVATAR_21",		"flagColor": HQH.COLORPALETTE_AVATAR.COLOR_MONSTER9,		"clickAudioResource": "Audio_male_exclamations-22868_4"},
#AVATARTYPEID_MONSTER10:			{"preloadResource": "Avatar_Monster10",			"showNameKey": "NAME_AVATAR_22",		"flagColor": HQH.COLORPALETTE_AVATAR.COLOR_MONSTER10,		"clickAudioResource": "Audio_male-what-6177"},
#AVATARTYPEID_MONSTER11:			{"preloadResource": "Avatar_Monster11",			"showNameKey": "NAME_AVATAR_23",		"flagColor": HQH.COLORPALETTE_AVATAR.COLOR_MONSTER11,		"clickAudioResource": "Audio_hmms-various-1-7175_2"},
#AVATARTYPEID_MONSTER12:			{"preloadResource": "Avatar_Monster12",			"showNameKey": "NAME_AVATAR_24",		"flagColor": HQH.COLORPALETTE_AVATAR.COLOR_MONSTER12,		"clickAudioResource": "Audio_mmm-hmm-36292_2"},
AVATARTYPEID_KING:					{"preloadResource": "Avatar_King",				"showNameKey": "NAME_AVATAR_25",		"flagColor": HQH.COLORPALETTE_AVATAR.COLOR_KING,			"clickAudioResource": "Audio_Do"},
#AVATARTYPEID_QUEEN:				{"preloadResource": "Avatar_Queen",				"showNameKey": "NAME_AVATAR_26",		"flagColor": HQH.COLORPALETTE_AVATAR.COLOR_QUEEN,			"clickAudioResource": "Audio_Re"},
AVATARTYPEID_SISTER:				{"preloadResource": "Avatar_Sister",			"showNameKey": "NAME_AVATAR_27",		"flagColor": HQH.COLORPALETTE_AVATAR.COLOR_SISTER,			"clickAudioResource": "Audio_Mi"},
#AVATARTYPEID_HOUSEKEEPER:			{"preloadResource": "Avatar_Housekeeper",		"showNameKey": "NAME_AVATAR_28",		"flagColor": HQH.COLORPALETTE_AVATAR.COLOR_HOUSEKEEPER,		"clickAudioResource": "Audio_La"},
AVATARTYPEID_BUTLER:				{"preloadResource": "Avatar_Butler",			"showNameKey": "NAME_AVATAR_29",		"flagColor": HQH.COLORPALETTE_AVATAR.COLOR_BUTLER,			"clickAudioResource": "Audio_Sol"},
AVATARTYPEID_AVATARTRANSPARENT:		{"preloadResource": "Avatar_AvatarTransparent",	"showNameKey": "",						"flagColor": HQH.COLORPALETTE_UI.COLOR_TRANSPARENT,			"clickAudioResource": ""},
AVATARTYPEID_SHEEP:					{"preloadResource": "Avatar_Sheep",				"showNameKey": "NAME_AVATAR_SHEEP",		"flagColor": HQH.COLORPALETTE_AVATAR.COLOR_SHEEP,			"clickAudioResource": ""},
AVATARTYPEID_HOLLY1:				{"preloadResource": "Avatar_Holly1",			"showNameKey": "NAME_AVATAR_HOLLY",		"flagColor": HQH.COLORPALETTE_AVATAR.COLOR_HOLLY,			"clickAudioResource": ""},
AVATARTYPEID_DEADTREE1_2:			{"preloadResource": "Avatar_DeadTree1_2",		"showNameKey": "DEAD_TREE",				"flagColor": HQH.COLORPALETTE_AVATAR.COLOR_PLANT,			"clickAudioResource": ""},
AVATARTYPEID_DEADTREE1_3:			{"preloadResource": "Avatar_DeadTree1_3",		"showNameKey": "DEAD_TREE",				"flagColor": HQH.COLORPALETTE_AVATAR.COLOR_PLANT,			"clickAudioResource": ""},
AVATARTYPEID_DEADTREE2_2:			{"preloadResource": "Avatar_DeadTree2_2",		"showNameKey": "DEAD_TREE",				"flagColor": HQH.COLORPALETTE_AVATAR.COLOR_PLANT,			"clickAudioResource": ""},
AVATARTYPEID_DEADTREE2_3:			{"preloadResource": "Avatar_DeadTree2_3",		"showNameKey": "DEAD_TREE",				"flagColor": HQH.COLORPALETTE_AVATAR.COLOR_PLANT,			"clickAudioResource": ""},
AVATARTYPEID_FLOWER1:				{"preloadResource": "Avatar_Flower1",			"showNameKey": "KUMQUAT",				"flagColor": HQH.COLORPALETTE_AVATAR.COLOR_PLANT,			"clickAudioResource": ""},
AVATARTYPEID_FLOWER1_2:				{"preloadResource": "Avatar_Flower1_2",			"showNameKey": "KUMQUAT",				"flagColor": HQH.COLORPALETTE_AVATAR.COLOR_PLANT,			"clickAudioResource": ""},
AVATARTYPEID_FLOWER1_3:				{"preloadResource": "Avatar_Flower1_3",			"showNameKey": "KUMQUAT",				"flagColor": HQH.COLORPALETTE_AVATAR.COLOR_PLANT,			"clickAudioResource": ""},
AVATARTYPEID_FLOWER2:				{"preloadResource": "Avatar_Flower2",			"showNameKey": "PINE_TREE",				"flagColor": HQH.COLORPALETTE_AVATAR.COLOR_PLANT,			"clickAudioResource": ""},
AVATARTYPEID_FLOWER2_2:				{"preloadResource": "Avatar_Flower2_2",			"showNameKey": "PINE_TREE",				"flagColor": HQH.COLORPALETTE_AVATAR.COLOR_PLANT,			"clickAudioResource": ""},
AVATARTYPEID_FLOWER2_3:				{"preloadResource": "Avatar_Flower2_3",			"showNameKey": "PINE_TREE",				"flagColor": HQH.COLORPALETTE_AVATAR.COLOR_PLANT,			"clickAudioResource": ""},
AVATARTYPEID_FLOWER2_4_2:			{"preloadResource": "Avatar_Flower2_4_2",		"showNameKey": "PINE_TREE",				"flagColor": HQH.COLORPALETTE_AVATAR.COLOR_PLANT,			"clickAudioResource": ""},
AVATARTYPEID_FLOWER2_4_2_2:			{"preloadResource": "Avatar_Flower2_4_2_2",		"showNameKey": "PINE_TREE",				"flagColor": HQH.COLORPALETTE_AVATAR.COLOR_PLANT,			"clickAudioResource": ""},
AVATARTYPEID_FLOWER2_4_2_3:			{"preloadResource": "Avatar_Flower2_4_2_3",		"showNameKey": "PINE_TREE",				"flagColor": HQH.COLORPALETTE_AVATAR.COLOR_PLANT,			"clickAudioResource": ""},
AVATARTYPEID_FLOWER2_4_3:			{"preloadResource": "Avatar_Flower2_4_3",		"showNameKey": "PINE_TREE",				"flagColor": HQH.COLORPALETTE_AVATAR.COLOR_PLANT,			"clickAudioResource": ""},
AVATARTYPEID_FLOWER2_4_3_2:			{"preloadResource": "Avatar_Flower2_4_3_2",		"showNameKey": "PINE_TREE",				"flagColor": HQH.COLORPALETTE_AVATAR.COLOR_PLANT,			"clickAudioResource": ""},
AVATARTYPEID_FLOWER2_4_3_3:			{"preloadResource": "Avatar_Flower2_4_3_3",		"showNameKey": "PINE_TREE",				"flagColor": HQH.COLORPALETTE_AVATAR.COLOR_PLANT,			"clickAudioResource": ""},
AVATARTYPEID_FLOWER3_1_2:			{"preloadResource": "Avatar_Flower3_1_2",		"showNameKey": "FLOWERS",				"flagColor": HQH.COLORPALETTE_AVATAR.COLOR_PLANT,			"clickAudioResource": ""},
AVATARTYPEID_FLOWER3_2_2:			{"preloadResource": "Avatar_Flower3_2_2",		"showNameKey": "FLOWERS",				"flagColor": HQH.COLORPALETTE_AVATAR.COLOR_PLANT,			"clickAudioResource": ""},
AVATARTYPEID_FLOWER3_3_2:			{"preloadResource": "Avatar_Flower3_3_2",		"showNameKey": "FLOWERS",				"flagColor": HQH.COLORPALETTE_AVATAR.COLOR_PLANT,			"clickAudioResource": ""},
AVATARTYPEID_FLOWER3_4_2:			{"preloadResource": "Avatar_Flower3_4_2",		"showNameKey": "FLOWERS",				"flagColor": HQH.COLORPALETTE_AVATAR.COLOR_PLANT,			"clickAudioResource": ""},
AVATARTYPEID_FLOWER3_5_2:			{"preloadResource": "Avatar_Flower3_5_2",		"showNameKey": "FLOWERS",				"flagColor": HQH.COLORPALETTE_AVATAR.COLOR_PLANT,			"clickAudioResource": ""},
AVATARTYPEID_FLOWER3_6_2:			{"preloadResource": "Avatar_Flower3_6_2",		"showNameKey": "FLOWERS",				"flagColor": HQH.COLORPALETTE_AVATAR.COLOR_PLANT,			"clickAudioResource": ""},
AVATARTYPEID_FLOWER3_7_2:			{"preloadResource": "Avatar_Flower3_7_2",		"showNameKey": "FLOWERS",				"flagColor": HQH.COLORPALETTE_AVATAR.COLOR_PLANT,			"clickAudioResource": ""},
AVATARTYPEID_FLOWER4_1_2:			{"preloadResource": "Avatar_Flower4_1_2",		"showNameKey": "GRASS",					"flagColor": HQH.COLORPALETTE_AVATAR.COLOR_PLANT,			"clickAudioResource": ""},
AVATARTYPEID_FLOWER4_2_2:			{"preloadResource": "Avatar_Flower4_2_2",		"showNameKey": "GRASS",					"flagColor": HQH.COLORPALETTE_AVATAR.COLOR_PLANT,			"clickAudioResource": ""},
AVATARTYPEID_FLOWER4_3_2:			{"preloadResource": "Avatar_Flower4_3_2",		"showNameKey": "GRASS",					"flagColor": HQH.COLORPALETTE_AVATAR.COLOR_PLANT,			"clickAudioResource": ""},
AVATARTYPEID_FLOWER4_4_2:			{"preloadResource": "Avatar_Flower4_4_2",		"showNameKey": "GRASS",					"flagColor": HQH.COLORPALETTE_AVATAR.COLOR_PLANT,			"clickAudioResource": ""},
AVATARTYPEID_FLOWER4_5_2:			{"preloadResource": "Avatar_Flower4_5_2",		"showNameKey": "GRASS",					"flagColor": HQH.COLORPALETTE_AVATAR.COLOR_PLANT,			"clickAudioResource": ""},
AVATARTYPEID_FLOWER4_6_2:			{"preloadResource": "Avatar_Flower4_6_2",		"showNameKey": "GRASS",					"flagColor": HQH.COLORPALETTE_AVATAR.COLOR_PLANT,			"clickAudioResource": ""},
AVATARTYPEID_FLOWER4_7_2:			{"preloadResource": "Avatar_Flower4_7_2",		"showNameKey": "GRASS",					"flagColor": HQH.COLORPALETTE_AVATAR.COLOR_PLANT,			"clickAudioResource": ""},
AVATARTYPEID_OSMANTHUSTREE1_2:		{"preloadResource": "Avatar_OsmanthusTree1_2",	"showNameKey": "OSMANTHUS_FRAGRANS",	"flagColor": HQH.COLORPALETTE_AVATAR.COLOR_PLANT,			"clickAudioResource": ""},
AVATARTYPEID_OSMANTHUSTREE1_2_2:	{"preloadResource": "Avatar_OsmanthusTree1_2_2","showNameKey": "OSMANTHUS_FRAGRANS",	"flagColor": HQH.COLORPALETTE_AVATAR.COLOR_PLANT,			"clickAudioResource": ""},
AVATARTYPEID_TREE1_3:				{"preloadResource": "Avatar_Tree1_3",			"showNameKey": "BANYAN",				"flagColor": HQH.COLORPALETTE_AVATAR.COLOR_PLANT,			"clickAudioResource": ""},
AVATARTYPEID_TREE1_3_2:				{"preloadResource": "Avatar_Tree1_3_2",			"showNameKey": "BANYAN",				"flagColor": HQH.COLORPALETTE_AVATAR.COLOR_PLANT,			"clickAudioResource": ""},
AVATARTYPEID_TREE1_3_3:				{"preloadResource": "Avatar_Tree1_3_3",			"showNameKey": "BANYAN",				"flagColor": HQH.COLORPALETTE_AVATAR.COLOR_PLANT,			"clickAudioResource": ""},
AVATARTYPEID_TREE1_3_4:				{"preloadResource": "Avatar_Tree1_3_4",			"showNameKey": "BANYAN",				"flagColor": HQH.COLORPALETTE_AVATAR.COLOR_PLANT,			"clickAudioResource": ""},
AVATARTYPEID_TREE1_4:				{"preloadResource": "Avatar_Tree1_4",			"showNameKey": "BANYAN",				"flagColor": HQH.COLORPALETTE_AVATAR.COLOR_PLANT,			"clickAudioResource": ""},
AVATARTYPEID_TREE1_4_2:				{"preloadResource": "Avatar_Tree1_4_2",			"showNameKey": "BANYAN",				"flagColor": HQH.COLORPALETTE_AVATAR.COLOR_PLANT,			"clickAudioResource": ""},
AVATARTYPEID_TREE1_4_3:				{"preloadResource": "Avatar_Tree1_4_3",			"showNameKey": "BANYAN",				"flagColor": HQH.COLORPALETTE_AVATAR.COLOR_PLANT,			"clickAudioResource": ""},
AVATARTYPEID_TREE1_4_4:				{"preloadResource": "Avatar_Tree1_4_4",			"showNameKey": "BANYAN",				"flagColor": HQH.COLORPALETTE_AVATAR.COLOR_PLANT,			"clickAudioResource": ""},
AVATARTYPEID_TREE2_2:				{"preloadResource": "Avatar_Tree2_2",			"showNameKey": "ARAUCARIA",				"flagColor": HQH.COLORPALETTE_AVATAR.COLOR_PLANT,			"clickAudioResource": ""},
AVATARTYPEID_TREE2_3:				{"preloadResource": "Avatar_Tree2_3",			"showNameKey": "ARAUCARIA",				"flagColor": HQH.COLORPALETTE_AVATAR.COLOR_PLANT,			"clickAudioResource": ""},
AVATARTYPEID_TREE3_2:				{"preloadResource": "Avatar_Tree3_2",			"showNameKey": "FIR",					"flagColor": HQH.COLORPALETTE_AVATAR.COLOR_PLANT,			"clickAudioResource": ""},
AVATARTYPEID_TREE3_2_2:				{"preloadResource": "Avatar_Tree3_2_2",			"showNameKey": "FIR",					"flagColor": HQH.COLORPALETTE_AVATAR.COLOR_PLANT,			"clickAudioResource": ""},
AVATARTYPEID_TREE3_3:				{"preloadResource": "Avatar_Tree3_3",			"showNameKey": "FIR",					"flagColor": HQH.COLORPALETTE_AVATAR.COLOR_PLANT,			"clickAudioResource": ""},
AVATARTYPEID_TREE3_3_2:				{"preloadResource": "Avatar_Tree3_3_2",			"showNameKey": "FIR",					"flagColor": HQH.COLORPALETTE_AVATAR.COLOR_PLANT,			"clickAudioResource": ""},
}
#const SWALLOW_POP_LAST_AVATARTYPEID: int = AVATARTYPEID_QIUYU1

const NOTE_DO: int = 1		# 哆（1） 
const NOTE_RE: int = 2		# 来（2）
const NOTE_MI: int = 3		# 咪（3）
const NOTE_FA: int = 4		# 发（4）
const NOTE_SOL: int = 5		# 唆（5）
const NOTE_LA: int = 6		# 啦（6）
const NOTE_SI: int = 7		# 西（7）
const NOTE_INFO_MAP: Dictionary = {
# noteTypeID: noteInfo
	NOTE_DO:	 {"showName": "NOTE_DO"},
	NOTE_RE:	 {"showName": "NOTE_RE"},
	NOTE_MI:	 {"showName": "NOTE_MI"},
	NOTE_FA:	 {"showName": "NOTE_FA"},
	NOTE_SOL:	 {"showName": "NOTE_SOL"},
	NOTE_LA:	 {"showName": "NOTE_LA"},
	NOTE_SI:	 {"showName": "NOTE_SI"},
}
func IsHasNoteInfo(noteTypeID: int) -> bool:
	return NOTE_INFO_MAP.has(noteTypeID)

func GetNoteInfo(noteTypeID: int) -> Dictionary:
	var noteInfo: Dictionary = {}
	if IsHasNoteInfo(noteTypeID):
		noteInfo = NOTE_INFO_MAP.get(noteTypeID)
	else:
		HQH.AssertLog("GetNoteInfo, Invalid noteTypeID: %s" % noteTypeID)
	
	return noteInfo

func GetNoteInfoShowName(noteTypeID: int) -> String:
	return GetNoteInfo(noteTypeID).showName

enum NPC_TRIGGER_TYPE {
	NONE,
	NPC_AVATAR,
	NPC_ARTICLE,
}
#const NPCTRIGGERTYPEID_SNAKE1: int = 1
#const NPCTRIGGERTYPEID_SNAKE2: int = 7
#const NPCTRIGGERTYPEID_SNAKE3: int = 8
#const NPCTRIGGERTYPEID_CLERGY1: int = 17
#const NPCTRIGGERTYPEID_MONSTER_BEGIN: int = 18
#const NPCTRIGGERTYPEID_MONSTER_END: int = 29
const WRANGLEDIALOGTYPEID_ASK_DISCARD: int = 4
const WRANGLEDIALOGTYPEID_BUTLER: int = 5
const WRANGLEDIALOGTYPEID_KING: int = 6
const WRANGLEDIALOGTYPEID_SISTER: int = 87
const NPCTRIGGER_MAP: Dictionary = {
# nPCTriggerTypeID: nPCTriggerInfo
	1:							{"avatarTypeID": AVATARTYPEID_BUTLER,				"nPCManner": HQH.NPC_MANNER_TYPE.NPC_MANNER_FRIENDLY,	"spriteToLeft_flip_h_TimerStep": 1.0,	"wrangleDialogTypeID": WRANGLEDIALOGTYPEID_BUTLER},
	2:							{"avatarTypeID": AVATARTYPEID_KING,					"nPCManner": HQH.NPC_MANNER_TYPE.NPC_MANNER_FRIENDLY,	"spriteToLeft_flip_h_TimerStep": 1.0,	"wrangleDialogTypeID": WRANGLEDIALOGTYPEID_KING},
	3:							{"avatarTypeID": AVATARTYPEID_SISTER,				"nPCManner": HQH.NPC_MANNER_TYPE.NPC_MANNER_FRIENDLY,	"spriteToLeft_flip_h_TimerStep": 1.0,	"wrangleDialogTypeID": WRANGLEDIALOGTYPEID_SISTER},
#NPCTRIGGERTYPEID_SNAKE1:		{"avatarTypeID": AVATARTYPEID_SNAKE1,				"nPCManner": HQH.NPC_MANNER_TYPE.NPC_MANNER_FRIENDLY,	"spriteToLeft_flip_h_TimerStep": 1.0,	"wrangleDialogTypeID": 0},
#	2:							{"avatarTypeID": AVATARTYPEID_PLAYER1,				"nPCManner": HQH.NPC_MANNER_TYPE.NPC_MANNER_FRIENDLY,	"spriteToLeft_flip_h_TimerStep": 1.0,	"wrangleDialogTypeID": 0},
#	3:							{"avatarTypeID": AVATARTYPEID_SILVERCARP1,			"nPCManner": HQH.NPC_MANNER_TYPE.NPC_MANNER_FRIENDLY,	"spriteToLeft_flip_h_TimerStep": 1.0,	"wrangleDialogTypeID": 0},
#	4:							{"avatarTypeID": AVATARTYPEID_DOG1,					"nPCManner": HQH.NPC_MANNER_TYPE.NPC_MANNER_FRIENDLY,	"spriteToLeft_flip_h_TimerStep": 1.0,	"wrangleDialogTypeID": 0},
#	5:							{"avatarTypeID": AVATARTYPEID_SISTER,				"nPCManner": HQH.NPC_MANNER_TYPE.NPC_MANNER_FRIENDLY,	"spriteToLeft_flip_h_TimerStep": 1.0,	"wrangleDialogTypeID": 0},
#	6:							{"avatarTypeID": AVATARTYPEID_DONKEY1,				"nPCManner": HQH.NPC_MANNER_TYPE.NPC_MANNER_FRIENDLY,	"spriteToLeft_flip_h_TimerStep": 1.0,	"wrangleDialogTypeID": 0},
#NPCTRIGGERTYPEID_SNAKE2:		{"avatarTypeID": AVATARTYPEID_SNAKE2,				"nPCManner": HQH.NPC_MANNER_TYPE.NPC_MANNER_FRIENDLY,	"spriteToLeft_flip_h_TimerStep": 0.7,	"wrangleDialogTypeID": 0},
#NPCTRIGGERTYPEID_SNAKE3:		{"avatarTypeID": AVATARTYPEID_SNAKE3,				"nPCManner": HQH.NPC_MANNER_TYPE.NPC_MANNER_FRIENDLY,	"spriteToLeft_flip_h_TimerStep": 0.4,	"wrangleDialogTypeID": 0},
#	9:							{"avatarTypeID": AVATARTYPEID_TORTOISE1,			"nPCManner": HQH.NPC_MANNER_TYPE.NPC_MANNER_FRIENDLY,	"spriteToLeft_flip_h_TimerStep": 2.0,	"wrangleDialogTypeID": 0},
#	10:							{"avatarTypeID": AVATARTYPEID_TURTLE1,				"nPCManner": HQH.NPC_MANNER_TYPE.NPC_MANNER_FRIENDLY,	"spriteToLeft_flip_h_TimerStep": 1.0,	"wrangleDialogTypeID": 0},
#	11:							{"avatarTypeID": AVATARTYPEID_ANGEL1,				"nPCManner": HQH.NPC_MANNER_TYPE.NPC_MANNER_FRIENDLY,	"spriteToLeft_flip_h_TimerStep": 1.0,	"wrangleDialogTypeID": 0},
#	13:							{"avatarTypeID": AVATARTYPEID_HOUSEKEEPER,			"nPCManner": HQH.NPC_MANNER_TYPE.NPC_MANNER_FRIENDLY,	"spriteToLeft_flip_h_TimerStep": 1.0,	"wrangleDialogTypeID": 0},
#	15:							{"avatarTypeID": AVATARTYPEID_QUEEN,				"nPCManner": HQH.NPC_MANNER_TYPE.NPC_MANNER_FRIENDLY,	"spriteToLeft_flip_h_TimerStep": 1.0,	"wrangleDialogTypeID": 0},
#NPCTRIGGERTYPEID_CLERGY1:		{"avatarTypeID": AVATARTYPEID_CLERGY1,				"nPCManner": HQH.NPC_MANNER_TYPE.NPC_MANNER_FRIENDLY,	"spriteToLeft_flip_h_TimerStep": 1.0,	"wrangleDialogTypeID": 0},
#NPCTRIGGERTYPEID_MONSTER_BEGIN:{"avatarTypeID": AVATARTYPEID_MONSTER1,				"nPCManner": HQH.NPC_MANNER_TYPE.NPC_MANNER_FRIENDLY,	"spriteToLeft_flip_h_TimerStep": 1.0,	"wrangleDialogTypeID": 0},
#	19:							{"avatarTypeID": AVATARTYPEID_MONSTER2,				"nPCManner": HQH.NPC_MANNER_TYPE.NPC_MANNER_FRIENDLY,	"spriteToLeft_flip_h_TimerStep": 1.0,	"wrangleDialogTypeID": 0},
#	20:							{"avatarTypeID": AVATARTYPEID_MONSTER3,				"nPCManner": HQH.NPC_MANNER_TYPE.NPC_MANNER_FRIENDLY,	"spriteToLeft_flip_h_TimerStep": 1.0,	"wrangleDialogTypeID": 0},
#	21:							{"avatarTypeID": AVATARTYPEID_MONSTER4,				"nPCManner": HQH.NPC_MANNER_TYPE.NPC_MANNER_FRIENDLY,	"spriteToLeft_flip_h_TimerStep": 1.0,	"wrangleDialogTypeID": 0},
#	22:							{"avatarTypeID": AVATARTYPEID_MONSTER5,				"nPCManner": HQH.NPC_MANNER_TYPE.NPC_MANNER_FRIENDLY,	"spriteToLeft_flip_h_TimerStep": 1.0,	"wrangleDialogTypeID": 0},
#	23:							{"avatarTypeID": AVATARTYPEID_MONSTER6,				"nPCManner": HQH.NPC_MANNER_TYPE.NPC_MANNER_FRIENDLY,	"spriteToLeft_flip_h_TimerStep": 1.0,	"wrangleDialogTypeID": 0},
#	24:							{"avatarTypeID": AVATARTYPEID_MONSTER7,				"nPCManner": HQH.NPC_MANNER_TYPE.NPC_MANNER_FRIENDLY,	"spriteToLeft_flip_h_TimerStep": 1.0,	"wrangleDialogTypeID": 0},
#	25:							{"avatarTypeID": AVATARTYPEID_MONSTER8,				"nPCManner": HQH.NPC_MANNER_TYPE.NPC_MANNER_FRIENDLY,	"spriteToLeft_flip_h_TimerStep": 1.0,	"wrangleDialogTypeID": 0},
#	26:							{"avatarTypeID": AVATARTYPEID_MONSTER9,				"nPCManner": HQH.NPC_MANNER_TYPE.NPC_MANNER_FRIENDLY,	"spriteToLeft_flip_h_TimerStep": 1.0,	"wrangleDialogTypeID": 0},
#	27:							{"avatarTypeID": AVATARTYPEID_MONSTER10,			"nPCManner": HQH.NPC_MANNER_TYPE.NPC_MANNER_FRIENDLY,	"spriteToLeft_flip_h_TimerStep": 1.0,	"wrangleDialogTypeID": 0},
#	28:							{"avatarTypeID": AVATARTYPEID_MONSTER11,			"nPCManner": HQH.NPC_MANNER_TYPE.NPC_MANNER_FRIENDLY,	"spriteToLeft_flip_h_TimerStep": 1.0,	"wrangleDialogTypeID": 0},
#NPCTRIGGERTYPEID_MONSTER_END:	{"avatarTypeID": AVATARTYPEID_MONSTER12,			"nPCManner": HQH.NPC_MANNER_TYPE.NPC_MANNER_FRIENDLY,	"spriteToLeft_flip_h_TimerStep": 1.0,	"wrangleDialogTypeID": 0},
#	30:							{"avatarTypeID": SWALLOW_POP_LAST_AVATARTYPEID,		"nPCManner": HQH.NPC_MANNER_TYPE.NPC_MANNER_FRIENDLY,	"spriteToLeft_flip_h_TimerStep": 1.0,	"wrangleDialogTypeID": 0},
#	31:							{"avatarTypeID": AVATARTYPEID_KING,					"nPCManner": HQH.NPC_MANNER_TYPE.NPC_MANNER_FRIENDLY,	"spriteToLeft_flip_h_TimerStep": 1.0,	"wrangleDialogTypeID": 0},
#	32:							{"avatarTypeID": AVATARTYPEID_QUEEN,				"nPCManner": HQH.NPC_MANNER_TYPE.NPC_MANNER_FRIENDLY,	"spriteToLeft_flip_h_TimerStep": 1.0,	"wrangleDialogTypeID": 0},
#	33:							{"avatarTypeID": AVATARTYPEID_HOUSEKEEPER,			"nPCManner": HQH.NPC_MANNER_TYPE.NPC_MANNER_FRIENDLY,	"spriteToLeft_flip_h_TimerStep": 1.0,	"wrangleDialogTypeID": 0},
#	34:							{"avatarTypeID": AVATARTYPEID_BUTLER,				"nPCManner": HQH.NPC_MANNER_TYPE.NPC_MANNER_FRIENDLY,	"spriteToLeft_flip_h_TimerStep": 1.0,	"wrangleDialogTypeID": 0},
}
const NPCARTICLETRIGGERTYPEID_DOOR8: int = 3
const NPCARTICLETRIGGERTYPEID_DOOR8_2: int = 24
const NPCARTICLETRIGGERTYPEID_DOOR1: int = 25
const NPCARTICLETRIGGERTYPEID_DOOR2: int = 26
const NPCARTICLETRIGGERTYPEID_DOOR3: int = 27
const NPCARTICLETRIGGERTYPEID_ODETOJOY_BEGIN: int = 28
const NPCARTICLETRIGGERTYPEID_ODETOJOY_END: int = 42
const NPCARTICLETRIGGERTYPEID_DOOR6: int = 43
const NPCARTICLETRIGGERTYPEID_DOOR7: int = 44
const NPCARTICLETRIGGERTYPEID_DOOR_HALL_OF_MELODY_MIN: int = 46
const NPCARTICLETRIGGERTYPEID_DOOR_HALL_OF_MELODY_MAX: int = 82
const NPCARTICLETRIGGER_MAP: Dictionary = {
# nPCArticleTriggerTypeID: nPCArticleTriggerInfo
	1:												{"preloadResource": "Scene_Bag",					"showNameKey": "NAME_AVATAR_30",				"wrangleDialogTypeID": 1},
	2:												{"preloadResource": "Item_NumberingRodIcon",		"showNameKey": "GOODS_NAME_NUMBERINGROD",		"wrangleDialogTypeID": 2},
NPCARTICLETRIGGERTYPEID_DOOR8:						{"preloadResource": "Scene_Door8",					"showNameKey": "DOOR_NAME",						"wrangleDialogTypeID": 3},
	4:												{"preloadResource": "Scene_GuideBoard",				"showNameKey": "GUIDE_BOARD",					"wrangleDialogTypeID": 7},
	5:												{"preloadResource": "Scene_RadioCassetteRecorder",	"showNameKey": "RADIO_CASSETTE_RECORDER",		"wrangleDialogTypeID": 8},
	6:												{"preloadResource": "Scene_GuideBoard",				"showNameKey": "GUIDE_BOARD",					"wrangleDialogTypeID": 9},
	7:												{"preloadResource": "Scene_GuideBoard",				"showNameKey": "GUIDE_BOARD",					"wrangleDialogTypeID": 10},
	8:												{"preloadResource": "Scene_GuideBoard",				"showNameKey": "GUIDE_BOARD",					"wrangleDialogTypeID": 11},
	9:												{"preloadResource": "Scene_GuideBoard",				"showNameKey": "GUIDE_BOARD",					"wrangleDialogTypeID": 12},
	10:												{"preloadResource": "Scene_GuideBoard",				"showNameKey": "GUIDE_BOARD",					"wrangleDialogTypeID": 13},
	11:												{"preloadResource": "Scene_GuideBoard",				"showNameKey": "GUIDE_BOARD",					"wrangleDialogTypeID": 14},
	12:												{"preloadResource": "Scene_GuideBoard",				"showNameKey": "GUIDE_BOARD",					"wrangleDialogTypeID": 15},
	13:												{"preloadResource": "Scene_GuideBoard",				"showNameKey": "GUIDE_BOARD",					"wrangleDialogTypeID": 16},
	14:												{"preloadResource": "Scene_GuideBoard",				"showNameKey": "GUIDE_BOARD",					"wrangleDialogTypeID": 17},
	15:												{"preloadResource": "Scene_RadioCassetteRecorder",	"showNameKey": "RADIO_CASSETTE_RECORDER",		"wrangleDialogTypeID": 18},
	16:												{"preloadResource": "Scene_RadioCassetteRecorder",	"showNameKey": "RADIO_CASSETTE_RECORDER",		"wrangleDialogTypeID": 19},
	17:												{"preloadResource": "Scene_RadioCassetteRecorder",	"showNameKey": "RADIO_CASSETTE_RECORDER",		"wrangleDialogTypeID": 20},
	18:												{"preloadResource": "Scene_RadioCassetteRecorder",	"showNameKey": "RADIO_CASSETTE_RECORDER",		"wrangleDialogTypeID": 21},
	19:												{"preloadResource": "Scene_RadioCassetteRecorder",	"showNameKey": "RADIO_CASSETTE_RECORDER",		"wrangleDialogTypeID": 22},
	20:												{"preloadResource": "Scene_RadioCassetteRecorder",	"showNameKey": "RADIO_CASSETTE_RECORDER",		"wrangleDialogTypeID": 23},
	21:												{"preloadResource": "Scene_RadioCassetteRecorder",	"showNameKey": "RADIO_CASSETTE_RECORDER",		"wrangleDialogTypeID": 24},
	22:												{"preloadResource": "Scene_RadioCassetteRecorder",	"showNameKey": "RADIO_CASSETTE_RECORDER",		"wrangleDialogTypeID": 25},
	23:												{"preloadResource": "Scene_RadioCassetteRecorder",	"showNameKey": "RADIO_CASSETTE_RECORDER",		"wrangleDialogTypeID": 26},
NPCARTICLETRIGGERTYPEID_DOOR8_2:					{"preloadResource": "Scene_Door8",					"showNameKey": "DOOR_NAME",						"wrangleDialogTypeID": 27},
NPCARTICLETRIGGERTYPEID_DOOR1:						{"preloadResource": "Scene_Door1",					"showNameKey": "NPCARTICLETRIGGER_NAME_1",		"wrangleDialogTypeID": 28},
NPCARTICLETRIGGERTYPEID_DOOR2:						{"preloadResource": "Scene_Door2",					"showNameKey": "NPCARTICLETRIGGER_NAME_2",		"wrangleDialogTypeID": 29},
NPCARTICLETRIGGERTYPEID_DOOR3:						{"preloadResource": "Scene_Door3",					"showNameKey": "NPCARTICLETRIGGER_NAME_3",		"wrangleDialogTypeID": 30},
NPCARTICLETRIGGERTYPEID_ODETOJOY_BEGIN:				{"preloadResource": "OdeToJoy5_s",					"showNameKey": "SILENT_NOTE_MI",				"wrangleDialogTypeID": 31,		"noteType": NOTE_MI},
	29:												{"preloadResource": "OdeToJoy5_s",					"showNameKey": "SILENT_NOTE_MI",				"wrangleDialogTypeID": 32,		"noteType": NOTE_MI},
	30:												{"preloadResource": "OdeToJoy5_s",					"showNameKey": "SILENT_NOTE_FA",				"wrangleDialogTypeID": 33,		"noteType": NOTE_FA},
	31:												{"preloadResource": "OdeToJoy5_s",					"showNameKey": "SILENT_NOTE_SOL",				"wrangleDialogTypeID": 34,		"noteType": NOTE_SOL},
	32:												{"preloadResource": "OdeToJoy5_s",					"showNameKey": "SILENT_NOTE_SOL",				"wrangleDialogTypeID": 35,		"noteType": NOTE_SOL},
	33:												{"preloadResource": "OdeToJoy5_s",					"showNameKey": "SILENT_NOTE_FA",				"wrangleDialogTypeID": 36,		"noteType": NOTE_FA},
	34:												{"preloadResource": "OdeToJoy5_s",					"showNameKey": "SILENT_NOTE_MI",				"wrangleDialogTypeID": 37,		"noteType": NOTE_MI},
	35:												{"preloadResource": "OdeToJoy5_s",					"showNameKey": "SILENT_NOTE_RE",				"wrangleDialogTypeID": 38,		"noteType": NOTE_RE},
	36:												{"preloadResource": "OdeToJoy5_s",					"showNameKey": "SILENT_NOTE_DO",				"wrangleDialogTypeID": 39,		"noteType": NOTE_DO},
	37:												{"preloadResource": "OdeToJoy5_s",					"showNameKey": "SILENT_NOTE_DO",				"wrangleDialogTypeID": 40,		"noteType": NOTE_DO},
	38:												{"preloadResource": "OdeToJoy5_s",					"showNameKey": "SILENT_NOTE_RE",				"wrangleDialogTypeID": 41,		"noteType": NOTE_RE},
	39:												{"preloadResource": "OdeToJoy5_s",					"showNameKey": "SILENT_NOTE_MI",				"wrangleDialogTypeID": 42,		"noteType": NOTE_MI},
	40:												{"preloadResource": "OdeToJoy6_s",					"showNameKey": "SILENT_NOTE_MI",				"wrangleDialogTypeID": 43,		"noteType": NOTE_MI},
	41:												{"preloadResource": "OdeToJoy7_s",					"showNameKey": "SILENT_NOTE_RE",				"wrangleDialogTypeID": 44,		"noteType": NOTE_RE},
NPCARTICLETRIGGERTYPEID_ODETOJOY_END:				{"preloadResource": "OdeToJoy8_s",					"showNameKey": "SILENT_NOTE_RE",				"wrangleDialogTypeID": 45,		"noteType": NOTE_RE},
NPCARTICLETRIGGERTYPEID_DOOR6:						{"preloadResource": "Scene_Door6",					"showNameKey": "DOOR_1",						"wrangleDialogTypeID": 46},
NPCARTICLETRIGGERTYPEID_DOOR7:						{"preloadResource": "Scene_Door7",					"showNameKey": "DOOR_2",						"wrangleDialogTypeID": 47},
	45:												{"preloadResource": "Scene_GuideBoard",				"showNameKey": "GUIDE_BOARD",					"wrangleDialogTypeID": 48},
NPCARTICLETRIGGERTYPEID_DOOR_HALL_OF_MELODY_MIN:	{"preloadResource": "Castle_Door3",					"showNameKey": "DOOR_3",						"wrangleDialogTypeID": 49},
	47:												{"preloadResource": "Door2",						"showNameKey": "DOOR_3",						"wrangleDialogTypeID": 50},
	48:												{"preloadResource": "Door2_2",						"showNameKey": "DOOR_3",						"wrangleDialogTypeID": 51},
	49:												{"preloadResource": "Door2",						"showNameKey": "DOOR_3",						"wrangleDialogTypeID": 52},
	50:												{"preloadResource": "Door2_2",						"showNameKey": "DOOR_3",						"wrangleDialogTypeID": 53},
	51:												{"preloadResource": "Door2_3",						"showNameKey": "DOOR_3",						"wrangleDialogTypeID": 54},
	52:												{"preloadResource": "Door2_3",						"showNameKey": "DOOR_3",						"wrangleDialogTypeID": 55},
	53:												{"preloadResource": "Door2_3",						"showNameKey": "DOOR_3",						"wrangleDialogTypeID": 56},
	54:												{"preloadResource": "Door2_3",						"showNameKey": "DOOR_3",						"wrangleDialogTypeID": 57},
	55:												{"preloadResource": "Door2_3",						"showNameKey": "DOOR_3",						"wrangleDialogTypeID": 58},
	56:												{"preloadResource": "Door2_3",						"showNameKey": "DOOR_3",						"wrangleDialogTypeID": 59},
	57:												{"preloadResource": "Door2_3",						"showNameKey": "DOOR_3",						"wrangleDialogTypeID": 60},
	58:												{"preloadResource": "Door2_3",						"showNameKey": "DOOR_3",						"wrangleDialogTypeID": 61},
	59:												{"preloadResource": "Door2_3",						"showNameKey": "DOOR_3",						"wrangleDialogTypeID": 62},
	60:												{"preloadResource": "Door2_3",						"showNameKey": "DOOR_3",						"wrangleDialogTypeID": 63},
	61:												{"preloadResource": "Door2_3",						"showNameKey": "DOOR_3",						"wrangleDialogTypeID": 64},
	62:												{"preloadResource": "Door2_3",						"showNameKey": "DOOR_3",						"wrangleDialogTypeID": 65},
	63:												{"preloadResource": "Door2_3",						"showNameKey": "DOOR_3",						"wrangleDialogTypeID": 66},
	64:												{"preloadResource": "Door2_3",						"showNameKey": "DOOR_3",						"wrangleDialogTypeID": 67},
	65:												{"preloadResource": "Door2_3",						"showNameKey": "DOOR_3",						"wrangleDialogTypeID": 68},
	66:												{"preloadResource": "Door2_3",						"showNameKey": "DOOR_3",						"wrangleDialogTypeID": 69},
	67:												{"preloadResource": "Door2_3",						"showNameKey": "DOOR_3",						"wrangleDialogTypeID": 70},
	68:												{"preloadResource": "Door2_3",						"showNameKey": "DOOR_3",						"wrangleDialogTypeID": 71},
	69:												{"preloadResource": "Door2_3",						"showNameKey": "DOOR_3",						"wrangleDialogTypeID": 72},
	70:												{"preloadResource": "Door2_3",						"showNameKey": "DOOR_3",						"wrangleDialogTypeID": 73},
	71:												{"preloadResource": "Door2_3",						"showNameKey": "DOOR_3",						"wrangleDialogTypeID": 74},
	72:												{"preloadResource": "Door2_3",						"showNameKey": "DOOR_3",						"wrangleDialogTypeID": 75},
	73:												{"preloadResource": "Door2_3",						"showNameKey": "DOOR_3",						"wrangleDialogTypeID": 76},
	74:												{"preloadResource": "Door2_3",						"showNameKey": "DOOR_3",						"wrangleDialogTypeID": 77},
	75:												{"preloadResource": "Door2_3",						"showNameKey": "DOOR_3",						"wrangleDialogTypeID": 78},
	76:												{"preloadResource": "Door2_3",						"showNameKey": "DOOR_3",						"wrangleDialogTypeID": 79},
	77:												{"preloadResource": "Door2_3",						"showNameKey": "DOOR_3",						"wrangleDialogTypeID": 80},
	78:												{"preloadResource": "Door2_3",						"showNameKey": "DOOR_3",						"wrangleDialogTypeID": 81},
	79:												{"preloadResource": "Door2_3",						"showNameKey": "DOOR_3",						"wrangleDialogTypeID": 82},
	80:												{"preloadResource": "Door2_3",						"showNameKey": "DOOR_3",						"wrangleDialogTypeID": 83},
	81:												{"preloadResource": "Door2_3",						"showNameKey": "DOOR_3",						"wrangleDialogTypeID": 84},
NPCARTICLETRIGGERTYPEID_DOOR_HALL_OF_MELODY_MAX:	{"preloadResource": "Door2_3",						"showNameKey": "DOOR_3",						"wrangleDialogTypeID": 85},
	83:												{"preloadResource": "PathBG_64x64",					"showNameKey": "NAME_AVATAR_36",				"wrangleDialogTypeID": 86},
#	65:												{"preloadResource": "Scene_ThreeHeadsDragon3",		"showNameKey": "NAME_AVATAR_34",				"wrangleDialogTypeID": 0},
}
const WRANGLEDIALOG_MAP: Dictionary = {
# wrangleDialogTypeID: wrangleDialogInfo
	1:												{"content": "PICK_UP_OR_NOT",						"buttonFunctionYes": "WrangleDialog_1_buttonFunctionYes"},
	2:												{"content": "PICK_UP_OR_NOT",						"buttonFunctionYes": "WrangleDialog_2_buttonFunctionYes"},
	3:												{"content": "OPEN_DOOR_OR_NOT",						"buttonFunctionYes": "WrangleDialog_3_buttonFunctionYes"},
WRANGLEDIALOGTYPEID_ASK_DISCARD:					{"content": "DOWNPANEL_WRANGLEDIALOG_ASK_DISCARD",	"buttonFunctionYes": "WrangleDialog_4_buttonFunctionYes"},
WRANGLEDIALOGTYPEID_BUTLER:							{"content": "GIFT_OR_NOT",							"buttonFunctionYes": "WrangleDialog_5_buttonFunctionYes"},
WRANGLEDIALOGTYPEID_KING:							{"content": "GIFT_OR_NOT",							"buttonFunctionYes": "WrangleDialog_6_buttonFunctionYes"},
	7:												{"function": "WrangleDialog_7_Function"},
	8:												{"function": "WrangleDialog_8_Function"},
	9:												{"function": "WrangleDialog_9_Function"},
	10:												{"function": "WrangleDialog_10_Function"},
	11:												{"function": "WrangleDialog_11_Function"},
	12:												{"function": "WrangleDialog_12_Function"},
	13:												{"function": "WrangleDialog_13_Function"},
	14:												{"function": "WrangleDialog_14_Function"},
	15:												{"function": "WrangleDialog_15_Function"},
	16:												{"function": "WrangleDialog_16_Function"},
	17:												{"function": "WrangleDialog_17_Function"},
	18:												{"function": "WrangleDialog_18_Function"},
	19:												{"function": "WrangleDialog_19_Function"},
	20:												{"function": "WrangleDialog_20_Function"},
	21:												{"function": "WrangleDialog_21_Function"},
	22:												{"function": "WrangleDialog_22_Function"},
	23:												{"function": "WrangleDialog_23_Function"},
	24:												{"function": "WrangleDialog_24_Function"},
	25:												{"function": "WrangleDialog_25_Function"},
	26:												{"function": "WrangleDialog_26_Function"},
	27:												{"content": "OPEN_DOOR_OR_NOT",						"buttonFunctionYes": "WrangleDialog_27_buttonFunctionYes"},
	28:												{"content": "OPEN_DOOR_OR_NOT",						"buttonFunctionYes": "WrangleDialog_28_buttonFunctionYes"},
	29:												{"content": "OPEN_DOOR_OR_NOT",						"buttonFunctionYes": "WrangleDialog_29_buttonFunctionYes"},
	30:												{"content": "OPEN_DOOR_OR_NOT",						"buttonFunctionYes": "WrangleDialog_30_buttonFunctionYes"},
	31:												{"function": "WrangleDialog_31_Function"},
	32:												{"function": "WrangleDialog_32_Function"},
	33:												{"function": "WrangleDialog_33_Function"},
	34:												{"function": "WrangleDialog_34_Function"},
	35:												{"function": "WrangleDialog_35_Function"},
	36:												{"function": "WrangleDialog_36_Function"},
	37:												{"function": "WrangleDialog_37_Function"},
	38:												{"function": "WrangleDialog_38_Function"},
	39:												{"function": "WrangleDialog_39_Function"},
	40:												{"function": "WrangleDialog_40_Function"},
	41:												{"function": "WrangleDialog_41_Function"},
	42:												{"function": "WrangleDialog_42_Function"},
	43:												{"function": "WrangleDialog_43_Function"},
	44:												{"function": "WrangleDialog_44_Function"},
	45:												{"function": "WrangleDialog_45_Function"},
	46:												{"content": "OPEN_DOOR_OR_NOT",						"buttonFunctionYes": "WrangleDialog_46_buttonFunctionYes"},
	47:												{"content": "OPEN_DOOR_OR_NOT",						"buttonFunctionYes": "WrangleDialog_47_buttonFunctionYes"},
	48:												{"function": "WrangleDialog_48_Function"},
	49:												{"content": "OPEN_DOOR_OR_NOT",						"buttonFunctionYes": "WrangleDialog_49_buttonFunctionYes"},
	50:												{"content": "OPEN_DOOR_OR_NOT",						"buttonFunctionYes": "WrangleDialog_50_buttonFunctionYes"},
	51:												{"content": "OPEN_DOOR_OR_NOT",						"buttonFunctionYes": "WrangleDialog_51_buttonFunctionYes"},
	52:												{"content": "OPEN_DOOR_OR_NOT",						"buttonFunctionYes": "WrangleDialog_52_buttonFunctionYes"},
	53:												{"content": "OPEN_DOOR_OR_NOT",						"buttonFunctionYes": "WrangleDialog_53_buttonFunctionYes"},
	54:												{"content": "OPEN_DOOR_OR_NOT",						"buttonFunctionYes": "WrangleDialog_54_buttonFunctionYes"},
	55:												{"content": "OPEN_DOOR_OR_NOT",						"buttonFunctionYes": "WrangleDialog_55_buttonFunctionYes"},
	56:												{"content": "OPEN_DOOR_OR_NOT",						"buttonFunctionYes": "WrangleDialog_56_buttonFunctionYes"},
	57:												{"content": "OPEN_DOOR_OR_NOT",						"buttonFunctionYes": "WrangleDialog_57_buttonFunctionYes"},
	58:												{"content": "OPEN_DOOR_OR_NOT",						"buttonFunctionYes": "WrangleDialog_58_buttonFunctionYes"},
	59:												{"content": "OPEN_DOOR_OR_NOT",						"buttonFunctionYes": "WrangleDialog_59_buttonFunctionYes"},
	60:												{"content": "OPEN_DOOR_OR_NOT",						"buttonFunctionYes": "WrangleDialog_60_buttonFunctionYes"},
	61:												{"content": "OPEN_DOOR_OR_NOT",						"buttonFunctionYes": "WrangleDialog_61_buttonFunctionYes"},
	62:												{"content": "OPEN_DOOR_OR_NOT",						"buttonFunctionYes": "WrangleDialog_62_buttonFunctionYes"},
	63:												{"content": "OPEN_DOOR_OR_NOT",						"buttonFunctionYes": "WrangleDialog_63_buttonFunctionYes"},
	64:												{"content": "OPEN_DOOR_OR_NOT",						"buttonFunctionYes": "WrangleDialog_64_buttonFunctionYes"},
	65:												{"content": "OPEN_DOOR_OR_NOT",						"buttonFunctionYes": "WrangleDialog_65_buttonFunctionYes"},
	66:												{"content": "OPEN_DOOR_OR_NOT",						"buttonFunctionYes": "WrangleDialog_66_buttonFunctionYes"},
	67:												{"content": "OPEN_DOOR_OR_NOT",						"buttonFunctionYes": "WrangleDialog_67_buttonFunctionYes"},
	68:												{"content": "OPEN_DOOR_OR_NOT",						"buttonFunctionYes": "WrangleDialog_68_buttonFunctionYes"},
	69:												{"content": "OPEN_DOOR_OR_NOT",						"buttonFunctionYes": "WrangleDialog_69_buttonFunctionYes"},
	70:												{"content": "OPEN_DOOR_OR_NOT",						"buttonFunctionYes": "WrangleDialog_70_buttonFunctionYes"},
	71:												{"content": "OPEN_DOOR_OR_NOT",						"buttonFunctionYes": "WrangleDialog_71_buttonFunctionYes"},
	72:												{"content": "OPEN_DOOR_OR_NOT",						"buttonFunctionYes": "WrangleDialog_72_buttonFunctionYes"},
	73:												{"content": "OPEN_DOOR_OR_NOT",						"buttonFunctionYes": "WrangleDialog_73_buttonFunctionYes"},
	74:												{"content": "OPEN_DOOR_OR_NOT",						"buttonFunctionYes": "WrangleDialog_74_buttonFunctionYes"},
	75:												{"content": "OPEN_DOOR_OR_NOT",						"buttonFunctionYes": "WrangleDialog_75_buttonFunctionYes"},
	76:												{"content": "OPEN_DOOR_OR_NOT",						"buttonFunctionYes": "WrangleDialog_76_buttonFunctionYes"},
	77:												{"content": "OPEN_DOOR_OR_NOT",						"buttonFunctionYes": "WrangleDialog_77_buttonFunctionYes"},
	78:												{"content": "OPEN_DOOR_OR_NOT",						"buttonFunctionYes": "WrangleDialog_78_buttonFunctionYes"},
	79:												{"content": "OPEN_DOOR_OR_NOT",						"buttonFunctionYes": "WrangleDialog_79_buttonFunctionYes"},
	80:												{"content": "OPEN_DOOR_OR_NOT",						"buttonFunctionYes": "WrangleDialog_80_buttonFunctionYes"},
	81:												{"content": "OPEN_DOOR_OR_NOT",						"buttonFunctionYes": "WrangleDialog_81_buttonFunctionYes"},
	82:												{"content": "OPEN_DOOR_OR_NOT",						"buttonFunctionYes": "WrangleDialog_82_buttonFunctionYes"},
	83:												{"content": "OPEN_DOOR_OR_NOT",						"buttonFunctionYes": "WrangleDialog_83_buttonFunctionYes"},
	84:												{"content": "OPEN_DOOR_OR_NOT",						"buttonFunctionYes": "WrangleDialog_84_buttonFunctionYes"},
	85:												{"content": "OPEN_DOOR_OR_NOT",						"buttonFunctionYes": "WrangleDialog_85_buttonFunctionYes"},
	86:												{"content": "OPEN_DOOR_OR_NOT",						"buttonFunctionYes": "WrangleDialog_86_buttonFunctionYes"},
WRANGLEDIALOGTYPEID_SISTER:							{"content": "START_COUNTING_OR_NOT",				"buttonFunctionYes": "WrangleDialog_87_buttonFunctionYes"},
}

const INPUT_KEY_LETTER_MAP: Dictionary = {
	"KEY_1": "1",
	"KEY_2": "2",
	"KEY_3": "3",
	"KEY_4": "4",
	"KEY_5": "5",
	"KEY_6": "6",
	"KEY_7": "7",
	"KEY_8": "8",
	"KEY_9": "9",
	"KEY_0": "0",
	"KEY_B": "B",
	"KEY_J": "J",
	"KEY_O": "O",
	"KEY_E": "E",
	"KEY_P": "P",
	"KEY_Y": "Y",
	"KEY_N": "N",
}

const GOODSTYPEID_FOOT: int = 1
const GOODSTYPEID_TELESCOPE: int = 2
#const GOODSTYPEID_WIG_BEGIN: int = 3
const GOODSTYPEID_WIG_1: int = 3
const GOODSTYPEID_WIG_2: int = 4
const GOODSTYPEID_WIG_3: int = 5
const GOODSTYPEID_WIG_4: int = 6
#const GOODSTYPEID_WIG_5: int = 7
#const GOODSTYPEID_WIG_6: int = 8
#const GOODSTYPEID_WIG_7: int = 9
#const GOODSTYPEID_WIG_8: int = 10
#const GOODSTYPEID_WIG_9: int = 11
#const GOODSTYPEID_WIG_10: int = 12
#const GOODSTYPEID_WIG_11: int = 13
#const GOODSTYPEID_WIG_12: int = 14
const GOODSTYPEID_WIG_13: int = 15
#const GOODSTYPEID_WIG_14: int = 16
#const GOODSTYPEID_WIG_15: int = 17
#const GOODSTYPEID_WIG_END: int = GOODSTYPEID_WIG_15
const GOODSTYPEID_WIG_LIST: Array = [
	GOODSTYPEID_WIG_2,
	GOODSTYPEID_WIG_3,
	GOODSTYPEID_WIG_4,
	GOODSTYPEID_WIG_13,
]
const GOODSTYPEID_BAG: int = 18
#const GOODSTYPEID_JOURNALRECORDBOOK: int = 19
#const GOODSTYPEID_LETTER3: int = 20
#const GOODSTYPEID_HOUSEKEEPERKEY: int = 21
#const GOODSTYPEID_BUTLERKEY: int = 22
#const GOODSTYPEID_QUEENKEY: int = 23
#const GOODSTYPEID_THREEHEADSDRAGON3: int = 24
#const GOODSTYPEID_WIG_CHANGING_COLOR: int = 25
const GOODSTYPEID_NUMBERINGROD: int = 26
const GOODS_MAP: Dictionary = {
# goodsTypeID: goodsInfo
#GOODSTYPEID_FOOT:					{"goodsName": "GOODS_NAME_1",					"goodsIcon": "Skill_SkillFoot",				"equipTypeID": 0,		"goodsUseFunction": "GoodsUseFunction_Foot",				"goodsAddFunction": "GoodsAddFunction_Foot",			"goodsRemoveFunction": "GoodsRemoveFunction_Foot"},
#GOODSTYPEID_TELESCOPE:				{"goodsName": "GOODS_NAME_2",					"goodsIcon": "Item_Telescope3",				"equipTypeID": 0,		"goodsUseFunction": "GoodsUseFunction_Telescope",			"goodsAddFunction": "GoodsAddFunction_Telescope",		"goodsRemoveFunction": "GoodsRemoveFunction_Telescope"},
GOODSTYPEID_WIG_1:					{"goodsName": "GOODS_NAME_3",					"goodsIcon": "Item_Wig2_BLACK3",			"equipTypeID": 1,		"goodsUseFunction": "GoodsUseFunction_Wig",					"goodsAddFunction": "GoodsAddFunction_Wig",				"goodsRemoveFunction": "GoodsRemoveFunction_Wig"},
GOODSTYPEID_WIG_2:					{"goodsName": "GOODS_NAME_3",					"goodsIcon": "Item_Wig2_RED3",				"equipTypeID": 2,		"goodsUseFunction": "GoodsUseFunction_Wig",					"goodsAddFunction": "GoodsAddFunction_Wig",				"goodsRemoveFunction": "GoodsRemoveFunction_Wig"},
GOODSTYPEID_WIG_3:					{"goodsName": "GOODS_NAME_3",					"goodsIcon": "Item_Wig2_WHITE3",			"equipTypeID": 3,		"goodsUseFunction": "GoodsUseFunction_Wig",					"goodsAddFunction": "GoodsAddFunction_Wig",				"goodsRemoveFunction": "GoodsRemoveFunction_Wig"},
GOODSTYPEID_WIG_4:					{"goodsName": "GOODS_NAME_3",					"goodsIcon": "Item_Wig2_YELLOW3",			"equipTypeID": 4,		"goodsUseFunction": "GoodsUseFunction_Wig",					"goodsAddFunction": "GoodsAddFunction_Wig",				"goodsRemoveFunction": "GoodsRemoveFunction_Wig"},
#GOODSTYPEID_WIG_5:					{"goodsName": "GOODS_NAME_3",					"goodsIcon": "Item_Wig_GRAYISH_BLUE",		"equipTypeID": 5,		"goodsUseFunction": "GoodsUseFunction_Wig",					"goodsAddFunction": "GoodsAddFunction_Wig",				"goodsRemoveFunction": "GoodsRemoveFunction_Wig"},
#GOODSTYPEID_WIG_6:					{"goodsName": "GOODS_NAME_3",					"goodsIcon": "Item_Wig_GRAYISH_BLUE2",		"equipTypeID": 6,		"goodsUseFunction": "GoodsUseFunction_Wig",					"goodsAddFunction": "GoodsAddFunction_Wig",				"goodsRemoveFunction": "GoodsRemoveFunction_Wig"},
#GOODSTYPEID_WIG_7:					{"goodsName": "GOODS_NAME_3",					"goodsIcon": "Item_Wig_GRAYISH_BLUE3",		"equipTypeID": 7,		"goodsUseFunction": "GoodsUseFunction_Wig",					"goodsAddFunction": "GoodsAddFunction_Wig",				"goodsRemoveFunction": "GoodsRemoveFunction_Wig"},
#GOODSTYPEID_WIG_8:					{"goodsName": "GOODS_NAME_3",					"goodsIcon": "Item_Wig_GRAYISH_BLUE4",		"equipTypeID": 8,		"goodsUseFunction": "GoodsUseFunction_Wig",					"goodsAddFunction": "GoodsAddFunction_Wig",				"goodsRemoveFunction": "GoodsRemoveFunction_Wig"},
#GOODSTYPEID_WIG_9:					{"goodsName": "GOODS_NAME_3",					"goodsIcon": "Item_Wig_GRAYISH_BLUE5",		"equipTypeID": 9,		"goodsUseFunction": "GoodsUseFunction_Wig",					"goodsAddFunction": "GoodsAddFunction_Wig",				"goodsRemoveFunction": "GoodsRemoveFunction_Wig"},
#GOODSTYPEID_WIG_10:				{"goodsName": "GOODS_NAME_3",					"goodsIcon": "Item_Wig_GRAYISH_BLUE6",		"equipTypeID": 10,		"goodsUseFunction": "GoodsUseFunction_Wig",					"goodsAddFunction": "GoodsAddFunction_Wig",				"goodsRemoveFunction": "GoodsRemoveFunction_Wig"},
#GOODSTYPEID_WIG_11:				{"goodsName": "GOODS_NAME_3",					"goodsIcon": "Item_Wig_GRAYISH_BLUE7",		"equipTypeID": 11,		"goodsUseFunction": "GoodsUseFunction_Wig",					"goodsAddFunction": "GoodsAddFunction_Wig",				"goodsRemoveFunction": "GoodsRemoveFunction_Wig"},
#GOODSTYPEID_WIG_12:				{"goodsName": "GOODS_NAME_3",					"goodsIcon": "Item_Wig_PALE_YELLOW",		"equipTypeID": 12,		"goodsUseFunction": "GoodsUseFunction_Wig",					"goodsAddFunction": "GoodsAddFunction_Wig",				"goodsRemoveFunction": "GoodsRemoveFunction_Wig"},
GOODSTYPEID_WIG_13:					{"goodsName": "GOODS_NAME_7",					"goodsIcon": "Item_Wig_RED2Long",			"equipTypeID": 13,		"goodsUseFunction": "GoodsUseFunction_Wig",					"goodsAddFunction": "GoodsAddFunction_Wig",				"goodsRemoveFunction": "GoodsRemoveFunction_Wig"},
#GOODSTYPEID_WIG_14:				{"goodsName": "GOODS_NAME_7",					"goodsIcon": "Item_Wig_BLUE2Long",			"equipTypeID": 14,		"goodsUseFunction": "GoodsUseFunction_Wig",					"goodsAddFunction": "GoodsAddFunction_Wig",				"goodsRemoveFunction": "GoodsRemoveFunction_Wig"},
#GOODSTYPEID_WIG_15:				{"goodsName": "GOODS_NAME_7",					"goodsIcon": "Item_Wig_YELLOW2Long",		"equipTypeID": 15,		"goodsUseFunction": "GoodsUseFunction_Wig",					"goodsAddFunction": "GoodsAddFunction_Wig",				"goodsRemoveFunction": "GoodsRemoveFunction_Wig"},
GOODSTYPEID_BAG:					{"goodsName": "NAME_AVATAR_30",					"goodsIcon": "Scene_Bag",					"equipTypeID": 0,		"goodsUseFunction": "",										"goodsAddFunction": "",									"goodsRemoveFunction": ""},
#GOODSTYPEID_JOURNALRECORDBOOK:		{"goodsName": "NAME_AVATAR_31",					"goodsIcon": "Scene_JournalRecordBook",		"equipTypeID": 0,		"goodsUseFunction": "",										"goodsAddFunction": "",									"goodsRemoveFunction": ""},
#GOODSTYPEID_LETTER3:				{"goodsName": "NAME_AVATAR_32",					"goodsIcon": "Scene_Letter3",				"equipTypeID": 0,		"goodsUseFunction": "GoodsUseFunction_Letter3",				"goodsAddFunction": "",									"goodsRemoveFunction": ""},
#GOODSTYPEID_HOUSEKEEPERKEY:		{"goodsName": "GOODS_NAME_HOUSEKEEPERKEY",		"goodsIcon": "DoorKey1_2",					"equipTypeID": 0,		"goodsUseFunction": "GoodsUseFunction_HousekeeperKey",		"goodsAddFunction": "",									"goodsRemoveFunction": ""},
#GOODSTYPEID_BUTLERKEY:				{"goodsName": "GOODS_NAME_BUTLERKEY",			"goodsIcon": "DoorKey2_2",					"equipTypeID": 0,		"goodsUseFunction": "GoodsUseFunction_ButlerKey",			"goodsAddFunction": "",									"goodsRemoveFunction": ""},
#GOODSTYPEID_QUEENKEY:				{"goodsName": "GOODS_NAME_QUEENKEY",			"goodsIcon": "QueenKey2",					"equipTypeID": 0,		"goodsUseFunction": "GoodsUseFunction_QueenKey",			"goodsAddFunction": "",									"goodsRemoveFunction": ""},
#GOODSTYPEID_THREEHEADSDRAGON3:		{"goodsName": "NAME_AVATAR_34",					"goodsIcon": "Scene_ThreeHeadsDragon3",		"equipTypeID": 0,		"goodsUseFunction": "GoodsUseFunction_ThreeHeadsDragon3",	"goodsAddFunction": "",									"goodsRemoveFunction": ""},
#GOODSTYPEID_WIG_CHANGING_COLOR:	{"goodsName": "GOODS_NAME_11",					"goodsIcon": "Item_Wig_CHANGING_COLOR",		"equipTypeID": 16,		"goodsUseFunction": "GoodsUseFunction_Wig",					"goodsAddFunction": "GoodsAddFunction_Wig",				"goodsRemoveFunction": "GoodsRemoveFunction_Wig"},
GOODSTYPEID_NUMBERINGROD:			{"goodsName": "GOODS_NAME_NUMBERINGROD",		"goodsIcon": "Item_NumberingRodIcon",		"equipTypeID": 0,		"goodsUseFunction": "GoodsUseFunction_NumberingRod",		"goodsAddFunction": "",									"goodsRemoveFunction": ""},
}

func _ready():
	var languageName: String = LANGUAGE_NAME_ENGLISH
	var saveLanguageName: String = SaveGameManager.GetSaveData_option_languageName()
	var isFirstTimeSaveGameData: bool = SaveGameManager.GetIsFirstTimeSaveGameData()
	if isFirstTimeSaveGameData:
		saveLanguageName = GetLanguageNameByLocale()
	
	if IsHasLanguage(saveLanguageName):
		languageName = saveLanguageName
	else:
		HQH.AssertLog("Not has saveLanguageName: %s" % saveLanguageName)
	
	SetLanguage(languageName, true)
	
	HQH.SetWindowTitle()

func PrintTable(tableData: Dictionary):
	var tableData_size: int = tableData.size()
	HQH.Log("tableData_size: %s" % tableData_size)
	for k in tableData:
		HQH.Log("%s: %s" % [k, tableData[k]])

func TableGetLineValue(tableData: Dictionary, keyString: String) -> Dictionary:
	var lineValue = {}
	if tableData.has(keyString):
		lineValue = tableData.get(keyString)
	
	return lineValue

func TableGetValue(tableData: Dictionary, keyString: String, columnName: String) -> String:
	var valueString = ""
	var lineValue: Dictionary = TableGetLineValue(tableData, keyString)
	if lineValue:
		if lineValue.has(columnName):
			valueString = lineValue.get(columnName)
	
	return valueString

func LoadTable(fileName: String, tableDataInfo: Dictionary, tableData: Dictionary, keyIndex: int):
	var filePath: String = "res://Table/%s.csv" % fileName
	var fileHandle = File.new()
	if not fileHandle.file_exists(filePath):
		HQH.AssertLog("LoadTable, NOT EXIST FILE: %s " % filePath)
		
		return
	
	var openFileResult = fileHandle.open(filePath, File.READ)
	if OK != openFileResult:
		HQH.AssertLog("LoadTable, FAILED OPEN FILE: %s " % filePath)
		
		fileHandle.close()
		
		return
	
	# 跳过第一行
	fileHandle.get_csv_line()
	
	while not fileHandle.eof_reached():
		var fileline: PoolStringArray = fileHandle.get_csv_line()
#		HQH.Log("filePath: %s, fileline.size(): %d, fileline: %s" % [filePath, fileline.size(), fileline])
		if 1 < fileline.size():
			var dataTemp: Dictionary = {}
			var index: int = 0
			for k in tableDataInfo:
				dataTemp[k] = fileline[index]
				index = index + 1
			
			if HQH.IS_DEBUG:
				if tableData.has(fileline[keyIndex]):
					HQH.AssertLog("Has same key, file name: %s, string key: %s" % [fileName, fileline[keyIndex]])
			
			tableData[fileline[keyIndex]] = dataTemp
	
	fileHandle.close()

func PrintDictionaryTable_EquipTable1():
	HQH.Log("PrintDictionaryTable_EquipTable1:")
	PrintTable(m_EquipTable1_Data)

func TableGetValue_EquipTable1_Base(key: int, dataKey: String) -> String:
	var valueString: String = ""
	if m_EquipTable1_Data.has(key):
		var lineValue: Dictionary = m_EquipTable1_Data.get(key)
		if lineValue:
			if lineValue.has(dataKey):
				valueString = lineValue.get(dataKey)
	
	return valueString

func TableGetValue_EquipTable1_ColorString(key: int) -> String:
	var valueString: String = TableGetValue_EquipTable1_Base(key, EQUIPTABLE1_DATA_DATA_KEY_COLOR)
	var color: Color = HQH.COLORPALETTE_EQUIP.get(valueString)
	var colorString: String = color.to_html()
	
	return colorString

func TableGetValue_EquipTable1_PreloadResourcePath(key: int) -> String:
	var preloadResourcePath: String = TableGetValue_EquipTable1_Base(key, EQUIPTABLE1_DATA_DATA_KEY_FILENAME)
	
	return preloadResourcePath

func TableGetValue_EquipTable1_IsHasKey(keyString: int) -> bool:
	return m_EquipTable1_Data.has(keyString)

func PrintDictionaryTable(tableData: Dictionary):
	for k in tableData:
		HQH.Log("%s: %s" % [k, tableData[k]])

func DictionaryTableGetValue(tableData: Dictionary, keyString: String) -> String:
	var valueString = tableData.get(keyString)
	if not valueString:
		valueString = ""
	
	return valueString

func LoadDictionaryTable(fileName: String, tableData: Dictionary):
	var filePath: String = "res://Table/%s.csv" % fileName
	var fileHandle = File.new()
	if not fileHandle.file_exists(filePath):
		HQH.AssertLog("LoadDictionaryTable, NOT EXIST FILE: %s " % filePath)
		
		return
	
	var openFileResult = fileHandle.open(filePath, File.READ)
	if OK != openFileResult:
		HQH.AssertLog("LoadDictionaryTable, FAILED OPEN FILE: %s " % filePath)
		
		fileHandle.close()
		
		return
	
	# 跳过第一行
	fileHandle.get_csv_line()
	
	var placeHolderMap: Dictionary = {}
	
#	var fileLineNumber: int = 1
	while not fileHandle.eof_reached():
		var fileline: PoolStringArray = fileHandle.get_csv_line()
#		HQH.Log("filePath: %s[%d], fileline.size(): %d, fileline: %s" % [filePath, fileLineNumber, fileline.size(), fileline])
		if 2 != fileline.size():
#			HQH.Log("JUMP ONE FILE LINE, filePath: %s[%d], fileline.size(): %d, fileline: %s" % [filePath, fileLineNumber, fileline.size(), fileline])
			
			break
		
		if HQH.IS_DEBUG:
			if CHARACTER_SPACE in fileline[0]:
				HQH.AssertLog("Key Has CHARACTER_SPACE, file name: %s, string key: %s" % [fileName, fileline[0]])
			
			if tableData.has(fileline[0]):
				HQH.AssertLog("Has same key, file name: %s, string key: %s" % [fileName, fileline[0]])
		
		if DISPLAYED_LINE_BREAK in fileline[1]:
			# Deal \n
			tableData[fileline[0]] = fileline[1].replace(DISPLAYED_LINE_BREAK, LINE_BREAK)
		else:
			tableData[fileline[0]] = fileline[1]
		
#		fileLineNumber = fileLineNumber + 1
		
		if IsHas_DICTIONARYTABLE_PLACEHOLDER(fileline[1]):
			placeHolderMap[fileline[0]] = tableData[fileline[0]]
	
	fileHandle.close()
	
	# Deal placeHolderMap
	for k in placeHolderMap:
#		HQH.Log("placeHolderMap, k: %s, placeHolderMap[k]: %s" % [k, placeHolderMap[k]])
		var subStringMap: Dictionary = GetSubStringMapFromDictionaryTablePlaceHolderString(placeHolderMap[k])
		var layDownString: String = GetLanguageString(k).format(subStringMap)
#		HQH.Log("layDownString: %s" % [layDownString])
		tableData[k] = layDownString
 
func IsHas_LOCALE_LANGUAGE_MAP(localeName: String) -> bool:
	return LOCALE_LANGUAGE_MAP.has(localeName)

func GetLanguageName_From_LOCALE_LANGUAGE_MAP(localeName: String) -> String:
	var languageName: String = LANGUAGE_NAME_ENGLISH
	if IsHas_LOCALE_LANGUAGE_MAP(localeName):
		languageName = LOCALE_LANGUAGE_MAP.get(localeName)
	else:
		HQH.AssertLog("GetLanguageName_From_LOCALE_LANGUAGE_MAP, Invalid localeName: %s" % localeName)
	
	return languageName

func GetLanguageNameByLocale() -> String:
	var localeLanguageName: String = GetLanguageName_From_LOCALE_LANGUAGE_MAP(OS.get_locale())
	if LANGUAGE_NAME_CHINESE != localeLanguageName:
		localeLanguageName = LANGUAGE_NAME_ENGLISH
	
	return localeLanguageName

func SetLanguage(languageName: String, isNeeSaveGame: bool):
	if IsHasLanguage(languageName) and (languageName != m_CurrentLanguageName):
		ClearCurrentLanguageTableData()
		
		m_CurrentLanguageName = languageName
		HQH.Log("Set Current Language: %s" % m_CurrentLanguageName)
		
		LoadCurrentLanguageTable()
		
		if isNeeSaveGame:
			SaveGameManager.SetSaveData_option_languageName(m_CurrentLanguageName)

func ClearCurrentLanguageTableData():
	if not IsHasLanguage(m_CurrentLanguageName):
		return
	
	var languageDataInfo: Dictionary = GetLanguageDataInfo(m_CurrentLanguageName)
	languageDataInfo.languageTableData.clear()

func IsHasLanguage(languageName: String) -> bool:
	return m_LanguageTableMap.has(languageName)

func GetLanguageDataInfo(languageName: String) -> Dictionary:
	var languageDataInfo: Dictionary = {}
	if IsHasLanguage(languageName):
		languageDataInfo = m_LanguageTableMap.get(languageName)
	else:
		HQH.AssertLog("GetLanguageDataInfo, Invalid languageName: %s" % languageName)
	
	return languageDataInfo

func GetAllLanguageName() -> Array:
	return m_LanguageTableMap.keys()

func LoadCurrentLanguageTable():
	var languageDataInfo: Dictionary = GetLanguageDataInfo(m_CurrentLanguageName)
	for iv in languageDataInfo.languageTableNameList:
		LoadDictionaryTable(iv, languageDataInfo.languageTableData)

func PrintCurrentLanguageTable():
	var languageDataInfo: Dictionary = GetLanguageDataInfo(m_CurrentLanguageName)
	PrintDictionaryTable(languageDataInfo.languageTableData)

func GetCurrentLanguageName() -> String:
	return m_CurrentLanguageName

func IsHasLanguageString(stringKey: String) -> bool:
	var languageDataInfo: Dictionary = GetLanguageDataInfo(m_CurrentLanguageName)
	var isHas = languageDataInfo.languageTableData.has(stringKey)
	
	return isHas

func GetLanguageString(stringKey: String) -> String:
	var languageDataInfo: Dictionary = GetLanguageDataInfo(m_CurrentLanguageName)
	var stringValue: String = DictionaryTableGetValue(languageDataInfo.languageTableData, stringKey)
	
	return stringValue

func IsHas_DICTIONARYTABLE_PLACEHOLDER(filelineString: String) -> bool:
	return DICTIONARYTABLE_PLACEHOLDER_BEGIN in filelineString

func GetSubStringMapFromDictionaryTablePlaceHolderString(placeHolderString: String) -> Dictionary:
	var subStringFrom: int = 0
	var placeHolderLength: int = placeHolderString.length()
	var subStringMap: Dictionary = {}
	while true:
		var subStringBegin: int = placeHolderString.find(DICTIONARYTABLE_PLACEHOLDER_BEGIN, subStringFrom)
		if 0 > subStringBegin:
			break
		
		var subStringEnd: int = placeHolderString.find(DICTIONARYTABLE_PLACEHOLDER_END, subStringFrom)
		if 0 > subStringEnd:
			break
		
		var subStringBeginLengthIndex: int = subStringBegin + DICTIONARYTABLE_PLACEHOLDER_BEGIN_LENGTH
		var subString: String = placeHolderString.substr(subStringBeginLengthIndex, subStringEnd - subStringBeginLengthIndex)
#		HQH.Log("subString: %s" % [subString])
		subStringMap[subString] = GetLanguageString(subString)
		
		subStringFrom = subStringEnd + DICTIONARYTABLE_PLACEHOLDER_END_LENGTH
		if placeHolderLength <= (subStringFrom + (DICTIONARYTABLE_PLACEHOLDER_BEGIN_LENGTH + DICTIONARYTABLE_PLACEHOLDER_END_LENGTH)):
			break
	
	return subStringMap

func IsHas_PRELOAD_RESOURCE_MAP(keyString:String) -> bool:
	return PRELOAD_RESOURCE_MAP.has(keyString)

func Get_PRELOAD_RESOURCE_MAP(keyString:String) -> Resource:
	var preloadResource: Resource = null
	if IsHas_PRELOAD_RESOURCE_MAP(keyString):
		preloadResource = PRELOAD_RESOURCE_MAP.get(keyString)
	else:
		HQH.AssertLog("Get_PRELOAD_RESOURCE_MAP, Invalid keyString: %s" % keyString)
	
	return preloadResource

func GetKeysSize_AUDIO_INFO_LIST_keys() -> int:
	return AUDIO_INFO_LIST.keys().size()

func GetNameByIndex_AUDIO_INFO_LIST_keys(index: int) -> String:
	var keysSize: int = GetKeysSize_AUDIO_INFO_LIST_keys()
	if (0 <= index) and (keysSize > index):
		return AUDIO_INFO_LIST.keys()[index]
	
	HQH.AssertLog("index: %s is out of range AUDIO_INFO_LIST.keys().size(): %s" % [index, keysSize])
	
	return ""

func IsHas_AUDIO_INFO_LIST(audioName: String) -> bool:
	return AUDIO_INFO_LIST.has(audioName)

func GetInfoByName_AUDIO_INFO_LIST(audioName: String) -> Dictionary:
	var audioInfo: Dictionary = {}
	if IsHas_AUDIO_INFO_LIST(audioName):
		audioInfo = AUDIO_INFO_LIST.get(audioName)
	else:
		HQH.AssertLog("GetInfoByName_AUDIO_INFO_LIST, Invalid audioName: %s" % audioName)
	
	return audioInfo

func IsHasSceneInfo(sceneTypeID: int) -> bool:
	return SCENE_INFO_MAP.has(sceneTypeID)

func GetSceneInfo(sceneTypeID: int) -> Dictionary:
	var sceneInfo: Dictionary = {}
	if IsHasSceneInfo(sceneTypeID):
		sceneInfo = SCENE_INFO_MAP.get(sceneTypeID)
	else:
		HQH.AssertLog("GetSceneInfo, Invalid sceneTypeID: %s" % sceneTypeID)
	
	return sceneInfo

func GetSceneName(sceneTypeID: int) -> String:
	return GetSceneInfo(sceneTypeID).sceneName

func GetSceneTypeID(sceneName: String) -> int:
	var sceneTypeID: int = 0
	for k in SCENE_INFO_MAP:
		if sceneName == SCENE_INFO_MAP[k].sceneName:
			sceneTypeID = k
			
			break
	
	return sceneTypeID

func GetNode2DAvatarName(sceneTypeID: int) -> String:
	return GetSceneInfo(sceneTypeID).node2DAvatarName

func GetBGMusicName(sceneTypeID: int) -> String:
	var BGMusicName: String = ""
	var sceneInfo: Dictionary = GetSceneInfo(sceneTypeID)
	var BGMusicNameList: String = "BGMusicNameList"
	if sceneInfo.has(BGMusicNameList):
		BGMusicName = sceneInfo[BGMusicNameList][HQH.Random0Max(sceneInfo[BGMusicNameList].size() - 1)]
	else:
		BGMusicName = sceneInfo.BGMusicName
	
	return BGMusicName

func GetSceneShowNameKey(sceneTypeID: int) -> String:
	return GetSceneInfo(sceneTypeID).showNameKey

func IsHasAvatarType(avatarTypeID: int) -> bool:
	return AVATAR_TYPE_MAP.has(avatarTypeID)

func GetAvatarTypeInfo(avatarTypeID: int) -> Dictionary:
	var avatarTypeInfo: Dictionary = {}
	if IsHasAvatarType(avatarTypeID):
		avatarTypeInfo = AVATAR_TYPE_MAP.get(avatarTypeID)
	else:
		HQH.AssertLog("GetAvatarTypeInfo, Invalid avatarTypeID: %s" % avatarTypeID)
	
	return avatarTypeInfo

func GetAvatarTypeMapSize() -> int:
	return AVATAR_TYPE_MAP.size()

func GetAvatarTypeMap() -> Dictionary:
	return AVATAR_TYPE_MAP

func IsHasNPCTrigger(nPCTriggerTypeID: int) -> bool:
	return NPCTRIGGER_MAP.has(nPCTriggerTypeID)

func GetNPCTriggerInfo(nPCTriggerTypeID: int) -> Dictionary:
	var nPCTriggerInfo: Dictionary = {}
	if IsHasNPCTrigger(nPCTriggerTypeID):
		nPCTriggerInfo = NPCTRIGGER_MAP.get(nPCTriggerTypeID)
	else:
		HQH.AssertLog("GetNPCTriggerInfo, Invalid nPCTriggerTypeID: %s" % nPCTriggerTypeID)
	
	return nPCTriggerInfo

func GetNPCTriggerInfoByWrangleDialogTypeID(wrangleDialogTypeID: int) -> Dictionary:
	var nPCTriggerInfo: Dictionary = {}
	for k in NPCTRIGGER_MAP:
		if wrangleDialogTypeID == NPCTRIGGER_MAP[k].wrangleDialogTypeID:
			nPCTriggerInfo = NPCTRIGGER_MAP[k]
			
			break
	
	return nPCTriggerInfo

func GetNPCTriggerTypeIDByAvatarTypeID(avatarTypeID: int) -> int:
	var nPCTriggerTypeID: int = 0
	for k in NPCTRIGGER_MAP:
		if avatarTypeID == NPCTRIGGER_MAP[k].avatarTypeID:
			nPCTriggerTypeID = k
			
			break
	
	return nPCTriggerTypeID

func IsHasNPCArticleTrigger(nPCArticleTriggerTypeID: int) -> bool:
	return NPCARTICLETRIGGER_MAP.has(nPCArticleTriggerTypeID)

func GetNPCArticleTriggerInfo(nPCArticleTriggerTypeID: int) -> Dictionary:
	var nPCArticleTriggerInfo: Dictionary = {}
	if IsHasNPCArticleTrigger(nPCArticleTriggerTypeID):
		nPCArticleTriggerInfo = NPCARTICLETRIGGER_MAP.get(nPCArticleTriggerTypeID)
	else:
		HQH.AssertLog("GetNPCArticleTriggerInfo, Invalid nPCArticleTriggerTypeID: %s" % nPCArticleTriggerTypeID)
	
	return nPCArticleTriggerInfo

func GetNPCArticleTriggerInfoShowNameKey(nPCArticleTriggerTypeID: int) -> String:
	return GetNPCArticleTriggerInfo(nPCArticleTriggerTypeID).showNameKey

func GetNPCArticleTriggerInfoNoteType(nPCArticleTriggerTypeID: int) -> int:
	return GetNPCArticleTriggerInfo(nPCArticleTriggerTypeID).noteType

func GetNPCArticleTriggerInfoByWrangleDialogTypeID(wrangleDialogTypeID: int) -> Dictionary:
	var nPCArticleTriggerInfo: Dictionary = {}
	for k in NPCARTICLETRIGGER_MAP:
		if wrangleDialogTypeID == NPCARTICLETRIGGER_MAP[k].wrangleDialogTypeID:
			nPCArticleTriggerInfo = NPCARTICLETRIGGER_MAP[k]
			
			break
	
	return nPCArticleTriggerInfo

func GetWrangleDialogInfo(wrangleDialogTypeID: int) -> Dictionary:
	var wrangleDialogInfo: Dictionary = {}
	if WRANGLEDIALOG_MAP.has(wrangleDialogTypeID):
		wrangleDialogInfo = WRANGLEDIALOG_MAP.get(wrangleDialogTypeID)
	else:
		HQH.AssertLog("GetWrangleDialogInfo, Invalid wrangleDialogTypeID: %s" % wrangleDialogTypeID)
	
	return wrangleDialogInfo

func GetWrangleDialogInfoContent(wrangleDialogTypeID: int) -> String:
	var content: String = ""
	var wrangleDialogInfo: Dictionary = GetWrangleDialogInfo(wrangleDialogTypeID)
	if not wrangleDialogInfo.empty():
		content = wrangleDialogInfo.content
	
	return content

func GetWrangleDialogInfoFunction(wrangleDialogTypeID: int) -> String:
	var wrangleDialogInfo_function: String = ""
	var wrangleDialogInfo: Dictionary = GetWrangleDialogInfo(wrangleDialogTypeID)
	if not wrangleDialogInfo.empty():
		var function: String = "function"
		if wrangleDialogInfo.has(function):
			wrangleDialogInfo_function = wrangleDialogInfo[function]
	
	return wrangleDialogInfo_function

#func GetWrangleDialogInfoButton(wrangleDialogTypeID: int, index: int) -> String:
#	var wrangleDialogInfo_button: String = ""
#	var wrangleDialogInfo: Dictionary = GetWrangleDialogInfo(wrangleDialogTypeID)
#	if (0 <= index) and (UIManager.WRANGLEDIALOG_NUMBER_MAX > index):
#		var button: String = "button%s" % (index + 1)
#		if wrangleDialogInfo.has(button):
#			wrangleDialogInfo_button = wrangleDialogInfo[button]
#
#	return wrangleDialogInfo_button

#func GetWrangleDialogInfoButtonString(wrangleDialogTypeID: int, index: int) -> String:
#	var wrangleDialogInfo_buttonString: String = ""
#	var wrangleDialogInfo_button: String = GetWrangleDialogInfoButton(wrangleDialogTypeID, index)
#	if not wrangleDialogInfo_button.empty():
#		wrangleDialogInfo_buttonString = GetLanguageString(wrangleDialogInfo_button)
#
#	return wrangleDialogInfo_buttonString

func GetWrangleDialogInfoButtonFunction(wrangleDialogTypeID: int, buttonFunction: String) -> String:
	var wrangleDialogInfo_buttonFunction: String = ""
	var wrangleDialogInfo: Dictionary = GetWrangleDialogInfo(wrangleDialogTypeID)
	if not wrangleDialogInfo.empty():
		if wrangleDialogInfo.has(buttonFunction):
			wrangleDialogInfo_buttonFunction = wrangleDialogInfo[buttonFunction]
	
	return wrangleDialogInfo_buttonFunction

func GetWrangleDialogInfoButtonFunctionYes(wrangleDialogTypeID: int) -> String:
	return GetWrangleDialogInfoButtonFunction(wrangleDialogTypeID, "buttonFunctionYes")

func GetWrangleDialogInfoButtonFunctionNo(wrangleDialogTypeID: int) -> String:
	return GetWrangleDialogInfoButtonFunction(wrangleDialogTypeID, "buttonFunctionNo")

#func GetWrangleDialogInfoChoiceWrangleDialogTypeID(wrangleDialogTypeID: int, index: int) -> int:
#	var choiceWrangleDialogTypeID: int = 0
#	var wrangleDialogInfo: Dictionary = GetWrangleDialogInfo(wrangleDialogTypeID)
#	if (0 <= index) and (UIManager.WRANGLEDIALOG_NUMBER_MAX > index) and (wrangleDialogInfo.choiceList.size() > index):
#		choiceWrangleDialogTypeID = wrangleDialogInfo.choiceList[index]
#
#	return choiceWrangleDialogTypeID

#func GetWrangleDialogInfoIsSaveChoice(wrangleDialogTypeID: int) -> bool:
#	var isSaveChoice: bool = false
#	var wrangleDialogInfo: Dictionary = GetWrangleDialogInfo(wrangleDialogTypeID)
#	if wrangleDialogInfo.has("isSaveChoice"):
#		isSaveChoice = wrangleDialogInfo.isSaveChoice
#
#	return isSaveChoice

func GetAvatarHeadPortraitResourceName(avatarTypeID: int) -> String:
	return GetAvatarTypeInfo(avatarTypeID).headPortraitResource

func GetAvatarHeadIconResourceName(avatarTypeID: int) -> String:
	return GetAvatarTypeInfo(avatarTypeID).headIconResource

func GetAvatarShowName(avatarTypeID: int) -> String:
	return GetLanguageString(GetAvatarShowNameKey(avatarTypeID))

func GetAvatarShowNameKey(avatarTypeID: int) -> String:
	return GetAvatarTypeInfo(avatarTypeID).showNameKey

func GetAvatarFlagColor(avatarTypeID: int) -> Color:
	return GetAvatarTypeInfo(avatarTypeID).flagColor

#func GetAvatarDescription(avatarTypeID: int) -> String:
#	return GetLanguageString(GetAvatarTypeInfo(avatarTypeID).avatarDescription)

func GetAvatarClickAudioResource(avatarTypeID: int) -> String:
	return GetAvatarTypeInfo(avatarTypeID).clickAudioResource

#func GetAvatarAudioLengthInSeconds(avatarTypeID: int) -> float:
#	return GetAvatarTypeInfo(avatarTypeID).audioLengthInSeconds

func GetAvatarPowerMin(avatarTypeID: int) -> int:
	return GetAvatarTypeInfo(avatarTypeID).powerMin

func GetAvatarPowerMax(avatarTypeID: int) -> int:
	return GetAvatarTypeInfo(avatarTypeID).powerMax

func GetAvatarCheckConditionFunction(avatarTypeID: int) -> String:
	return GetAvatarTypeInfo(avatarTypeID).checkConditionFunction

func GetAvatarConditionFalsePowerMin(avatarTypeID: int) -> int:
	return GetAvatarTypeInfo(avatarTypeID).conditionFalsePowerMin

func GetAvatarConditionFalsePowerMax(avatarTypeID: int) -> int:
	return GetAvatarTypeInfo(avatarTypeID).conditionFalsePowerMax
	
func GetAvatarIsSameAsAvatarPower(avatarTypeID: int) -> bool:
	return GetAvatarTypeInfo(avatarTypeID).isSameAsAvatarPower

func GetAvatarPlayChessStartWordsKey(avatarTypeID: int) -> String:
	return GetAvatarTypeInfo(avatarTypeID).playChessStartWordsKey

func GetAvatarPlayChessSuccessFunction(avatarTypeID: int) -> String:
	return GetAvatarTypeInfo(avatarTypeID).playChessSuccessFunction

func GetAvatarPlayChessFailureFunction(avatarTypeID: int) -> String:
	return GetAvatarTypeInfo(avatarTypeID).playChessFailureFunction

func GetAvatarWrangleDialogTypeID_Swallow(avatarTypeID: int) -> int:
	return avatarTypeID
#	return GetAvatarTypeInfo(avatarTypeID).wrangleDialogTypeID_Swallow

func IsHasGoods(goodsTypeID: int) -> bool:
	return GOODS_MAP.has(goodsTypeID)

func GetGoodsInfo(goodsTypeID: int) -> Dictionary:
	var goodsInfo = {}
	if IsHasGoods(goodsTypeID):
		goodsInfo = GOODS_MAP.get(goodsTypeID)
	else:
		HQH.AssertLog("GetGoodsInfo, Invalid goodsTypeID: %s" % goodsTypeID)
	
	return goodsInfo

func GetGoodsInfoGoodsName(goodsTypeID: int) -> String:
	return GetGoodsInfo(goodsTypeID).goodsName

func GetGoodsInfoByEquipTypeID(equipTypeID: int) -> Dictionary:
	var goodsInfo = {}
	for k in GOODS_MAP:
		if equipTypeID == GOODS_MAP.get(k).equipTypeID:
			goodsInfo = GOODS_MAP.get(k)
			
			break
	
	return goodsInfo

# AffixKey number range [AFFIXKEYCOUNT_MIN, AFFIXKEYCOUNT_MAX)
const AFFIXKEYCOUNT_MIN: int = 1
const AFFIXKEYCOUNT_MAX: int = 100
func GetAffixKeyCount(affixKey: String) -> int:
	var affixKeyCount: int = 0
	for i in range(AFFIXKEYCOUNT_MIN, AFFIXKEYCOUNT_MAX):
		var stringKey: String = "%s%s" % [affixKey, i]
		var isHas: bool = IsHasLanguageString(stringKey)
		if isHas:
			affixKeyCount += 1
		else:
			# AffixKey must continuous
			break
	
	if HQH.IS_DEBUG:
		if 0 == affixKeyCount:
			HQH.AssertLog("GetAffixKeyCount, 0 == affixKeyCount, affixKey: %s" % affixKey)
	
	return affixKeyCount

func GetAffixKeyRandom(affixKey: String) -> String:
	var affixKeyCount: int = GetAffixKeyCount(affixKey)
	var affixKeyNumber: int = HQH.RandomModRange(1, affixKeyCount)
	
	return "%s%s" % [affixKey, affixKeyNumber]

func GetAffixKeyRandomString(affixKey: String) -> String:
	var affixKeyRandom: String = GetAffixKeyRandom(affixKey)
	
	return GetLanguageString(affixKeyRandom)

const AUDIO_SOUND_EFFECT_SHEEP_ID_MAX: int = 39
func GetAudioSoundEffectSheepNameByID(ID: int) -> String:
	var audioSoundEffectSheepName: String = ""
	match ID:
		1:
			audioSoundEffectSheepName = "Audio_SoundEffect_Sheep-104788_2"
		
		2:
			audioSoundEffectSheepName = "Audio_SoundEffect_Sheep-122256_2"
		
		3:
			audioSoundEffectSheepName = "Audio_SoundEffect_Sheep-2-106164"
		
		4:
			audioSoundEffectSheepName = "Audio_SoundEffect_Sheep-3-89230"
		
		5:
			audioSoundEffectSheepName = "Audio_SoundEffect_Sheep-bleat-60778_2"
		
		6:
			audioSoundEffectSheepName = "Audio_SoundEffect_Sheep-bleat-60778_3"
		
		7:
			audioSoundEffectSheepName = "Audio_SoundEffect_Sheep-bleat-60778_4"
		
		8:
			audioSoundEffectSheepName = "Audio_SoundEffect_Sheep-bleat-60778_5"
		
		9:
			audioSoundEffectSheepName = "Audio_SoundEffect_Sheep-bleating-31117_2"
		
		10:
			audioSoundEffectSheepName = "Audio_SoundEffect_Sheep-bleating-31117_3"
		
		11:
			audioSoundEffectSheepName = "Audio_SoundEffect_Sheep-bleating-31117_4"
		
		12:
			audioSoundEffectSheepName = "Audio_SoundEffect_Sheep-bleating-31117_5"
		
		13:
			audioSoundEffectSheepName = "Audio_SoundEffect_Sheep-bleating-dry-grass-77954_10"
		
		14:
			audioSoundEffectSheepName = "Audio_SoundEffect_Sheep-bleating-dry-grass-77954_11"
		
		15:
			audioSoundEffectSheepName = "Audio_SoundEffect_Sheep-bleating-dry-grass-77954_12"
		
		16:
			audioSoundEffectSheepName = "Audio_SoundEffect_Sheep-bleating-dry-grass-77954_2"
		
		17:
			audioSoundEffectSheepName = "Audio_SoundEffect_Sheep-bleating-dry-grass-77954_3"
		
		18:
			audioSoundEffectSheepName = "Audio_SoundEffect_Sheep-bleating-dry-grass-77954_4"
		
		19:
			audioSoundEffectSheepName = "Audio_SoundEffect_Sheep-bleating-dry-grass-77954_5"
		
		20:
			audioSoundEffectSheepName = "Audio_SoundEffect_Sheep-bleating-dry-grass-77954_6"
		
		21:
			audioSoundEffectSheepName = "Audio_SoundEffect_Sheep-bleating-dry-grass-77954_7"
		
		22:
			audioSoundEffectSheepName = "Audio_SoundEffect_Sheep-bleating-dry-grass-77954_8"
		
		23:
			audioSoundEffectSheepName = "Audio_SoundEffect_Sheep_goat-56125_10"
		
		24:
			audioSoundEffectSheepName = "Audio_SoundEffect_Sheep_goat-56125_11"
		
		25:
			audioSoundEffectSheepName = "Audio_SoundEffect_Sheep_goat-56125_12"
		
		26:
			audioSoundEffectSheepName = "Audio_SoundEffect_Sheep_goat-56125_13"
		
		27:
			audioSoundEffectSheepName = "Audio_SoundEffect_Sheep_goat-56125_14"
		
		28:
			audioSoundEffectSheepName = "Audio_SoundEffect_Sheep_goat-56125_15"
		
		29:
			audioSoundEffectSheepName = "Audio_SoundEffect_Sheep_goat-56125_16"
		
		30:
			audioSoundEffectSheepName = "Audio_SoundEffect_Sheep_goat-56125_17"
		
		31:
			audioSoundEffectSheepName = "Audio_SoundEffect_Sheep_goat-56125_2"
		
		32:
			audioSoundEffectSheepName = "Audio_SoundEffect_Sheep_goat-56125_3"
		
		33:
			audioSoundEffectSheepName = "Audio_SoundEffect_Sheep_goat-56125_4"
		
		34:
			audioSoundEffectSheepName = "Audio_SoundEffect_Sheep_goat-56125_5"
		
		35:
			audioSoundEffectSheepName = "Audio_SoundEffect_Sheep_goat-56125_6"
		
		36:
			audioSoundEffectSheepName = "Audio_SoundEffect_Sheep_goat-56125_7"
		
		37:
			audioSoundEffectSheepName = "Audio_SoundEffect_Sheep_goat-56125_8"
		
		38:
			audioSoundEffectSheepName = "Audio_SoundEffect_Sheep_goat-56125_9"
		
		AUDIO_SOUND_EFFECT_SHEEP_ID_MAX:
			audioSoundEffectSheepName = "Audio_SoundEffect_sheep-1-89229"
	
	return audioSoundEffectSheepName

func GetAudioSoundEffectSheepNameByAvatarTypeID(avatarTypeID: int) -> String:
	var ID: int = (avatarTypeID % AUDIO_SOUND_EFFECT_SHEEP_ID_MAX) + 1
	
	return GetAudioSoundEffectSheepNameByID(ID)

const AUDIO_SOUND_EFFECT_SHEEP_LAMB_ID_MAX: int = 3
func GetAudioSoundEffectSheepLambNameByID(ID: int) -> String:
	var audioSoundEffectSheepName: String = ""
	match ID:
		1:
			audioSoundEffectSheepName = "Audio_SoundEffect_Sheep-bleating-dry-grass-77954_Lamb_13"
		
		2:
			audioSoundEffectSheepName = "Audio_SoundEffect_Sheep-bleating-dry-grass-77954_Lamb_9"
		
		AUDIO_SOUND_EFFECT_SHEEP_LAMB_ID_MAX:
			audioSoundEffectSheepName = "Audio_SoundEffect_Sheep_lamb-and-mother-88704_2"
	
	return audioSoundEffectSheepName

func GetAudioSoundEffectSheepLambNameByAvatarTypeID(avatarTypeID: int) -> String:
	var ID: int = (avatarTypeID % AUDIO_SOUND_EFFECT_SHEEP_LAMB_ID_MAX) + 1
	
	return GetAudioSoundEffectSheepLambNameByID(ID)

func GetAudioSoundEffectSheepLabelNumberName() -> String:
	var n: int = HQH.RandomD3() + 2
	var audioSoundEffectSheepLabelNumberName: String = "Audio_SoundEffect_TennisBallBeingHit_%s" % n
	
	return audioSoundEffectSheepLabelNumberName

func GetAudioSoundEffectWhooshName() -> String:
	var n: int = HQH.RandomD3() + 2
	var audioSoundEffectWhooshName: String = "Audio_SoundEffect_Whoosh_%s" % n
	
	return audioSoundEffectWhooshName

func GetRandomGoodsTypeIDWig() -> int:
	return GOODSTYPEID_WIG_LIST[HQH.Random0Max(GOODSTYPEID_WIG_LIST.size() - 1)]
