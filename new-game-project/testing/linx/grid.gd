class_name GridPlace extends Node2D

@export var grid_size : Vector2i
@export var cell_size : Vector2
@export var cell_padding : Vector2

var spawnedgrid = false

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

func _process(delta: float):
	if ($"../player" != null and !spawnedgrid):
		print("hello world")
		spawngrid([$"../player".duplicate(), $"../player".duplicate()])
		spawnedgrid = true

func spawngrid(elementsList: Array) -> void:
	var player_node = $"../player"
	elementsList = [player_node.duplicate(), player_node.duplicate()]
	add_children(elementsList)
	

func is_in_grid(grid_pos : Vector2i) -> bool:
	return grid_pos.x < 0 or grid_pos.y < 0 or \
		grid_pos.x >= grid_size.x or grid_pos.y >= grid_size.y

# (takes in coordinate and returns global position)
func get_grid_pos(grid_pos : Vector2i) -> Vector2i:
	return global_position + Vector2(grid_pos) * (Vector2(1, -1) * cell_size + cell_padding)
