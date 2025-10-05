class_name RulesList extends Control

@export var rules : VBoxContainer

var rule : PackedScene = preload("res://scenes/ui/rule.tscn")

func load_rules(n : int):
	for i in range(n - rules.get_child_count()):
		var tmp = rule.instantiate()
		rules.add_child(tmp)
		
	print(rules.get_child_count())


func get_rule(i : int) -> RuleUI:
	return rules.get_child(i)


func clear_rules():
	for c in rules.get_children():
		if c is RuleUI:
			c.clear()
