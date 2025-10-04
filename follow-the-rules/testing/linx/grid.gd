class_name GridPlace extends Node2D

@export var grid_size : Vector2i
@export var cell_size : Vector2
@export var cell_padding : Vector2

var spawnedgrid = false

func add_children(children: Array) -> void:
	for child in children:
		if child.get_parent() != null:
			child.get_parent().remove_child(child)
		
		add_child(child)
		child.global_position = get_grid_pos(
			Vector2i(
				child.gridx,
				child.gridy
			))

func _process(delta: float):
	if ($"../player" != null and !spawnedgrid):
		print("helo")
		var my_resource_instance: LevelData = load("testing/lexie/test_level.tres")
		spawn_grid(my_resource_instance)
		print("hello world")
		spawnedgrid = true

func spawn_grid(data: LevelData) -> void:
	var arr = []
	for i in range(data.grid_size.x):
		for j in range(data.grid_size.y):
			var tmp = $"../path".duplicate()
			
			# looking to see if it is part of path
			var inpath = false
			for p in data.path:
				if p.x == i and p.y == j:
					inpath = true
					break
					
			if data.pathHidden:
				tmp.isHidden = true
			if inpath:
				tmp.inPath = true
			tmp.gridx = i
			tmp.gridy = j
			tmp.updateone()
			arr.append(tmp)
	add_children(arr)
	

func is_in_grid(grid_pos : Vector2i) -> bool:
	return grid_pos.x < 0 or grid_pos.y < 0 or \
		grid_pos.x >= grid_size.x or grid_pos.y >= grid_size.y

# (takes in coordinate and returns global position)
func get_grid_pos(grid_pos : Vector2i) -> Vector2i:
	return global_position + Vector2(grid_pos) * (Vector2(1, -1) * cell_size + cell_padding)
