extends BaseRule

@export var step_size_bonus : int
@export var cycle_length : int
@export var cycle_offset : int
@export var directions : Array[MovementRule.DIRECTION]

func speed_bonus(direction : MovementRule.DIRECTION, step : int):
	if directions != null and directions.size() != 0 and directions.count(direction) == 0:
		return 0
		
	return step_size_bonus if (step + cycle_offset) % cycle_length == 0 else 0
		
		
