class_name LevelManager extends Node

@export var rules : Node

var current_level_idx : int
var current_level : LevelData

var levels : Array[LevelData] = [
	preload("res://levels/level2.tres"),
	preload("res://levels/level3.tres")
]

var end_screen : PackedScene = preload("res://scenes/screens/end.tscn")

func _process(delta: float) -> void:
	GameState.end_time += delta

func next_level_or_win():
	if current_level_idx + 1 == levels.size():
		get_tree().change_scene_to_packed(end_screen)
	else:
		load_level(current_level_idx + 1)


func reset_level():
	GameState.player.set_player_position(current_level.player_starting_position)
	GameState.player.reset()
	
	GameState.flag.set_flag_position(current_level.flag_starting_position)


func load_level(i : int):
	current_level_idx = i
	current_level = levels[current_level_idx]
	for c in rules.get_children():
		c.queue_free()
		
	GameState.rules_list.load_rules(current_level.rules.size())
	
	var rule_idx : int = 0
	for rule in levels[current_level_idx].rules:
		var tmp = rule.instantiate()
		if tmp is BaseRule:
			tmp.idx = rule_idx
			rule_idx += 1
			rules.add_child(tmp)
	
	GameState.grid.spawn_grid(current_level)
	
	for rule in rules.get_children():
		if rule is BaseRule:
			rule.init()
	
	reset_level()
