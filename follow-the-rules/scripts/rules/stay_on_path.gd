extends BaseRule

func init():
	GameState.player.player_stepped.connect(on_player_step)
	super.init()

func on_player_step():
	if ignored:
		return
		
	if opposite == GameState.level_manager.current_level.in_path(GameState.player.player_position):
		GameState.player.kill_player()
