class_name Flag extends Node2D

var flag_position : Vector2i 

signal flag_position_updated

func set_flag_position(pos : Vector2i):
	flag_position = pos
	self.global_position = GameState.grid.get_grid_pos(flag_position)
	flag_position_updated.emit()
