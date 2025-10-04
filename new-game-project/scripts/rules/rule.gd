class_name Rule extends Control

@onready var label : Label = $Label


func clear():
	set_text("")
	
	
func set_text(str : String):
	label.set_text(str)
