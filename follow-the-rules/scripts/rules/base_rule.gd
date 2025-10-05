class_name BaseRule extends Node

@export var rule_text : String
@export var idx : int
@export var default_ignored : bool = false
@export var default_opposite : bool = false

var ignored : bool = default_ignored
var opposite : bool = default_opposite

#func _ready() -> void:
	#ignored = default_ignored
	#opposite = default_opposite

func init():
	GameState.rules_list.get_rule(idx).set_text(rule_text)

func speed_bonus(_direction : MovementRule.DIRECTION, _step : int):
	return 0
	
func spin_bonus(_direction : MovementRule.DIRECTION, _step : int):
	return 0
	
