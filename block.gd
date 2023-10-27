@tool
class_name Block
extends PanelContainer

@export var title : String :
	set = set_title
@export var text : String = "" :
	set = set_text
@export var connect_to : Block :
	set = instance_connection

@onready var title_label : Label = $Margin/Divisor/title
@onready var text_area : TextEdit = $Margin/Divisor/TextEdit

var connections : Array = []
var last_pos : Vector2 = global_position

signal moved()

func _ready():
	set_title(title)
	set_text(text)


func _physics_process(delta):
	if global_position != last_pos: emit_signal("moved")
	last_pos = global_position


func set_title(value:String) -> void:
	title = value
	if title_label: title_label.text = value


func set_text(value:String) -> void:
	text = value
	if text_area: text_area.text = value


func instance_connection(value:Block) -> void:
	var instance = Line.new()
	instance.start_node = self
	instance.end_node = value
	get_parent().get_parent().get_child(1).add_child(instance)


func create_connection(line:Line) -> void:
	if line != null and not line in connections: 
		connections.push_back(line)
		connect("moved", line.update_line)


func destroy_connection(line:Line) -> void:
	print(connections)
	if line != null and line in connections: 
		connections.erase(line)
		disconnect("moved", line.update_line)
