extends Control

@onready var button = $VBoxContainer/Button

var main : PackedScene = preload("res://scenes/screens/main.tscn")

func _ready() -> void:
	button.pressed.connect(handle)
	
func handle():
	get_tree().change_scene_to_packed(main)
