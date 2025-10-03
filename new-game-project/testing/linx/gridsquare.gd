class_name GridSquare extends Node2D

@export var inPath: bool
@export var isHidden: bool
@export var gridx: int
@export var gridy: int

func updateone():
	if isHidden:
		self.transform.rotated(90)
	if !inPath:
		scale.y = -1
	else:
		scale.y = 1
