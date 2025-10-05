class_name Main extends Node

@export var player : Player
@export var grid : Grid
@export var flag : Flag
@export var rules_list : RulesList
@export var level_manager : LevelManager

func _ready() -> void:
	GameState.player = player
	GameState.grid = grid
	GameState.flag = flag
	GameState.rules_list = rules_list
	GameState.level_manager = level_manager
	
	level_manager.load_level(0)
