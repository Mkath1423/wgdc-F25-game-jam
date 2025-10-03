class_name Grid extends Node2D

@export var grid_size : Vector2i
@export var cell_size : Vector2
@export var cell_padding : Vector2

func add_children(children: Array) -> void:
	var i = 0
	for child in children:
		if child.get_parent() != null:
			child.get_parent().remove_child(child)
		
		add_child(child)
		child.global_position = get_grid_pos(
			Vector2i(
				i % grid_size.x,
				floor(i / grid_size.y)
			))
		i += 1

func is_in_grid(grid_pos : Vector2i) -> bool:
	return grid_pos.x >= 0 and grid_pos.y >= 0 and \
		grid_pos.x < grid_size.x and grid_pos.y < grid_size.y

func get_grid_pos(grid_pos : Vector2i) -> Vector2i:
	return global_position + Vector2(grid_pos) * (Vector2(1, -1) * cell_size + cell_padding)
