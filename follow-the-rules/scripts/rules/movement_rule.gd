class_name MovementRule extends BaseRule

@export var direction : DIRECTION

func init():
	super.init()

const dir_vectors  = {
	DIRECTION.RIGHT: Vector2i( 1,  0),
	DIRECTION.UP: Vector2i( 0,  1),
	DIRECTION.LEFT: Vector2i(-1,  0),
	DIRECTION.DOWN: Vector2i( 0, -1)
}

const dir_actions = {
	DIRECTION.RIGHT: "move_right",
	DIRECTION.UP: "move_up",
	DIRECTION.LEFT: "move_left",
	DIRECTION.DOWN: "move_down"
}

enum DIRECTION {
	RIGHT = 0,
	UP = 1, 
	LEFT = 2, 
	DOWN = 3,
} 

func _process(_delta : float):
	if Input.is_action_just_pressed(dir_actions[direction]):
		
		var dir : int = direction as int
		
		if opposite:
			dir = (dir + 2) % 4
		
		var spin = GameState.player.spin + GameState.rules_manager.player_spin(dir)
		dir = posmod(dir + spin, 4)
		print("mover", spin)
		GameState.player.last_spin = spin 
		GameState.player.step_player(
			dir_vectors[dir] * GameState.rules_manager.player_speed(dir))
