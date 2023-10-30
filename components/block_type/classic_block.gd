@tool
class_name ClassicBlock
extends AbstractBlock


# Exports
@export_group("Rect")
@export var min_size : Vector2i = Vector2i.ZERO :
	set = set_min_size, get = get_min_size
@export var block_size : Vector2i = Vector2i.ZERO :
	set = set_block_size, get = get_block_size
@export_subgroup("Margins")
@export var margin_top : int = 0 :
	set = set_margin_top, get = get_margin_top
@export var margin_down : int = 0 :
	set = set_margin_down, get = get_margin_down
@export var margin_left : int = 0 :
	set = set_margin_left, get = get_margin_left
@export var margin_right : int = 0 :
	set = set_margin_right, get = get_margin_right
@export_group("Style")
@export var background : StyleBox = null :
	set = set_background_style, get = get_background_style
# Nodes
@onready var panel_node : PanelContainer = $Panel
@onready var margin_node : MarginContainer = $Panel/Margin


func _editor_ready() -> void:
	super()
	block_size = Vector2i(80, 160)
	margin_top = 10
	margin_down = 10
	margin_left = 10
	margin_right = 10


func reset() -> void:
	super()
	min_size = Vector2i(16, 16)
	block_size = Vector2i(0, 0)
	margin_top = 0
	margin_down = 0
	margin_left = 0
	margin_right = 0


func get_min_size() -> Vector2i:
	return panel_node.custom_minimum_size if panel_node else Vector2i.ZERO


func set_min_size(value:Vector2i) -> void:
	if panel_node:
		panel_node.custom_minimum_size = value


func get_block_size() -> Vector2i:
	return panel_node.size if panel_node else Vector2i.ZERO


func set_block_size(value:Vector2i) -> void:
	if panel_node:
		panel_node.size = value


func get_background_style() -> StyleBox:
	return panel_node.get_theme_stylebox("panel") if panel_node else null


func set_background_style(value:StyleBox) -> void:
	if panel_node:
		if value != null:
			panel_node.add_theme_stylebox_override("panel", value)
		else:
			panel_node.remove_theme_stylebox_override("panel")

func get_margin_top() -> int:
	return margin_node.get_theme_constant("margin_top") if margin_node else 0


func set_margin_top(value:int) -> void:
	if margin_node: 
		margin_node.add_theme_constant_override("margin_top", value)


func get_margin_down() -> int:
	return margin_node.get_theme_constant("margin_bottom") if margin_node else 0


func set_margin_down(value:int) -> void:
	if margin_node: 
		margin_node.add_theme_constant_override("margin_bottom", value)


func get_margin_left() -> int:
	return margin_node.get_theme_constant("margin_left") if margin_node else 0


func set_margin_left(value:int) -> void:
	if margin_node: 
		margin_node.add_theme_constant_override("margin_left", value)


func get_margin_right() -> int:
	return margin_node.get_theme_constant("margin_right") if margin_node else 0


func set_margin_right(value:int) -> void:
	if margin_node: 
		margin_node.add_theme_constant_override("margin_right", value)


func get_class() -> String:
	return name
