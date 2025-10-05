class_name Player extends Node2D

var spin : int
var step : int

var player_position : Vector2i 

signal player_position_updated
signal player_stepped
signal player_died

func _process(_delta: float) -> void:	
	if Input.is_action_just_pressed("reset"):
		GameState.level_manager.reset_level()

func reset():
	step = 1

func set_player_position(pos : Vector2i):
	player_position = pos
	self.global_position = GameState.grid.get_grid_pos(player_position)
	
func step_player(move_dir : Vector2i):
	set_player_position(player_position + move_dir)
	
	if not GameState.grid.is_in_grid(player_position):
		call_deferred("kill_player")
	
	player_position_updated.emit()
	
	step += 1
	player_stepped.emit()


func kill_player():
	player_died.emit()
	GameState.level_manager.reset_level()
	GameState.deaths += 1
