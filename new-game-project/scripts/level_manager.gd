class_name LevelManager extends Node

@export var rules : Node

var current_level : int

signal level_reset

var levels : Array[LevelData] = [
	preload("res://testing/lexie/test_level.tres")
]

func next_level_or_win():
	if current_level + 1 == levels.size():
		print("win")
	else:
		load_level(current_level + 1)
	
func reset_level():
	GameState.player.set_player_position(levels[current_level].player_starting_position)
	#TODO: grid things??
	
	level_reset.emit()


func load_level(i : int):
	current_level = i
	
	for c in rules.get_children():
		c.queue_free()
	
	for rule in levels[current_level].rules:
		rules.add_child(rule.instantiate())
	
	GameState.grid.spawn_grid(levels[current_level])
	
	reset_level()
