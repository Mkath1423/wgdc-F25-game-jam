class_name Grid extends Node2D

@export var grid_size : Vector2i
@export var cell_size : Vector2
@export var cell_padding : Vector2

@export var tile_scene : PackedScene = preload("res://scenes/tiles/tile.tscn")

@export var gridArray : Array[Node2D]

func spawn_grid(data: LevelData) -> void:
	grid_size = data.grid_size
	gridArray.clear()
	
	for i in range(data.grid_size.x):
		for j in range(data.grid_size.y):
			var tmp = tile_scene.instantiate()
					
			if data.pathHidden:
				tmp.isHidden = true
			
			if data.in_path(Vector2i(i, j)):
				tmp.inPath = true
			
			tmp.gridx = i
			tmp.gridy = j
						
			gridArray.append(tmp)
			add_child(tmp)
			tmp.global_position = get_grid_pos(Vector2i(i, j))


func is_in_grid(grid_pos : Vector2i) -> bool:
	return grid_pos.x >= 0 and grid_pos.y >= 0 and \
		grid_pos.x < grid_size.x and grid_pos.y < grid_size.y

func get_grid_pos(grid_pos : Vector2i) -> Vector2i:
	return global_position + Vector2(grid_pos) * (Vector2(1, -1) * cell_size + cell_padding)

func get_grid_object(grid_pos : Vector2i) -> Node2D:
	return gridArray[grid_size.x * grid_pos.x + grid_pos.y]
