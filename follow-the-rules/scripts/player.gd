class_name Player extends Node2D

var spin : int
var step : int

var player_position : Vector2i 

signal player_position_updated
signal player_stepped
signal player_died

var idle : bool = true

@export var idle_texture: Texture2D
@export var walk_textures: Array[Texture2D]

func _ready():
	$Timer.timeout.connect(reset_idle)

func reset_idle():
	idle = true

func _process(_delta: float) -> void:	
	if not idle:
		$Sprite2D.texture = walk_textures[step % walk_textures.size()]
	else:
		$Sprite2D.texture = idle_texture
	
	if Input.is_action_just_pressed("reset"):
		GameState.level_manager.reset_level()

func reset():
	step = 1
	idle = true

func set_player_position(pos : Vector2i):
	player_position = pos
	self.global_position = GameState.grid.get_grid_pos(player_position)
	$"."
func step_player(move_dir : Vector2i):
	set_player_position(player_position + move_dir)
	
	GameState.grid.get_grid_object(player_position).isHidden = false
		
	if not GameState.grid.is_in_grid(player_position):
		call_deferred("kill_player")
	
	player_position_updated.emit()
	
	step += 1
	idle = false
	$Timer.start()
	player_stepped.emit()


func kill_player():
	player_died.emit()
	GameState.level_manager.reset_level()
	GameState.deaths += 1
