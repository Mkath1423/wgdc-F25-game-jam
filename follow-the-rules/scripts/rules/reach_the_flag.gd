extends BaseRule

func init():
	GameState.player.player_position_updated.connect(handle)
	super.init()

func handle():
	if ignored:
		return
		
	if opposite != (GameState.player.player_position == GameState.flag.flag_position):
		GameState.level_manager.next_level_or_win()
