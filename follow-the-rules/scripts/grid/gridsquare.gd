class_name GridSquare extends Node2D

@onready var sprite : Sprite2D = $Sprite2D

@export var inPath: bool
@export var isHidden: bool
@export var gridx: int
@export var gridy: int


@export var gridTextures: Array[Texture2D]

func _ready() -> void:
	set_texture()
	
func _process(_delta: float):
	set_texture()
	
func set_texture():
	if isHidden:
		sprite.texture = gridTextures[0]
	else:
		if !inPath:
			sprite.texture = gridTextures[1]
		else:
			sprite.texture = gridTextures[2]
	


#func updateone():
#	if isHidden:
#		sprite.texture = gridTextures[0]
#	if !inPath:
#		sprite.texture = gridTextures[1]
#	else:
#		sprite.texture = gridTextures[2]
