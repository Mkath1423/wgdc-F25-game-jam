extends VBoxContainer

@export var time : Label
@export var deaths : Label
@export var level : Label
@export var steps : Label

func format_time(seconds: float) -> String:
	var minutes = int(seconds / 60)
	var secs = int(seconds) % 60
	return "%02d:%02d" % [minutes, secs]

func _process(_delta):
	if time != null:
		time.set_text(format_time(GameState.end_time))
	
	if deaths != null:
		deaths.set_text(str(GameState.deaths))
		
	if level != null:
		level.set_text(str(GameState.level_manager.current_level_idx + 1))
		
	if steps != null:
		steps.set_text(str(GameState.player.step))
	
	 
