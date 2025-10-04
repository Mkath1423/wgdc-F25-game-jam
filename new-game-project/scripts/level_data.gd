class_name LevelData extends Resource

@export var rules : Array[PackedScene]

@export var grid_size : Vector2i

@export var player_starting_position : Vector2
@export var flag_starting_position   : Vector2
@export var path : Array[Vector2i]
@export var pathHidden : bool

func in_path(pos : Vector2i ) -> bool:
	for p in path:
		if p == pos:
			return true
			
	return false
