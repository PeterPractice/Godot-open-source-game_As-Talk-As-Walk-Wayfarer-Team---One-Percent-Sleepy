extends KinematicBody2D
class_name KinematicBody2DAvatarBase

var m_AvatarBehaviorType: int = AvatarManager.AVATAR_BEHAVIOR_TYPE.NONE

var m_CurrentAvatarState: int = 0
#For each Avatar State, also need 3 function(example: IDLE):
#func CheckStateIn_IDLE()
#func ChangeToState_IDLE()
#func DoStateActionIn_IDLE()
var m_CurrentAvatarState_DoStateActionCount: int = 0

var m_AvatarObjectID: int = 0 # 0: invalid ID. 1-n: valid ID.
var m_AvatarTypeID: int = 0

func _ready():
	self.SetAvatarObjectID(AvatarManager.GetAvatarObjectIDEmitter())

	self.input_pickable = true

func SetCurrentActive():
#	$camera2D1.make_current()
	
	CameraManager.MountCurrentCamera()

func SetCurrentUnactive():
	CameraManager.UnmountCurrentCamera()

func SetPosition(newPosition: Vector2):
	self.position = newPosition

func AddPosition(moveStep: Vector2):
	self.position = self.position + moveStep

func SetScale(newScale: Vector2):
	self.scale = newScale

func GetPosition() -> Vector2:
	return self.position

func GetName() -> String:
	return self.name

func SetAvatarObjectID(newID: int):
	m_AvatarObjectID = newID

func GetAvatarObjectID() -> int:
	return m_AvatarObjectID

func SetAvatarTypeID(newID: int):
	m_AvatarTypeID = newID

func GetAvatarTypeID() -> int:
	return m_AvatarTypeID

func ReparentAndMoveTo0(newParent: Node2D):
	get_parent().remove_child(self)
	newParent.add_child(self)
	newParent.move_child(self, 0)

func SetInvalid():
	self.visible = false

func SetValid():
	self.visible = true

func GetValid() -> bool:
	return self.visible

func SetAvatarBehaviorType(avatarBehaviorType: int):
	m_AvatarBehaviorType = avatarBehaviorType

func GetAvatarBehaviorType() -> int:
	return m_AvatarBehaviorType

func ShowOutlineFunction(spriteMaterial: Material, outlineColor: Color):
	if spriteMaterial:
		spriteMaterial.shader = TableManager.Get_PRELOAD_RESOURCE_MAP("Shader_SpriteOutline")
		var OUTLINE_WIDTH: float = 1.0
		spriteMaterial.set_shader_param("outline_width", OUTLINE_WIDTH)
		spriteMaterial.set_shader_param("outline_color", outlineColor)

func HideOutlineFunction(spriteMaterial: Material):
	if spriteMaterial:
		spriteMaterial.shader = null

func SetRandomModulate(randomValueMin: int, randomValueMax: int = HQH.COLOR_VALUE_MAX):
	var randomValue: int = HQH.RandomModRange(randomValueMin, randomValueMax)
	self.modulate = Color8(randomValue, randomValue, randomValue)

func GetModulate() -> Color:
	return self.modulate
