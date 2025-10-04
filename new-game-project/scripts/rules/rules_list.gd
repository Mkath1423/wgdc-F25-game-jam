class_name RulesList extends Control

@onready var rules : VBoxContainer = $VBoxContainer/HSeparator/items

var rule : PackedScene = preload("res://scenes/ui/rule.tscn")

func load_rules(n : int):
	for i in range(n - rules.get_child_count()):
		var tmp = rule.instantiate()
		rules.add_child(tmp)


func get_rule(i : int) -> Rule:
	return rules.get_child(i)


func clear_rules():
	for c in rules.get_children():
		if c is Rule:
			c.clear()
