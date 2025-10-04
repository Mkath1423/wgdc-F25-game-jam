class_name Player extends Node2D

var step_distance : int = 1

var spin : int
var step : int

var player_position : Vector2i 

signal player_position_updated
signal player_stepped
signal player_died

const DIRECTIONS  = [
	Vector2i( 0,  1),
	Vector2i(-1,  0),
	Vector2i( 0, -1),
	Vector2i( 1,  0)
]

func set_player_position(pos : Vector2i):
	player_position = pos
	self.global_position = GameState.grid.get_grid_pos(player_position)


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
		GameState.level_manager.reset_level()

func step_player(move_dir : Vector2i):
	set_player_position(player_position + move_dir * step_distance)
	
	if not GameState.grid.is_in_grid(player_position):
		kill_player()
		return
	
	player_position_updated.emit()
	
	step += 1
	player_stepped.emit()


func kill_player():
	print("died")
	player_died.emit()
	GameState.level_manager.reset_level()
