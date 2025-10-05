extends BaseRule

@export var spin_inc : int
@export var cycle_length : int
@export var cycle_offset : int
@export var directions : Array[MovementRule.DIRECTION]

func spin_bonus(direction : MovementRule.DIRECTION, step : int):
	if directions != null and directions.size() != 0 and directions.count(direction) == 0:
		return 0
		
	return spin_inc * int(max(step - 1, 0) / 3) 
		
		
