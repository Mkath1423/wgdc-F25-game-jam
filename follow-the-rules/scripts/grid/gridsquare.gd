class_name GridSquare extends Node2D

@onready var sprite : Sprite2D = $Sprite2D

@export var inPath: bool
@export var isHidden: bool
@export var gridx: int
@export var gridy: int

@export var base_color : Color

@export var gridTextures: Array[Texture2D]

func _ready() -> void:
	clear()
	#sprite.texture = gridTextures[0]
	
func _process(delta: float):
	if isHidden:
		sprite.texture = gridTextures[0]
	else:
		if !inPath:
			sprite.texture = gridTextures[1]
		else:
			sprite.texture = gridTextures[2]

func clear():
	set_color(base_color)

func set_color(color : Color):
	sprite.modulate = color 

#func updateone():
#	if isHidden:
#		sprite.texture = gridTextures[0]
#	if !inPath:
#		sprite.texture = gridTextures[1]
#	else:
#		sprite.texture = gridTextures[2]
