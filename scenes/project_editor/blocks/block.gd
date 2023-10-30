@tool
class_name AbstractBlock
extends Control


# Exports
@export var setup_as_editor : bool = false :
	set = _editor_set_setup
@export var reset_properties : bool = false :
	set = _editor_reset
# Vars
var identifiers : int = -1


func _ready() -> void:
	if setup_as_editor and Engine.is_editor_hint():
		_editor_ready()


func _editor_ready() -> void:
	pass


func _input(event:InputEvent) -> void:
	if event is InputEventMouseButton:
		pass


func _editor_set_setup(value:bool) -> void:
	setup_as_editor = value
	if setup_as_editor: _editor_ready()


func _editor_reset(value:bool) -> void:
	reset()


func reset() -> void:
	pass


func get_type() -> String:
	return "null"


func get_class() -> String:
	return "Block"

