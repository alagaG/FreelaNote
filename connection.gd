@tool
class_name Line
extends Line2D

@export var start_node : Block :
	set = set_starting_node
@export var end_node : Block :
	set = set_ending_node

func set_starting_node(value:Block) -> void:
	if start_node: start_node.destroy_connection(self)
	start_node = value
	if start_node: start_node.create_connection(self)
	update_line()

func set_ending_node(value:Block) -> void:
	if end_node: end_node.destroy_connection(self)
	end_node = value
	if end_node: end_node.create_connection(self)
	update_line()

func update_line() -> void:
	points = PackedVector2Array([ 
		start_node.global_position + start_node.size / 2 if start_node else Vector2.ZERO, 
		end_node.global_position + end_node.size / 2 if end_node else Vector2.ZERO
		])
