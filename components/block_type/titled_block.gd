@tool
class_name TitledBlock
extends ClassicBlock


# Export
@export var title : String = "" :
	set = set_title, get = get_title
@export var alignment_x : HorizontalAlignment = HORIZONTAL_ALIGNMENT_LEFT :
	set = set_alignment_x, get = get_alignment_x
@export var alignment_y : VerticalAlignment = VERTICAL_ALIGNMENT_TOP :
	set = set_alignment_y, get = get_alignment_y
# Nodes
@onready var title_node : Label = $Panel/Margin/VBox/Title


func _editor_ready() -> void:
	super()
	title = "Title Comes Here"


func reset() -> void:
	super()
	title = ""
	alignment_x = HORIZONTAL_ALIGNMENT_LEFT
	alignment_y = VERTICAL_ALIGNMENT_TOP


func get_title() -> String:
	return title_node.text if title_node else ""


func set_title(value:String) -> void:
	if title_node:
		title_node.text = value


func get_alignment_x() -> HorizontalAlignment:
	return title_node.horizontal_alignment if title_node else HORIZONTAL_ALIGNMENT_LEFT


func set_alignment_x(value:HorizontalAlignment) -> void:
	if title_node:
		title_node.horizontal_alignment = value


func get_alignment_y() -> VerticalAlignment:
	return title_node.vertical_alignment if title_node else HORIZONTAL_ALIGNMENT_LEFT


func set_alignment_y(value:VerticalAlignment) -> void:
	if title_node:
		title_node.vertical_alignment = value
