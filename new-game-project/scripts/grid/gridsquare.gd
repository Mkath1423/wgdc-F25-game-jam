class_name GridSquare extends Node2D

@onready var sprite : Sprite2D = $Sprite2D

@export var inPath: bool
@export var isHidden: bool
@export var gridx: int
@export var gridy: int

@export var base_color : Color

func _ready() -> void:
	clear()

func clear():
	set_color(base_color)

func set_color(color : Color):
	sprite.modulate = color 

func updateone():
	if isHidden:
		self.transform.rotated(90)
	if !inPath:
		scale.y = -1
	else:
		scale.y = 1
