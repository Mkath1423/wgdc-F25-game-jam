extends Node2D

var levels : Array[LevelData] = [
	preload("res://testing/lexie/test_level.tres")
]

var current_level : int

var step_distance : int = 1

var step : int
var player_position : Vector2i 

func set_player_position(pos : Vector2i):
	player_position = pos
	$player.global_position = $grid.get_grid_pos(player_position)

signal player_position_updated
signal player_stepped

signal level_reset
signal player_died

var spin : int = 0

const DIRECTIONS  = [
	Vector2i( 0,  1),
	Vector2i(-1,  0),
	Vector2i( 0, -1),
	Vector2i( 1,  0)
]

func _ready() -> void:
	load_level(0)


func _process(deltatime : float):
	if Input.is_action_just_pressed("move_up"):
		step_player(DIRECTIONS[(0 + spin) % 4])
		
	if Input.is_action_just_pressed("move_left"):
		step_player(DIRECTIONS[(1 + spin) % 4])
		
	if Input.is_action_just_pressed("move_down"):
		step_player(DIRECTIONS[(2 + spin) % 4])
		
	if Input.is_action_just_pressed("move_right"):
		step_player(DIRECTIONS[(3 + spin) % 4])
		
	if Input.is_action_just_pressed("reset"):
		reset_level()
		

func step_player(move_dir : Vector2i):
	set_player_position(player_position + move_dir * step_distance)
	
	if not $grid.is_in_grid(player_position):
		kill_player()
		return
	
	player_position_updated.emit()
	
	step += 1
	player_stepped.emit()


func kill_player():
	print("died")
	player_died.emit()
	reset_level()
	

func next_level_or_win():
	if current_level + 1 == levels.size():
		print("win")
	else:
		load_level(current_level + 1)
	
func reset_level():
	set_player_position(levels[current_level].player_starting_position)
	#TODO: grid things??
	
	level_reset.emit()


func load_level(i : int):
	current_level = i
	
	for c in $rules.get_children():
		c.queue_free()
	
	for rule in levels[current_level].rules:
		$rules.add_child(rule.instantiate())
	
	$grid.grid_size = levels[current_level].grid_size
	reset_level()
