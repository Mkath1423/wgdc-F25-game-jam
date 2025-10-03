extends Node2D


var step_distance : int = 1

var step : int
var player_position : Vector2i 

signal player_position_updated
signal player_stepped

var spin : int = 0

const DIRECTIONS  = [
	Vector2i( 0,  1),
	Vector2i(-1,  0),
	Vector2i( 0, -1),
	Vector2i( 1,  0)
]

func _process(deltatime : float):
	if Input.is_action_just_pressed("move_up"):
		step_player(DIRECTIONS[(0 + spin) % 4])
		
	if Input.is_action_just_pressed("move_left"):
		step_player(DIRECTIONS[(1 + spin) % 4])
		
	if Input.is_action_just_pressed("move_down"):
		step_player(DIRECTIONS[(2 + spin) % 4])
		
	if Input.is_action_just_pressed("move_right"):
		step_player(DIRECTIONS[(3 + spin) % 4])
		
	

func step_player(move_dir : Vector2i):
	player_position += move_dir * step_distance
	
	$player.global_position = $grid.get_grid_pos(player_position)
	step += 1
	
	player_stepped.emit()
	player_position_updated.emit()
	
