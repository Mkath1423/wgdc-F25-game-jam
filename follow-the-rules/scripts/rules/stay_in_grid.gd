extends BaseRule

func init():
	GameState.player.player_stepped.connect(on_player_step)

func on_player_step():
	if ignored:
		return
		
	if opposite and GameState.grid.is_in_grid(GameState.player.player_position):
		GameState.player.kill_player()
		
