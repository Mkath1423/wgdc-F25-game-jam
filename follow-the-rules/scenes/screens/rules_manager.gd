class_name RulesManager extends Node

func player_speed(direction: MovementRule.DIRECTION) -> int:
	var speed = 1
	
	for rule in get_children():
		if rule is BaseRule:
			speed += rule.speed_bonus(direction, GameState.player.step)
			
	return speed


func player_spin(direction: MovementRule.DIRECTION) -> int:
	var spin = 0
	
	for rule in get_children():
		if rule is BaseRule:
			spin += rule.spin_bonus(direction, GameState.player.step)
	GameState.player.last_spin = spin
	
	return spin
