extends Control

@export var time_label : Label
@export var deaths_label : Label

func format_time(seconds: float) -> String:
	var minutes = int(seconds / 60)
	var secs = int(seconds) % 60
	var milli = abs(seconds - int(seconds)) * 1000
	return "%02d:%02d.%04d" % [minutes, secs, milli]
	
func _ready() -> void:
	time_label.set_text(format_time(GameState.end_time))
	deaths_label.set_text(str(GameState.deaths))
